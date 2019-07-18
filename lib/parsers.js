const {splitLines} = require('./parsers/utils');

const trim = str => str.trim();

class Parsers {}

const parsers = new Parsers();

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
	Object.defineProperty(Parsers.prototype, name, {
		get: function () { // eslint-disable-line object-shorthand
			let value = require(`./parsers/${name}`);
			Object.defineProperty(this, name, {value});
			return value;
		},
	});
}

parsers.cmdline = trim;
parsers.processComm = trim;
parsers.processCpuset = trim;
parsers.processOomScore = src => parseInt(src);
parsers.processTimerslackNs = src => parseInt(src);
parsers.version = trim;
parsers.processCwd = src => src;
parsers.processPersonality = src => parseInt(src, 16);
parsers.processCmdline = src => src.length === 0 ? null : splitLines(src, '\x00');

module.exports = parsers;
