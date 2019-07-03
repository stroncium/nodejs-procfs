const {RE_WS, splitLines} = require('./parsers/utils');

const trim = str => str.trim();
const parseHex = v => parseInt(v, 16);

const idMap = src => {
	let ls = splitLines(src, '\n');
	for (let i = 0; i < ls.length; i++) {
		let ps = ls[i].trim().split(RE_WS);
		ls[i] = {
			sourceStart: parseInt(ps[0]),
			destinationStart: parseInt(ps[1]),
			length: parseInt(ps[2]),
		};
	}
	return ls;
};

const processes = src => {
	let ls = [];
	let dstIdx = 0;
	for (let i = 0; i < src.length; i++) {
		let l = src[i];
		let ch = l.charCodeAt(0);
		if (ch >= 48 && ch <= 57) {
			ls[dstIdx++] = parseInt(src[i]);
		}
	}
	return ls;
};

const arrayParseInt = src => {
	let ls = [];
	let dstIdx = 0;
	for (let i = 0; i < src.length; i++) {
		ls[dstIdx++] = parseInt(src[i]);
	}
	return ls;
};

const processCmdline = src => splitLines(src, '\x00');

const processAutogroup = src => {
	let ps = src.split(' ');
	return {
		name: ps[0],
		nice: parseInt(ps[2]),
	};
};

const uptime = src => {
	let ps = src.split(' ');
	return {
		time: parseFloat(ps[0]),
		idle: parseFloat(ps[1]),
	};
};

const filesystems = src => {
	let ls = splitLines(src, '\n');
	for (let i = 0; i < ls.length; i++) {
		let ps = ls[i].trim().split(RE_WS);
		let nodev = ps.length === 2;
		ls[i] = {requiresBlockDevice: !nodev, name: ps[nodev ? 1 : 0]};
	}
	return ls;
};

const parsers = {
	processCmdline,
	processComm: trim,
	processCpuset: trim,
	processGidMap: idMap,
	processOomScore: parseInt,
	processPersonality: parseHex,
	processSetgroups: trim,
	processTimerslackNs: parseInt,
	processUidMap: idMap,
	version: trim,
	cmdline: trim,
	filesystems,
	processAutogroup,
	processes,
	processFds: arrayParseInt,
	processThreads: arrayParseInt,
	uptime,
};

for (let name of [
	'processMounts',
	'processMountinfo',
	'processIo',
	'processEnviron',
	'processStatm',
	'processCgroups',
	'processLimits',
	'processStat',
	'processStatus',
	'processFdinfo',

	'cpuinfo',
	'loadavg',
	'swaps',
	'stat',
	'devices',
	'diskstats',
	'partitions',
	'meminfo',
]) {
	parsers[name] = src => {
		parsers[name] = require(`./parsers/${name}`);
		return parsers[name](src);
	};
}

module.exports = parsers;
