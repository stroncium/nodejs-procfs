const {splitLines} = require('./utils');

module.exports = src => {
	let ls = splitLines(src, '\n');
	for (let i = 0; i < ls.length; i++) {
		let ps = ls[i].split(':');
		ls[i] = {
			id: parseInt(ps[0]),
			subsystems: ps[1].length === 0 ? [] : ps[1].split(','),
			group: ps[2],
		};
	}
	return ls;
};
