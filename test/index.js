let test = require('ava');
const typeAsserts = require('./fixtures/type/asserts');
let procfs = require('..');

const existingPid = process.pid;
const nonexistingPid = 2 ** 23;

// Available in Linux 4.4
for (let {name, pided} of [
	{name: 'processMountinfo', pided: true},
	{name: 'processIo', pided: true},
	{name: 'processUidMap', pided: true},
	{name: 'processGidMap', pided: true},
	{name: 'processEnviron', pided: true},
	{name: 'processOomScore', pided: true},
	{name: 'processCmdline', pided: true},
	{name: 'processAutogroup', pided: true},
	{name: 'processStatm', pided: true},
	{name: 'processComm', pided: true},
	{name: 'processSetgroups', pided: true},
	{name: 'processPersonality', pided: true},
	{name: 'processExe', pided: true},
	{name: 'processCwd', pided: true},
	{name: 'processCgroups', pided: true},
	{name: 'processCpuset', pided: true},
	{name: 'processLimits', pided: true},
	{name: 'processStat', pided: true},
	{name: 'processFds', pided: true},
	{name: 'processThreads', pided: true},
	{name: 'processStatus', pided: true},
	{name: 'processNetDev', pided: true},
	{name: 'processNetWireless', pided: true},

	{name: 'processes'},
	{name: 'cpuinfo'},
	{name: 'loadavg'},
	{name: 'uptime'},
	{name: 'version'},
	{name: 'cmdline'},
	{name: 'swaps'},
	{name: 'stat'},
	{name: 'devices'},
	{name: 'filesystems'},
	{name: 'diskstats'},
	{name: 'partitions'},
	{name: 'meminfo'},
	{name: 'cgroups'},
]) {
	let assertType = typeAsserts[name];

	test(`procfs.${name}()`, t => {
		let result = procfs[name]();
		t.true(result !== undefined);
		assertType(result);
	});
	if (pided) {
		test(`procfs.${name}(<existing pid>)`, t => {
			let result = procfs[name](existingPid);
			t.true(result !== undefined);
			assertType(result);
		});

		test(`procfs.${name}(<nonexisting pid>)`, t => {
			t.throws(() => procfs[name](nonexistingPid));
		});

		test(`procfs.${name}(<incorrect pid>)`, t => {
			t.throws(() => procfs[name]('stat'), 'pid');
			t.throws(() => procfs[name](-1), 'pid');
			t.throws(() => procfs[name](1.5), 'pid');
		});
	}
}

// Not available in Linux 4.4
for (let {name, pided} of [
	{name: 'processTimerslackNs', pided: true},
	{name: 'config'},
]) {
	let assertType = typeAsserts[name];

	test(`procfs.${name}() linux version dependent`, t => {
		let result;
		try {
			result = procfs[name]();
		} catch (error) {
			t.true(true);
			return;
		}
		t.true(result !== undefined);
		assertType(result);
	});
	if (pided) {
		test(`procfs.${name}(<existing pid>) linux version dependent`, t => {
			let result;
			try {
				result = procfs[name](existingPid);
			} catch (error) {
				t.true(true);
				return;
			}
			t.true(result !== undefined);
			assertType(result);
		});

		test(`procfs.${name}(<nonexisting pid>) linux version dependent`, t => {
			t.throws(() => procfs[name](nonexistingPid));
		});

		test(`procfs.${name}(<incorrect pid>) linux version dependent`, t => {
			t.throws(() => procfs[name]('stat'), 'pid');
			t.throws(() => procfs[name](-1), 'pid');
			t.throws(() => procfs[name](1.5), 'pid');
		});
	}
}

for (let name of ['processFd', 'processFdinfo']) {
	let assertType = typeAsserts[name];

	test(`procfs.${name}(<existing fd>)`, t => {
		let result = procfs[name](1);
		t.true(result !== undefined);
		assertType(result);
	});

	test(`procfs.${name}(<existing fd>, <existing pid>)`, t => {
		let result = procfs[name](1, existingPid);
		t.true(result !== undefined);
		assertType(result);
	});

	test(`procfs.${name}(<nonexisting fd>, <existing pid>)`, t => {
		t.throws(() => procfs[name](2 ** 23, existingPid));
	});

	test(`procfs.${name}(<nonexisting fd>, <nonexisting pid>)`, t => {
		t.throws(() => procfs[name](1, nonexistingPid));
	});

	test(`procfs.${name}(<nonexisting fd>, <incorrect pid>)`, t => {
		t.throws(() => procfs[name](1, 'abc'), 'pid');
		t.throws(() => procfs[name](1, -1), 'pid');
		t.throws(() => procfs[name](1, 1.51), 'pid');
	});

	test(`procfs.${name}(<incorrect fd>, <existing pid>)`, t => {
		t.throws(() => procfs[name]('abc', existingPid), 'fd');
		t.throws(() => procfs[name](-1, existingPid), 'fd');
		t.throws(() => procfs[name](1.5, existingPid), 'fd');
	});
}
