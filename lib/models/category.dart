class Category {
  List<OneCategory> categories;
  int count;

  Category({this.categories, this.count});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      categories: json['categories'] != null
          ? (json['categories'] as List)
              .map((i) => OneCategory.fromJson(i))
              .toList()
          : null,
      count: json['count'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    if (this.categories != null) {
      data['categories'] = this.categories.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OneCategory {
  String id;
  String title;
  String color;
  String createDate;

  OneCategory({
    this.id,
    this.title,
    this.color,
    this.createDate,
  });

  factory OneCategory.fromJson(Map<String, dynamic> json) {
    return OneCategory(
      id: json['id'],
      title: json['title'],
      color: json['color'],
      createDate: json['create_date'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['color'] = this.color;
    data['create_date'] = this.createDate;
    return data;
  }
}
