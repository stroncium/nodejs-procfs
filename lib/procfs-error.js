class ProcfsError extends Error {
	constructor(code, message, sourceError) {
		super(message);
		this.code = code;
		if (sourceError !== undefined) {
			this.sourceError = sourceError;
		}
	}
}

ProcfsError.CODE_PARSING_FAILED = 'EPARSE';

ProcfsError.parsingError = (src, msg) => {
	let e = new ProcfsError(ProcfsError.CODE_PARSING_FAILED, `Parsing failed: ${msg}`);
	e.sourceText = src;
	return e;
};

module.exports = ProcfsError;
