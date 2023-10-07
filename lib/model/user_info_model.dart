class UserInfoModel {
  Data? data;

  UserInfoModel({this.data});

  UserInfoModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? email;
  String? image;
  String? phone;

  Data({this.email, this.image, this.phone});

  Data.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    image = json['image'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['image'] = this.image;
    data['phone'] = this.phone;
    return data;
  }
}
