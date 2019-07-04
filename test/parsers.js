const fs = require('fs');

const test = require('ava');
const {read, readIdList} = require('../lib/utils');
const parsers = require('../lib/parsers');
const typeAsserts = require('./fixtures/type/asserts');

const FIXTURES = `${__dirname}/fixtures/data`;

test('util readIdList (/proc/self/fd)', t => {
	let result = readIdList(`${FIXTURES}/self/fd`);
	let fixtureResult = require(`${FIXTURES}/self/fd-list.js`);
	t.deepEqual(result, fixtureResult);
});

for (let fixture of ['fdinfo', 'fdinfo-synthetic']) {
	let assertType = typeAsserts.processFdinfo;
	for (let fd of readIdList(`${FIXTURES}/self/${fixture}`)) {
		let map = require(`${FIXTURES}/self/${fixture}-map`);
		test(`parser processFdinfo (self/${fixture}/${fd})`, t => {
			let result = parsers.processFdinfo(read(`${FIXTURES}/self/${fixture}/${fd}`));
			let fixtureResult = map.get(fd);
			assertType(result);
			t.deepEqual(result, fixtureResult);
		});
	}
}

test('parser processes (/proc/*)', t => {
	let ls = fs.readdirSync(`${FIXTURES}`);
	t.deepEqual(parsers.processes(ls), [2163]);
});

for (let [parserName, fixtures] of [
	['processMountinfo', 'self/mountinfo'],
	['processIo', 'self/io'],
	['processUidMap', 'self/uid_map'],
	['processGidMap', 'self/gid_map'],
	['processEnviron', 'self/environ'],
	['processOomScore', 'self/oom_score'],
	['processTimerslackNs', 'self/timerslack_ns'],
	['processCmdline', 'self/cmdline'],
	['processAutogroup', 'self/autogroup'],
	['processStatm', 'self/statm'],
	['processComm', 'self/comm'],
	['processSetgroups', 'self/setgroups'],
	['processPersonality', 'self/personality'],
	['processCgroups', 'self/cgroup'],
	['processCpuset', 'self/cpuset'],
	['processLimits', 'self/limits'],
	['processStat', 'self/stat'],
	['processStatus', 'self/status'],

	['cpuinfo', 'cpuinfo,cpuinfo-synthetic'],
	['loadavg', 'loadavg'],
	['uptime', 'uptime'],
	['version', 'version'],
	['cmdline', 'cmdline'],
	['swaps', 'swaps'],
	['stat', 'stat,stat-synthetic'],
	['devices', 'devices'],
	['filesystems', 'filesystems'],
	['diskstats', 'diskstats'],
	['partitions', 'partitions'],
	['meminfo', 'meminfo,meminfo-synthetic'],
]) {
	for (let fixture of fixtures.split(',')) {
		let dumpPath = `${FIXTURES}/${fixture}`;
		let resultPath = `${dumpPath}.js`;
		let parser = parsers[parserName];
		let assertType = typeAsserts[parserName];

		test(`parser ${parserName}(fixture ${fixture})`, t => {
			let dump = read(dumpPath);
			let result = parser(dump);
			let fixtureResult = require(resultPath);
			assertType(result);
			t.deepEqual(result, fixtureResult);
		});
	}
}
