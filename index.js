'use strict';
const {gunzipSync} = require('zlib');

const parsers = require('./lib/parsers');
const {
	read,
	readLink,
	readBuffer,
	readdir,
	exists,
	devIdGetMinor,
	devIdGetMajor,
	devIdFromMajorMinor,
} = require('./lib/utils');

const procfsExists = exists('/proc');

const handleGenericError = err => {
	/* istanbul ignore else */
	if (err.code === 'ENOENT') {
		/* istanbul ignore if */
		if (!procfsExists) {
			throw new Error('procfs doesn\'t exist');
		}
		return undefined;
	}
	/* istanbul ignore next */
	throw err;
};

const processes = () => {
	try {
		return parsers.processes(readdir('/proc'));
	} catch (error) {
		/* istanbul ignore next */
		return handleGenericError(error);
	}
};

const processFds = pid => {
	if (pid !== undefined && (!Number.isInteger(pid) || pid <= 0)) {
		throw new TypeError('pid');
	}
	try {
		return parsers.processFds(readdir(((pid === undefined) ? '/proc/self' : '/proc/' + pid) + '/fd'));
	} catch (error) {
		return handleGenericError(error);
	}
};

const processThreads = pid => {
	if (pid !== undefined && (!Number.isInteger(pid) || pid <= 0)) {
		throw new TypeError('pid');
	}
	try {
		return parsers.processThreads(readdir(((pid === undefined) ? '/proc/self' : '/proc/' + pid) + '/task'));
	} catch (error) {
		return handleGenericError(error);
	}
};

const processFdinfo = (fd, pid) => {
	if (pid !== undefined && !(Number.isInteger(pid) && pid >= 0)) {
		throw new TypeError('pid');
	}
	if (!Number.isInteger(fd) || fd <= 0) {
		throw new TypeError('fd');
	}
	try {
		return parsers.processFdinfo(read(((pid === undefined) ? '/proc/self/fdinfo/' : `/proc/${pid}/fdinfo/`) + fd));
	} catch (error) {
		return handleGenericError(error);
	}
};

const processFd = (fd, pid) => {
	if (pid !== undefined && !(Number.isInteger(pid) && pid >= 0)) {
		throw new TypeError('pid');
	}
	if (!Number.isInteger(fd) || fd <= 0) {
		throw new TypeError('fd');
	}
	try {
		return readLink(((pid === undefined) ? '/proc/self/fd/' : `/proc/${pid}/fd/`) + fd);
	} catch (error) {
		return handleGenericError(error);
	}
};

const processExe = pid => {
	if (pid !== undefined && !(Number.isInteger(pid) && pid >= 0)) {
		throw new TypeError('pid');
	}
	try {
		return readLink(((pid === undefined) ? '/proc/self' : '/proc/' + pid) + '/exe', true);
	} catch (error) {
		return handleGenericError(error);
	}
};

const processCwd = pid => {
	if (pid !== undefined && !(Number.isInteger(pid) && pid >= 0)) {
		throw new TypeError('pid');
	}
	try {
		return readLink(((pid === undefined) ? '/proc/self' : '/proc/' + pid) + '/cwd', false);
	} catch (error) {
		return handleGenericError(error);
	}
};

const config = () => {
	try {
		return gunzipSync(readBuffer('/proc/config.gz')).toString('utf8');
	} catch (error) {
		/* istanbul ignore next */
		return handleGenericError(error);
	}
};

const procfs = {
	processes,
	processFds,
	processThreads,
	processFdinfo,
	processFd,
	processExe,
	processCwd,
	config,

	devIdGetMinor,
	devIdGetMajor,
	devIdFromMajorMinor,
};

for (let [name, path] of [
	['processMounts', '/mounts'],
	['processMountinfo', '/mountinfo'],
	['processIo', '/io'],
	['processUidMap', '/uid_map'],
	['processGidMap', '/gid_map'],
	['processEnviron', '/environ'],
	['processOomScore', '/oom_score'],
	['processTimerslackNs', '/timerslack_ns'],
	['processCmdline', '/cmdline'],
	['processAutogroup', '/autogroup'],
	['processStatm', '/statm'],
	['processComm', '/comm'],
	['processSetgroups', '/setgroups'],
	['processPersonality', '/personality'],
	['processCgroups', '/cgroup'],
	['processCpuset', '/cpuset'],
	['processLimits', '/limits'],
	['processStat', '/stat'],
	['processStatus', '/status'],
]) {
	procfs[name] = pid => {
		if (pid !== undefined && !(Number.isInteger(pid) && pid >= 0)) {
			throw new TypeError('pid');
		}
		try {
			return parsers[name](read(((pid === undefined) ? '/proc/self' : '/proc/' + pid) + path));
		} catch (error) {
			return handleGenericError(error);
		}
	};
}

for (let name of [
	'cpuinfo',
	'loadavg',
	'uptime',
	'version',
	'cmdline',
	'swaps',
	'stat',
	'devices',
	'filesystems',
	'diskstats',
	'partitions',
	'meminfo',
]) {
	procfs[name] = () => {
		try {
			return parsers[name](read('/proc/' + name));
		} catch (error) {
			/* istanbul ignore next */
			return handleGenericError(error);
		}
	};
}

module.exports = procfs;

//TODO [pid]/net/*
//TODO /net/*
//TODO fd deep info
//TODO /net/imgp ?
//TODO /net/dev_mcast ?
//TODO /net/wireless
//TODO rt signals
//TODO check bitfields
