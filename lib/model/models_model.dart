class ModelsModel {
  List<Size>? size;
  List<Color>? color;
  List<Section>? section;
  List<Condition>? condition;
  List<Material>? material;
  List<Branch>? branch;
  List<Category>? category;
  List<Banner>? banner;

  ModelsModel(
      {this.size,
      this.color,
      this.section,
      this.condition,
      this.material,
      this.branch,
      this.category,
      this.banner});

  ModelsModel.fromJson(Map<String, dynamic> json) {
    if (json['Size'] != null) {
      size = <Size>[];
      json['Size'].forEach((v) {
        size!.add(new Size.fromJson(v));
      });
    }
    if (json['Color'] != null) {
      color = <Color>[];
      json['Color'].forEach((v) {
        color!.add(new Color.fromJson(v));
      });
    }
    if (json['Section'] != null) {
      section = <Section>[];
      json['Section'].forEach((v) {
        section!.add(new Section.fromJson(v));
      });
    }
    if (json['Condition'] != null) {
      condition = <Condition>[];
      json['Condition'].forEach((v) {
        condition!.add(new Condition.fromJson(v));
      });
    }
    if (json['Material'] != null) {
      material = <Material>[];
      json['Material'].forEach((v) {
        material!.add(new Material.fromJson(v));
      });
    }
    if (json['Branch'] != null) {
      branch = <Branch>[];
      json['Branch'].forEach((v) {
        branch!.add(new Branch.fromJson(v));
      });
    }
    if (json['Category'] != null) {
      category = <Category>[];
      json['Category'].forEach((v) {
        category!.add(new Category.fromJson(v));
      });
    }
    if (json['Banner'] != null) {
      banner = <Banner>[];
      json['Banner'].forEach((v) {
        banner!.add(new Banner.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.size != null) {
      data['Size'] = this.size!.map((v) => v.toJson()).toList();
    }
    if (this.color != null) {
      data['Color'] = this.color!.map((v) => v.toJson()).toList();
    }
    if (this.section != null) {
      data['Section'] = this.section!.map((v) => v.toJson()).toList();
    }
    if (this.condition != null) {
      data['Condition'] = this.condition!.map((v) => v.toJson()).toList();
    }
    if (this.material != null) {
      data['Material'] = this.material!.map((v) => v.toJson()).toList();
    }
    if (this.branch != null) {
      data['Branch'] = this.branch!.map((v) => v.toJson()).toList();
    }
    if (this.category != null) {
      data['Category'] = this.category!.map((v) => v.toJson()).toList();
    }
    if (this.banner != null) {
      data['Banner'] = this.banner!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Size {
  Size({
    required this.id,
    required this.name,
  });
  late final int id;
  late final String name;

  Size.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    return _data;
  }
}

class Color {
  Color({
    required this.id,
    required this.name,
  });
  late final int id;
  late final String name;

  Color.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    return _data;
  }
}

class Section {
  Section({
    required this.id,
    required this.name,
  });
  late final int id;
  late final String name;

  Section.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    return _data;
  }
}

class Condition {
  Condition({
    required this.id,
    required this.name,
  });
  late final int id;
  late final String name;

  Condition.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    return _data;
  }
}

class Material {
  Material({
    required this.id,
    required this.name,
  });
  late final int id;
  late final String name;

  Material.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    return _data;
  }
}

class Branch {
  Branch({
    required this.id,
    required this.name,
  });
  late final int id;
  late final String name;

  Branch.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    return _data;
  }
}

class Category {
  Category({required this.id, required this.name, required this.image});
  late final int id;
  late final String name;
  late final String image;

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['image'] = image;
    return _data;
  }
}

class Banner {
  Banner({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
  });
  late final int id;
  late final String name;
  late final String image;
  late final String description;

  Banner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['image'] = image;
    _data['description'] = description;
    return _data;
  }
}
