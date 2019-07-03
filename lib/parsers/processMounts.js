const {unescape, splitLines} = require('./utils');

module.exports = src => {
	let ls = splitLines(src, '\n');
	for (let i = 0; i < ls.length; i++) {
		let ps = ls[i].split(' ');
		ls[i] = {
			spec: unescape(ps[0]),
			file: unescape(ps[1]),
			vfstype: ps[2],
			mntops: ps[3].split(','),
			freq: parseInt(ps[4], 10),
			passno: parseInt(ps[5], 10),
		};
	}
	return ls;
};
