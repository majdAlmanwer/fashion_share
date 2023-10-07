// class ProductModel {
//   Data? data;

//   ProductModel({this.data});

//   ProductModel.fromJson(Map<String, dynamic> json) {
//     data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     return data;
//   }
// }

// class Data {
//   int? id;
//   String? name;
//   String? description;
//   String? price;
//   String? color;
//   String? size;
//   String? condition;
//   String? material;
//   String? section;
//   Branch? branch;
//   String? location;
//   int? isForSale;
//   String? user;
//   List<String>? categories;
//   List<Images>? images;

//   Data(
//       {this.id,
//       this.name,
//       this.description,
//       this.price,
//       this.color,
//       this.size,
//       this.condition,
//       this.material,
//       this.section,
//       this.branch,
//       this.location,
//       this.isForSale,
//       this.user,
//       this.categories,
//       this.images});

//   Data.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     description = json['description'];
//     price = json['price'];
//     color = json['color'];
//     size = json['size'];
//     condition = json['condition'];
//     material = json['material'];
//     section = json['section'];
//     branch =
//         json['branch'] != null ? new Branch.fromJson(json['branch']) : null;
//     location = json['location'];
//     isForSale = json['is_for_sale'];
//     user = json['user'];
//     categories = json['categories'].cast<String>();
//     if (json['images'] != null) {
//       images = <Images>[];
//       json['images'].forEach((v) {
//         images!.add(new Images.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['description'] = this.description;
//     data['price'] = this.price;
//     data['color'] = this.color;
//     data['size'] = this.size;
//     data['condition'] = this.condition;
//     data['material'] = this.material;
//     data['section'] = this.section;
//     if (this.branch != null) {
//       data['branch'] = this.branch!.toJson();
//     }
//     data['location'] = this.location;
//     data['is_for_sale'] = this.isForSale;
//     data['user'] = this.user;
//     data['categories'] = this.categories;
//     if (this.images != null) {
//       data['images'] = this.images!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Branch {
//   int? id;
//   Name? name;
//   String? address;
//   Null? workingHours;
//   Null? phone;
//   Null? whatsapp;

//   Branch(
//       {this.id,
//       this.name,
//       this.address,
//       this.workingHours,
//       this.phone,
//       this.whatsapp});

//   Branch.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'] != null ? new Name.fromJson(json['name']) : null;
//     address = json['address'];
//     workingHours = json['working_hours'];
//     phone = json['phone'];
//     whatsapp = json['whatsapp'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     if (this.name != null) {
//       data['name'] = this.name!.toJson();
//     }
//     data['address'] = this.address;
//     data['working_hours'] = this.workingHours;
//     data['phone'] = this.phone;
//     data['whatsapp'] = this.whatsapp;
//     return data;
//   }
// }

// class Name {
//   String? en;

//   Name({this.en});

//   Name.fromJson(Map<String, dynamic> json) {
//     en = json['en'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['en'] = this.en;
//     return data;
//   }
// }

// class Images {
//   int? id;
//   String? imagableType;
//   int? imagableId;
//   int? isDefault;
//   String? path;

//   Images(
//       {this.id, this.imagableType, this.imagableId, this.isDefault, this.path});

//   Images.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     imagableType = json['imagable_type'];
//     imagableId = json['imagable_id'];
//     isDefault = json['is_default'];
//     path = json['path'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['imagable_type'] = this.imagableType;
//     data['imagable_id'] = this.imagableId;
//     data['is_default'] = this.isDefault;
//     data['path'] = this.path;
//     return data;
//   }
// }
