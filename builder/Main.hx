using StringTools;
import haxe.rtti.CType;

class Main{
	public static function main() {
		var env = Sys.environment();
		run(env['SRC'], env['DST_API_MD'], env['DST_ASSERTS']);
	}

	static function getLink(path:String, mappedPath:String) {
		if(path.startsWith('procfs.')) return '#type-'+mappedPath.toLowerCase();
		if(path == 'ProcfsError') return '#procfserror';
		return null;
	}

	static function mapPath(path:String) {
		return switch (path) {
			case 'Int': 'integer';
			case 'String': 'string';
			case 'Bool': 'boolean';
			case 'procfs.Procfs': 'procfs';
			case path if (path.startsWith('procfs.')) : path.substr('procfs.'.length);
			case _: path;
		}
	}

	static function run(srcPath:String, docPath:String, assertsPath:String){
		var parser = new haxe.rtti.XmlParser();
		parser.process(Xml.parse(sys.io.File.getContent(srcPath)).firstElement(), 'Procfs');
		var pack = null;
		for(tree in parser.root) switch(tree) {
			case TPackage('procfs', _, subs): pack = subs;
			case _:
		};

		var cl = null;
		for(tree in pack) switch(tree) {
			case TClassdecl(def) if (def.path == 'procfs.Procfs'): cl = def;
			case _:
		}


		var typedefs = new Map<String, Typedef>();
		for(tree in pack) switch(tree) {
			case TTypedecl(def): typedefs[def.path] = def;
			case _:
		}
		var asserts = new Asserts(typedefs);

		var md = new Md(getLink, mapPath);

		md.addText('## procfs');
		for(f in cl.statics) if(f.isPublic) {
			md.addField(f);
			switch(f.type) {
				case CFunction(args, ret):
					asserts.addAssert(f.name, ret);
				case _:
			}
		}

		for(tree in pack) switch(tree) {
			case TTypedecl(def): md.addTypedef(def);
			case _:
		}

		md.addText('## ProcfsError
extends `Error` with properties:
 - **`code`** string: error code, one of:
   - `EPARSE`(`Procfs.ERR_PARSING_FAILED`): guard error, if you see this, consider submitting a bug report
   - `EUNKNOWN`(`Procfs.ERR_UNKNOWN`): completely unexpected error, if you see this, consider submitting a bug report
   - `ENOENT`(`Procfs.ERR_NOT_FOUND`): target file not found(or we were denied access)
 - *optional* **`sourceText`** string: for parsing errors, a part of file we encountered problem with
 - *optional* **`sourceError`** Error: when applicable, underlying error

');

		sys.io.File.saveContent(docPath, md.getText());
		sys.io.File.saveContent(assertsPath, asserts.getText());
	}
}
