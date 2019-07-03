const {splitLines} = require('./utils');

module.exports = src => {
	let ls = splitLines(src, '\x00');
	let map = new Map();
	for (let l of ls) {
		let idx = l.indexOf('=');
		map.set(l.substr(0, idx), l.substr(idx + 1));
	}
	return map;
};
