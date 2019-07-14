const ProcfsError = require('../procfs-error');

module.exports = src => {
	src = src.trim();
	if (src === 'allow') {
		return true;
	}
	if (src === 'deny') {
		return false;
	}
	throw ProcfsError.parsingError(src, 'unexpected value');
};
