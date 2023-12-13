class CategoriesListModel {
  int? id;
  String? name;
  String? slug;
  String? icon;
  int? parentId;
  int? position;
  String? createdAt;
  String? updatedAt;
  int? homeStatus;
  int? priority;
  List<Childes>? childes;
  List<dynamic>? translations;

  CategoriesListModel(
      {this.id,
      this.name,
      this.slug,
      this.icon,
      this.parentId,
      this.position,
      this.createdAt,
      this.updatedAt,
      this.homeStatus,
      this.priority,
      this.childes,
      this.translations});

  CategoriesListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    icon = json['icon'];
    parentId = json['parent_id'];
    position = json['position'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    homeStatus = json['home_status'];
    priority = json['priority'];
    if (json['childes'] != null) {
      childes = <Childes>[];
      json['childes'].forEach((v) {
        childes!.add(Childes.fromJson(v));
      });
    }

    if (json['translations'] != null) {
      translations = json['translations'];
    }

    /* if (json['translations'] != null) {
      translations = <Null>[];
      json['translations'].forEach((v) {
        translations!.add(new Null.fromJson(v));
      });
    }*/
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['icon'] = icon;
    data['parent_id'] = parentId;
    data['position'] = position;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['home_status'] = homeStatus;
    data['priority'] = priority;
    if (childes != null) {
      data['childes'] = childes!.map((v) => v.toJson()).toList();
    }

    if (translations != null) {
      data["translations"] = translations;
    }
    /*if (translations != null) {
      data['translations'] = translations!.map((v) => v.toJson()).toList();
    }*/
    return data;
  }
}

class Childes {
  int? id;
  String? name;
  String? slug;
  String? icon;
  int? parentId;
  int? position;
  String? createdAt;
  String? updatedAt;
  int? homeStatus;
  int? priority;
  List<SubChildes>? childes;
  List<dynamic>? translations;

  Childes(
      {this.id,
      this.name,
      this.slug,
      this.icon,
      this.parentId,
      this.position,
      this.createdAt,
      this.updatedAt,
      this.homeStatus,
      this.priority,
      this.childes,
      this.translations});

  Childes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    icon = json['icon'];
    parentId = json['parent_id'];
    position = json['position'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    homeStatus = json['home_status'];
    priority = json['priority'];
    if (json['childes'] != null) {
      childes = <SubChildes>[];
      json['childes'].forEach((v) {
        childes!.add(SubChildes.fromJson(v));
      });
    }

    if (json['translations'] != null) {
      translations = json['translations'];
    }

    /*if (json['translations'] != null) {
      translations = <Null>[];
      json['translations'].forEach((v) {
        translations!.add(new Null.fromJson(v));
      });
    }*/
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['icon'] = icon;
    data['parent_id'] = parentId;
    data['position'] = position;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['home_status'] = homeStatus;
    data['priority'] = priority;
    if (childes != null) {
      data['childes'] = childes!.map((v) => v.toJson()).toList();
    }
    if (translations != null) {
      data["translations"] = translations;
    }
    /* if (translations != null) {
      data['translations'] = translations!.map((v) => v.toJson()).toList();
    }*/
    return data;
  }
}

class SubChildes {
  int? id;
  String? name;
  String? slug;
  String? icon;
  int? parentId;
  int? position;
  String? createdAt;
  String? updatedAt;
  int? homeStatus;
  int? priority;
  List<dynamic>? translations;

  SubChildes(
      {this.id,
      this.name,
      this.slug,
      this.icon,
      this.parentId,
      this.position,
      this.createdAt,
      this.updatedAt,
      this.homeStatus,
      this.priority,
      this.translations});

  SubChildes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    icon = json['icon'];
    parentId = json['parent_id'];
    position = json['position'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    homeStatus = json['home_status'];
    priority = json['priority'];
    if (json['translations'] != null) {
      translations = json["translations"];
    }

    /*if (json['translations'] != null) {
      translations = <Null>[];
      json['translations'].forEach((v) {
        translations!.add(Null.fromJson(v));
      });
    }*/
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['icon'] = icon;
    data['parent_id'] = parentId;
    data['position'] = position;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['home_status'] = homeStatus;
    data['priority'] = priority;
    if (translations != null) {
      data['translations'] = translations!.map((v) => v!.toJson()).toList();
    }
    return data;
  }
}

/*class Translations {
  List<dynamic>? translations;

  Translations({this.translations});

  factory Translations.fromJson(Map<String, dynamic> json) {
    return Translations();
  }

  Map<String,dynamic> toJson(){
    return{

    } ;
  }
}*/
