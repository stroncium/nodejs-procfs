const {splitLines} = require('./utils');

module.exports = src => {
	let ls = splitLines(src, '\n');
	for (let i = 0; i < ls.length; i++) {
		let ps = ls[i].split(':');
		const hierarchyId = parseInt(ps[0]);
		ls[i] = {
			hierarchyId,
			controllers: (hierarchyId === 0) ? undefined : ((ps[1].length === 0) ? [] : ps[1].split(',')),
			path: ps[2],
		};
	}
	return ls;
};
