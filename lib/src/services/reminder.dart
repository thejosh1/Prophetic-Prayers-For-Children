class Reminder {
  int? id;
  String? title;
  String? note;
  int? isCompleted;
  String? time;
  String? date;
  int? color;
  int? remind;
  String? repeat;

  Reminder({
    this.id,
    this.title,
    this.note,
    this.isCompleted,
    this.time,
    this.date,
    this.color,
    this.remind,
    this.repeat
});

  Reminder.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    note = json['note'];
    isCompleted = json['isCompleted'];
    time = json['time'];
    date = json['date'];
    color = json['color'];
    remind = json['remind'];
    repeat = json['repeat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['note'] = note;
    data['isCompleted'] = isCompleted;
    data['time'] = time;
    data['date'] = date;
    data['color'] = color;
    data['remind'] = remind;
    data['repeat'] = repeat;
    return data;
  }

}