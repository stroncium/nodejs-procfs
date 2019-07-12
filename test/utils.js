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
	t.is(readLink(`${FIXTURES}/link`), '.');
});

test('readLink deleted', t => {
	t.is(readLink(`${FIXTURES}/deleted-link`), '. (deleted)');
});

test('read', t => {
	for (let iter = 0; iter < 16; iter++) {
		for (let bytes of [4096, 8192, 16384, 17408]) {
			let str = read(`${FIXTURES}/${bytes}-zeroes.bin`);
			t.true(str.length === bytes);
			t.regex(str, /^\x00+/);
		}
	}
});

test('readIdList', t => {
	t.deepEqual(readIdList(`${FIXTURES}/ids`), [1, 2, 3]);
});

test('devId utils', t => {
	for (let id of [0, 1, 256, 771, 0xF0FFFF]) {
		t.is(id, devIdFromMajorMinor(devIdGetMajor(id), devIdGetMinor(id)));
	}
});
