'use strict';
const ProcfsError = require('./lib/procfs-error');
const parsers = require('./lib/parsers');
const {
	read,
	readLink,
	readBuffer,
	readdir,
	devIdGetMinor,
	devIdGetMajor,
	devIdFromMajorMinor,
} = require('./lib/utils');

const processes = () => {
	try {
		return parsers.processes(readdir('/proc'));
	} catch (error) {
		/* istanbul ignore next should not ever happen when procfs exists */
		throw ProcfsError.generic(error);
	}
};

const processFds = pid => {
	if (pid !== undefined && (!Number.isInteger(pid) || pid <= 0)) {
		throw new TypeError('pid');
	}
	try {
		return parsers.processFds(readdir(((pid === undefined) ? '/proc/self' : '/proc/' + pid) + '/fd'));
	} catch (error) {
		throw ProcfsError.generic(error);
	}
};

const processThreads = pid => {
	if (pid !== undefined && (!Number.isInteger(pid) || pid <= 0)) {
		throw new TypeError('pid');
	}
	try {
		return parsers.processThreads(readdir(((pid === undefined) ? '/proc/self' : '/proc/' + pid) + '/task'));
	} catch (error) {
		throw ProcfsError.generic(error);
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
		throw ProcfsError.generic(error);
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
		return parsers.processFd(readLink(((pid === undefined) ? '/proc/self/fd/' : `/proc/${pid}/fd/`) + fd));
	} catch (error) {
		throw ProcfsError.generic(error);
	}
};

const config = () => {
	try {
		return parsers.config(readBuffer('/proc/config.gz'));
	} catch (error) {
		/* istanbul ignore next should not ever happen when procfs exists and kernel properly configured */
		throw ProcfsError.generic(error);
	}
};

const procfs = {
	processes,
	processFds,
	processThreads,
	processFdinfo,
	processFd,
	config,

	devIdGetMinor,
	devIdGetMajor,
	devIdFromMajorMinor,
};

for (let [name, path] of [
	['processExe', '/exe'],
	['processCwd', '/cwd'],
]) {
	procfs[name] = pid => {
		if (pid !== undefined && !(Number.isInteger(pid) && pid >= 0)) {
			throw new TypeError('pid');
		}
		try {
			return parsers[name](readLink(((pid === undefined) ? '/proc/self' : '/proc/' + pid) + path));
		} catch (error) {
			throw ProcfsError.generic(error);
		}
	};
}

for (let [name, path] of [
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
	['processPersonality', '/personality'],
	['processCgroups', '/cgroup'],
	['processCpuset', '/cpuset'],
	['processLimits', '/limits'],
	['processStat', '/stat'],
	['processStatus', '/status'],
	['processNetDev', '/net/dev'],
	['processNetWireless', '/net/wireless'],
	['processNetUnix', '/net/unix'],
	['processNetTcp4', '/net/tcp'],
	['processNetTcp6', '/net/tcp6'],
	['processNetUdp4', '/net/udp'],
	['processNetUdp6', '/net/udp6'],
]) {
	procfs[name] = pid => {
		if (pid !== undefined && !(Number.isInteger(pid) && pid >= 0)) {
			throw new TypeError('pid');
		}
		try {
			return parsers[name](read(((pid === undefined) ? '/proc/self' : '/proc/' + pid) + path));
		} catch (error) {
			throw ProcfsError.generic(error);
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
	'cgroups',
]) {
	procfs[name] = () => {
		try {
			return parsers[name](read('/proc/' + name));
		} catch (error) {
			/* istanbul ignore next should not ever happen when procfs exists */
			throw ProcfsError.generic(error);
		}
	};
}

for (let [name, parser, path] of [
	['netDev', 'processNetDev', 'net/dev'],
	['netWireless', 'processNetWireless', 'net/wireless'],
	['netUnix', 'processNetUnix', 'net/unix'],
	['netTcp4', 'processNetTcp4', 'net/tcp'],
	['netTcp6', 'processNetTcp6', 'net/tcp6'],
	['netUdp4', 'processNetUdp4', 'net/udp'],
	['netUdp6', 'processNetUdp6', 'net/udp6'],
]) {
	procfs[name] = () => {
		try {
			return parsers[parser](read('/proc/' + path));
		} catch (error) {
			/* istanbul ignore next should not ever happen when procfs exists */
			throw ProcfsError.generic(error);
		}
	};
}

module.exports = {
	procfs,
	ProcfsError,
};
