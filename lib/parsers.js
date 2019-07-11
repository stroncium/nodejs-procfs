const {splitLines} = require('./parsers/utils');

const processCwd = src => src;
const trim = str => str.trim();
const processPersonality = src => parseInt(src, 16);
const processCmdline = src => src.length === 0 ? null : splitLines(src, '\x00');

const parsers = {
	cmdline: trim,
	processCmdline,
	processComm: trim,
	processCpuset: trim,
	processCwd,
	processOomScore: parseInt,
	processPersonality,
	processTimerslackNs: parseInt,
	version: trim,
};

for (let name of [
	'cgroups',
	'cpuinfo',
	'devices',
	'diskstats',
	'filesystems',
	'loadavg',
	'meminfo',
	'partitions',
	'processAutogroup',
	'processCgroups',
	'processEnviron',
	'processes',
	'processExe',
	'processFd',
	'processFdinfo',
	'processFds',
	'processGidMap',
	'processIo',
	'processLimits',
	'processMountinfo',
	'processNetDev',
	'processNetTcp4',
	'processNetTcp6',
	'processNetUdp4',
	'processNetUdp6',
	'processNetUnix',
	'processNetWireless',
	'processSetgroups',
	'processStat',
	'processStatm',
	'processStatus',
	'processThreads',
	'processUidMap',
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
