const {splitTwo} = require('./utils');

module.exports = src => {
	let ps = src.split(' ');
	let entities = splitTwo(ps[3], '/');
	return {
		jobsAvg1Min: parseFloat(ps[0]),
		jobsAvg5Min: parseFloat(ps[1]),
		jobsAvg15Min: parseFloat(ps[2]),
		runnableEntities: parseInt(entities.left),
		existingEntities: parseInt(entities.right),
		mostRecentlyCreatedPid: parseInt(ps[4]),
	};
};
