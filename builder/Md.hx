using StringTools;
import haxe.rtti.CType;
import JavadocHandler;

@:publicFields
class Md{
	var typeLink:String->String->String;
	var mapPath:String->String;
	var text:Array<String>;
	function new(typeLink:String->String->String, mapPath:String->String){
		this.typeLink = typeLink;
		this.mapPath = mapPath;
		this.text = [];
	}

	static function isOptional(f:ClassField){
		for(m in f.meta) if (m.name == ':optional') return true;
		return false;
	}

	function typeName(t:CType) {
		return switch(t) {
			case CTypedef('Null', params): typeName(params.first());
			case CAbstract(path, params), CTypedef(path, params), CClass(path, params), CEnum(path, params):
				var mappedPath = mapPath(path);
				var link = typeLink(path, mappedPath);
				var text = link == null ? mappedPath : '[$mappedPath]($link)';
				if(params.length > 0){
					text+= '\\<${params.map(typeName).join(', ')}>';
				}
				text;
			case CDynamic(_): 'object';
			case _: throw 'unexpected type '+t;
		}
	}

	static function isUnstable(doc:DocInfos) {
		for(tag in doc.unknownTags) if(tag.name == 'unstable') return true;
		return false;
	}

	function addField(f:ClassField) {
		text.push(switch(f.type) {
			case CFunction(args, ret):
				var doc = JavadocHandler.parse(f.doc);
				var unstable = isUnstable(doc);
				var argsText = [for(a in args) a.opt ? '[${a.name}]' : '${a.name}'].join(', ');

				var md = '### ${f.name} ($argsText)\n';
				if(unstable) md+= '⚠️ **unstable**\n';
				if(doc.text != null) md+= doc.text+'\n';
				for(a in args) {
					md+= ' - **`${a.name}`** ${typeName(a.t)}';
					if(doc.params[a.name] != null) md+= ': ' + doc.params[a.name];
					md+= '\n';
				}

				md+= ' - returns ${typeName(ret)}';
				if(doc.returns != null) md+= ': ' + doc.returns.text;
				md+= '\n';


				md+= '---\n';
				md;
			case _: throw 'unexpected field '+f;
		});
	}


	static function compareFields(a:ClassField, b:ClassField) {
		if(!isOptional(a) && isOptional(b)) return -1;
		if(isOptional(a) && !isOptional(b)) return 1;
		if(a.name < b.name) return -1;
		if(a.name > b.name) return 1;
		return 0;
	}

	function addTypedef(td:Typedef) {
		var doc = JavadocHandler.parse(td.doc);

		var md = '## type ${mapPath(td.path)}\n';
		if(doc.text != null) md+= '${doc.text}\n\n';
		switch(td.type) {
			case CAnonymous(fields):
				var fields = [for(f in fields) f];
				fields.sort(compareFields);
				md+= 'Object with properties:\n';
				for(f in fields){
					var parts = [];
					if(isOptional(f)) parts.push('*optional*');
					parts.push('**`${f.name}`**');
					parts.push(typeName(f.type));
					if(doc.fields[f.name] != null) parts.push(': '+doc.fields[f.name]);
					md+= ' - ${parts.join(' ')}\n';
				}
			case _: md+= 'Type: ${typeName(td.type)}\n';
		}

		md+= '\n***\n';

		text.push(md);
	}

	function addText(text:String) {
		this.text.push(text);
	}

	function getText() {
		return text.join('\n\n')+'\n\n';
	}
}
