const test = require('ava');
const {
	readIdList,
	readLink,
	read,
	devIdGetMinor,
	devIdGetMajor,
	devIdFromMajorMinor,
} = require('../lib/utils');

const FIXTURES = `${__dirname}/fixtures/utils`;

test('readLink', t => {
	t.deepEqual(readLink(`${FIXTURES}/link`), '.');
});

test('readLink deleted', t => {
	t.deepEqual(readLink(`${FIXTURES}/deleted-link`, true), {
		path: '.',
		deleted: true,
	});
});

test('readLink not deleted', t => {
	t.deepEqual(readLink(`${FIXTURES}/link`, true), {
		path: '.',
		deleted: false,
	});
});

test('read 4k', t => {
	let str = read(`${FIXTURES}/zero.4k`);
	t.true(str.length === 4096);
	t.regex(str, /^\x00+/);
});

test('read 8k', t => {
	let str = read(`${FIXTURES}/zero.8k`);
	t.true(str.length === 8192);
	t.regex(str, /^\x00+/);
});

test('read 16k', t => {
	let str = read(`${FIXTURES}/zero.16k`);
	t.true(str.length === 16384);
	t.regex(str, /^\x00+/);
});

test('read 64k', t => {
	let str = read(`${FIXTURES}/zero.64k`);
	t.true(str.length === 65536);
	t.regex(str, /^\x00+/);
});

test('readIdList', t => {
	t.deepEqual(readIdList(`${FIXTURES}/ids`), [1, 2, 3]);
});

test('devId utils', t => {
	for (let id of [0, 1, 256, 771, 0xF0FFFF]) {
		t.is(id, devIdFromMajorMinor(devIdGetMajor(id), devIdGetMinor(id)));
	}
});
