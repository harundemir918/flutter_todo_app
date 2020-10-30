class Task {
  int count;
  List<OneTask> tasks;

  Task({this.count, this.tasks});

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      count: json['count'],
      tasks: json['tasks'] != null
          ? (json['tasks'] as List).map((i) => OneTask.fromJson(i)).toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    if (this.tasks != null) {
      data['tasks'] = this.tasks.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OneTask {
  String id;
  String categoryId;
  String title;
  String done;
  String createDate;

  OneTask({
    this.id,
    this.title,
    this.categoryId,
    this.done,
    this.createDate,
  });

  factory OneTask.fromJson(Map<String, dynamic> json) {
    return OneTask(
      id: json['id'],
      categoryId: json['category_id'],
      title: json['title'],
      done: json['done'],
      createDate: json['create_date'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_id'] = this.categoryId;
    data['title'] = this.title;
    data['done'] = this.done;
    data['create_date'] = this.createDate;
    return data;
  }
}
