class Team {
	int id;
	String name;
	String crestUrl;

	Team({this.id, this.name, this.crestUrl});

	Team.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		name = json['name'];
		crestUrl = json['crestUrl'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['name'] = this.name;
		data['crestUrl'] = this.crestUrl;
		return data;
	}
}