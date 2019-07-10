using StringTools;
import haxe.rtti.CType;

class Asserts {
	var asserts:Array<String>;
	var typedefs:Map<String, Typedef>;
	public function new(typedefs:Map<String, Typedef>){
		this.typedefs = typedefs;
		asserts = [];
	}

	public function addAssert(name:String, type:CType) {
		asserts.push('${name}: asserter(${schema(type)}.required()),');
	}

	static function isOptional(f:ClassField){
		for(m in f.meta) if (m.name == ':optional') return true;
		return false;
	}

	function schema(type: CType){
		return switch(type) {
			case CClass('Array', subtypes): 'Joi.array().items(${schema(subtypes.first())}).min(0)';
			case CClass('String', _): 'Joi.string().allow(\'\')';
			case CClass('Date', _): 'Joi.date()';
			case CTypedef('Null', params): schema(params.first());
			case CTypedef(path, params) if (params.length == 0):
				schema(typedefs[path].type);
			case CAnonymous(fields):
				var keys = [for(f in fields){
					'${f.name}: ${schema(f.type)}${isOptional(f) ? '' : '.required()'},\n';
				}];
				'Joi.object().keys({\n${tab(keys.join(''))}})';
			case CAbstract('Int', _): 'Joi.number().integer()';
			case CAbstract('Bool', _): 'Joi.boolean()';
			case CAbstract('Float', _): 'Joi.number().unsafe()';
			// case CAbstract('Int', _): 'Joi.number().integer()';
			case CDynamic(_): 'Joi.any()';
			case _: throw 'unexpected type '+type;
		}
	}

	static function tab(text:String){
		var res = '';
		var lines = text.split('\n');
		for(i in 0...lines.length-1) res+= '\t'+lines[i]+'\n';
		var lastLine = lines[lines.length-1];
		if(lastLine != '') res+= '\t'+lastLine;
		return res;
	}

	public function getText(){
		return '// generated code
const Joi = require(\'joi\');

const asserter = schema => v => {
	let {error} = schema.validate(v);
	if (error) {
		throw error;
	}
};

module.exports = {
${tab(asserts.join('\n'))}
};
';
	}
}
