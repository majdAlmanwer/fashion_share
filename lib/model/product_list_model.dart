class ProductListModel {
  List<Data>? data;
  Links? links;
  Meta? meta;

  ProductListModel({this.data, this.links, this.meta});

  ProductListModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.links != null) {
      data['links'] = this.links!.toJson();
    }
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? description;
  String? price;
  Color? color;
  Size? size;
  Condition? condition;
  Material? material;
  Section? section;
  Branch? branch;
  String? location;
  String? sku;
  int? isForSale;
  String? user;
  Categories? categories;
  List<Images>? images;

  Data(
      {this.id,
      this.name,
      this.description,
      this.price,
      this.color,
      this.size,
      this.condition,
      this.material,
      this.section,
      this.branch,
      this.location,
      this.isForSale,
      this.user,
      this.categories,
      this.images,
      this.sku});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    color = json['color'] != null ? Color.fromJson(json['color']) : null;
    size = json['size'] != null ? Size.fromJson(json['size']) : null;
    condition = json['condition'] != null
        ? Condition.fromJson(json['condition'])
        : null;
    material =
        json['material'] != null ? Material.fromJson(json['material']) : null;
    section =
        json['section'] != null ? Section.fromJson(json['section']) : null;

    sku = json['sku'];

    branch = json['branch'] != null ? Branch.fromJson(json['branch']) : null;
    categories = json['categories'] != null
        ? Categories.fromJson(json['categories'])
        : null;
    location = json['location'];
    isForSale = json['is_for_sale'];
    user = json['user'];

    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;

    data['condition'] = this.condition;
    data['material'] = this.material;
    data['sku'] = this.sku;
    data['section'] = this.section;
    if (this.color != null) {
      data['color'] = this.color!.toJson();
    }
    if (this.size != null) {
      data['size'] = this.size!.toJson();
    }
    if (this.condition != null) {
      data['condition'] = this.condition!.toJson();
    }
    if (this.material != null) {
      data['material'] = this.material!.toJson();
    }
    if (this.section != null) {
      data['section'] = this.section!.toJson();
    }
    if (this.branch != null) {
      data['branch'] = this.branch!.toJson();
    }
    if (this.categories != null) {
      data['categories'] = this.categories!.toJson();
    }
    data['location'] = this.location;
    data['is_for_sale'] = this.isForSale;
    data['user'] = this.user;

    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Color {
  int? id;
  String? name;

  Color({this.id, this.name});

  Color.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Size {
  int? id;
  String? name;

  Size({this.id, this.name});

  Size.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Condition {
  int? id;
  String? name;

  Condition({this.id, this.name});

  Condition.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Categories {
  int? id;
  String? name;

  Categories({this.id, this.name});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Material {
  int? id;
  String? name;

  Material({this.id, this.name});

  Material.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Section {
  int? id;
  String? name;

  Section({this.id, this.name});

  Section.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Branch {
  int? id;
  String? name;
  String? address;
  String? workingHours;
  String? phone;
  String? whatsapp;

  Branch(
      {this.id,
      this.name,
      this.address,
      this.workingHours,
      this.phone,
      this.whatsapp});

  Branch.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    ;
    address = json['address'];
    workingHours = json['working_hours'];
    phone = json['phone'];
    whatsapp = json['whatsapp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['address'] = this.address;
    data['working_hours'] = this.workingHours;
    data['phone'] = this.phone;
    data['whatsapp'] = this.whatsapp;
    return data;
  }
}

class Name {
  String? en;

  Name({this.en});

  Name.fromJson(Map<String, dynamic> json) {
    en = json['en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['en'] = this.en;
    return data;
  }
}

class Images {
  int? id;
  String? imagableType;
  int? imagableId;
  int? isDefault;
  String? path;

  Images(
      {this.id, this.imagableType, this.imagableId, this.isDefault, this.path});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imagableType = json['imagable_type'];
    imagableId = json['imagable_id'];
    isDefault = json['is_default'];
    path = json['path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['imagable_type'] = this.imagableType;
    data['imagable_id'] = this.imagableId;
    data['is_default'] = this.isDefault;
    data['path'] = this.path;
    return data;
  }
}

class Links {
  String? first;
  String? last;
  String? prev;
  String? next;

  Links({this.first, this.last, this.prev, this.next});

  Links.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    last = json['last'];
    prev = json['prev'];
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first'] = this.first;
    data['last'] = this.last;
    data['prev'] = this.prev;
    data['next'] = this.next;
    return data;
  }
}

class Meta {
  int? currentPage;
  int? from;
  int? lastPage;
  List<Links>? links;
  String? path;
  int? perPage;
  int? to;
  int? total;

  Meta(
      {this.currentPage,
      this.from,
      this.lastPage,
      this.links,
      this.path,
      this.perPage,
      this.to,
      this.total});

  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    from = json['from'];
    lastPage = json['last_page'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(new Links.fromJson(v));
      });
    }
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    if (this.links != null) {
      data['links'] = this.links!.map((v) => v.toJson()).toList();
    }
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

// class Links {
//   String? url;
//   String? label;
//   bool? active;

//   Links({this.url, this.label, this.active});

//   Links.fromJson(Map<String, dynamic> json) {
//     url = json['url'];
//     label = json['label'];
//     active = json['active'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['url'] = this.url;
//     data['label'] = this.label;
//     data['active'] = this.active;
//     return data;
//   }
// }