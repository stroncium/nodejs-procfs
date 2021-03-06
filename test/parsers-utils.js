const test = require('ava');
const {
	unescape,
	splitTwo,
} = require('../lib/parsers/utils');
const ProcfsError = require('../lib/procfs-error');

test('unescape', t => {
	t.is(unescape('abc'), 'abc');
	t.is(unescape('abc\\040\\012\\134zxc'), 'abc \n\\zxc');
});

test('splitTwo', t => {
	t.deepEqual(splitTwo('qwe:asd', ':'), {left: 'qwe', right: 'asd'});
	t.throws(() => splitTwo('qwe', ':'), {
		instanceOf: ProcfsError,
		message: 'Parsing failed: expected separator ":"',
		code: ProcfsError.ERR_PARSING_FAILED,
	});
	t.deepEqual(splitTwo('qwe:asd', ':', true), {left: 'qwe', right: 'asd'});
	t.deepEqual(splitTwo('qwe', ':', true), {left: 'qwe', right: undefined});
	t.deepEqual(splitTwo('qwe:asd', ':', true, 1), {left: 'qwe', right: 'asd'});
	t.deepEqual(splitTwo('qwe', ':', true, 1), {left: 'qwe', right: 1});
});

