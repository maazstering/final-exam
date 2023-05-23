class user_data_model {
  String? date;
  String? localName;
  String? name;
  String? countryCode;
  bool? fixed;
  bool? global;
  String? type;

  user_data_model(
      {this.date,
      this.localName,
      this.name,
      this.countryCode,
      this.fixed,
      this.global,
      this.type});

  user_data_model.fromJson(Map<String, dynamic> json) {
    print("userdatamodel");
    print(json);
    date = json['date'];
    localName = json['localName'];
    name = json['name'];
    countryCode = json['countryCode'];
    fixed = json['fixed'];
    global = json['global'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['localName'] = this.localName;
    data['name'] = this.name;
    data['countryCode'] = this.countryCode;
    data['fixed'] = this.fixed;
    data['global'] = this.global;
    data['type'] = this.type;
    return data;
  }
}
