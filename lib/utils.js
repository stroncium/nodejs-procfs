const {
	readlinkSync,
	readdirSync,
	openSync,
	readSync,
	closeSync,
	readFileSync,
	existsSync,
} = require('fs');

const tmpBufMinLen = 4096 * 2;
const tmpBufMaxLen = 4096 * 8;

let tmpBufLen = tmpBufMinLen;
let tmpBuf = Buffer.allocUnsafeSlow(tmpBufLen);

const readMoreAndClose = (buf, fd) => {
	let length = buf.length;
	let pos = length;
	let bytesRead;
	let bytesToRead;

	do {
		length = length << 1;
		let newBuf = Buffer.allocUnsafeSlow(length);
		buf.copy(newBuf);
		buf = newBuf;

		if (length <= tmpBufMaxLen) {
			tmpBuf = buf;
			tmpBufLen = length;
		}

		bytesToRead = length - pos;
		bytesRead = readSync(fd, buf, pos, bytesToRead, null);
		pos += bytesRead;
	} while (bytesRead === bytesToRead);
	closeSync(fd);
	return buf.toString('utf8', 0, pos);
};

const read = path => {
	const fd = openSync(path, 'r', 0o666);
	let bytesRead = readSync(fd, tmpBuf, 0, tmpBuf.length, null);
	if (bytesRead === tmpBuf.length) {
		return readMoreAndClose(tmpBuf, fd);
	}
	closeSync(fd);
	return tmpBuf.toString('utf8', 0, bytesRead);
};

const readIdList = path => {
	let ls = readdirSync(path);
	for (let i = 0; i < ls.length; i++) {
		ls[i] = parseInt(ls[i]);
	}
	return ls;
};

const readBuffer = readFileSync;
const exists = existsSync;
const readdir = readdirSync;

const devIdGetMinor = devId => (((devId >> 20) << 8) | (devId & 0xFF));
const devIdGetMajor = devId => ((devId >> 8) & 0xFF);
const devIdFromMajorMinor = (major, minor) => (((minor >> 8) << 20) | ((major & 0xFF) << 8) | (minor & 0xFF));

module.exports = {
	read,
	readLink: readlinkSync,
	readIdList,
	readBuffer,
	exists,
	readdir,

	devIdGetMinor,
	devIdGetMajor,
	devIdFromMajorMinor,
};
