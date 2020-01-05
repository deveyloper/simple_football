import 'TableData.dart';

class Standings {
	String stage;
	String type;
	Null group;
	List<TableData> table;

	Standings({this.stage, this.type, this.group, this.table});

	Standings.fromJson(Map<String, dynamic> json) {
		stage = json['stage'];
		type = json['type'];
		group = json['group'];
		if (json['table'] != null) {
			table = new List<TableData>();
			json['table'].forEach((v) { table.add(new TableData.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['stage'] = this.stage;
		data['type'] = this.type;
		data['group'] = this.group;
		if (this.table != null) {
      data['table'] = this.table.map((v) => v.toJson()).toList();
    }
		return data;
	}
}
