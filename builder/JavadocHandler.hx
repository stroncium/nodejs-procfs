using StringTools;

class JavadocHandler {
	public static function parse(doc:String):DocInfos {
		var tags = [];
		var unknownTags = [];
		var infos:DocInfos = {
			text: null,
			throws: [],
			params: new Map(),
			fields: new Map(),
			sees: [],
			events: [],
			tags: tags,
			unknownTags: unknownTags,
		};

		if(doc != null) {
			var ereg = ~/\s*@([^\s@]+)(?:\s+([^@]*)\s*)?/gm;

			var newText = ereg.map(doc, function(e) {
				var name = e.matched(1);
				var doc = e.matched(2);
				var value:Null<String> = null;

				switch (name) {
					case 'param', 'exception', 'throws', 'event', 'field':
						var ereg = ~/(\S+)\s+(.*)/gs;
						if (ereg.match(doc)) {
							value = ereg.matched(1).trim();
							doc = ereg.matched(2).trim();
						} else if (~/^\S+$/gs.match(doc)) {
							value = doc.trim();
							doc = null;
						} else {
							doc = doc.trim();
						}
					default:
				}
				doc = trimDoc(doc);
				tags.push({
					name: name,
					text: doc,
					value: value
				});
				return '';
			}).trim();

			if (newText != '') {
				infos.text = newText;
			}

			for (tag in tags) switch (tag.name) {
				case 'param':
					infos.params[tag.value] = tag.text;
				case 'field':
					infos.fields[tag.value] = tag.text;
				case 'exception', 'throws':
					infos.throws.push(tag);
				case 'deprecated':
					infos.deprecated = tag;
				case 'return', 'returns':
					infos.returns = tag;
				case 'since':
					infos.since = tag;
				case 'default':
					infos.defaultValue = tag;
				case 'see':
					infos.sees.push(tag);
				case 'event':
					infos.events.push(tag);
				default:
					unknownTags.push(tag);
			}
		}
		return infos;
	}

	static function trimDoc(doc:String) {
		if (doc == null) return null;
		var ereg = ~/^\s+/m;
		if (ereg.match(doc)) {
			var space = new EReg('^' + ereg.matched(0), 'mg');
			doc = space.replace(doc, '');
		}
		return doc.trim();
	}
}

typedef DocInfos = {
	text:String,
	?returns:DocTag,
	?deprecated:DocTag,
	?since:DocTag,
	?defaultValue:DocTag,
	sees:Array<DocTag>,
	params:Map<String, String>,
	fields:Map<String, String>,
	throws:Array<DocTag>,
	events:Array<DocTag>,
	tags:Array<DocTag>,
	unknownTags:Array<DocTag>,
}

typedef DocTag = {
	name:String,
	text:String,
	?value:String,
}
