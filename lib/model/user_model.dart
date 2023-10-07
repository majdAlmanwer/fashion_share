class UserModel {
  int? id;
  String? email;
  String? emailVerifiedAt;
  String? image;
  String? phone;
  String? createdAt;
  String? updatedAt;

  UserModel(
      {this.id,
      this.email,
      this.emailVerifiedAt,
      this.image,
      this.phone,
      this.createdAt,
      this.updatedAt});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    image = json['image'];
    phone = json['phone'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['image'] = this.image;
    data['phone'] = this.phone;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
