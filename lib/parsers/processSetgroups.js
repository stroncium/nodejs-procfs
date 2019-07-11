module.exports = src => {
	src = src.trim();
	if (src === 'allow') {
		return true;
	}
	if (src === 'deny') {
		return false;
	}
	throw new Error('parsing failed');
};
