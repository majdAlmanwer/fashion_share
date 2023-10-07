class FilterModel {
  String? name;
  int? id;
  FilterModel({this.name, this.id});
  FilterModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];

    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = this.id;

    data['name'] = this.name;

    return data;
  }
}
