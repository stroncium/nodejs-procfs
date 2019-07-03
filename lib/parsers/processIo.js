const {parseObject} = require('./utils');

const ioMap = new Map([
	['rchar', (obj, v) => obj.read = parseInt(v)],
	['wchar', (obj, v) => obj.write = parseInt(v)],
	['syscr', (obj, v) => obj.readSyscalls = parseInt(v)],
	['syscw', (obj, v) => obj.writeSyscalls = parseInt(v)],
	['read_bytes', (obj, v) => obj.realRead = parseInt(v)],
	['write_bytes', (obj, v) => obj.realWrite = parseInt(v)],
	['cancelled_write_bytes', (obj, v) => obj.cancelledWrite = parseInt(v)],
]);

module.exports = src => parseObject(src, ioMap);
