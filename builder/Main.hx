using StringTools;
import haxe.rtti.CType;

class Main{
	public static function main() {
		var env = Sys.environment();
		run(env['SRC'], env['DST_API_MD'], env['DST_ASSERTS']);
	}

	static function getLink(path:String, mappedPath:String) {
		return path.startsWith('procfs.') ? '#type-'+mappedPath.toLowerCase() : null;
	}

	static function mapPath(path:String) {
		return switch (path) {
			case 'Int': 'integer';
			case 'String': 'string';
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

		sys.io.File.saveContent(docPath, md.getText());
		sys.io.File.saveContent(assertsPath, asserts.getText());
	}
}
