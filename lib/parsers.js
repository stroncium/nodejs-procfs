const {splitLines} = require('./parsers/utils');

const trim = str => str.trim();

const parsers = {
	cmdline: trim,
	processComm: trim,
	processCpuset: trim,
	processOomScore: parseInt,
	processTimerslackNs: parseInt,
	version: trim,
	processCwd: src => src,
	processPersonality: src => parseInt(src, 16),
	processCmdline: src => src.length === 0 ? null : splitLines(src, '\x00'),
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
