const {RE_WS, splitLines} = require('./parsers/utils');

const identity = v => v;
const trim = str => str.trim();
const parseHex = v => parseInt(v, 16);

const idMap = src => {
	let ls = splitLines(src, '\n');
	for (let i = 0; i < ls.length; i++) {
		let ps = ls[i].trim().split(RE_WS);
		ls[i] = {
			targetStart: parseInt(ps[0]),
			start: parseInt(ps[1]),
			length: parseInt(ps[2]),
		};
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

const processCmdline = src => src.length === 0 ? null : splitLines(src, '\x00');

const parsers = {
	processCmdline,
	processComm: trim,
	processCpuset: trim,
	processGidMap: idMap,
	processOomScore: parseInt,
	processPersonality: parseHex,
	processTimerslackNs: parseInt,
	processUidMap: idMap,
	processCwd: identity,
	version: trim,
	cmdline: trim,
	processFds: arrayParseInt,
	processThreads: arrayParseInt,
};

for (let name of [
	'processAutogroup',
	'processCgroups',
	'processEnviron',
	'processExe',
	'processFd',
	'processFdinfo',
	'processIo',
	'processLimits',
	'processMountinfo',
	'processSetgroups',
	'processStat',
	'processStatm',
	'processStatus',
	'processNetDev',
	'processNetWireless',
	'processNetUnix',
	'processNetTcp4',
	'processNetTcp6',
	'processNetUdp4',
	'processNetUdp6',

	'cgroups',
	'cpuinfo',
	'devices',
	'diskstats',
	'filesystems',
	'loadavg',
	'meminfo',
	'partitions',
	'processes',
	'stat',
	'swaps',
	'uptime',
]) {
	parsers[name] = src => {
		parsers[name] = require(`./parsers/${name}`);
		return parsers[name](src);
	};
}

module.exports = parsers;
