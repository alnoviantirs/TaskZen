class CatatanInput {
  final String title;
  final String note;
  final String date;
  final String startTime;
  final String endTime;
  final String remind;
  final String repeat;
  final String? isCompleted;
  final String? createdAt;
  final String? updatedAt;

  CatatanInput({
    required this.title,
    required this.note,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.remind,
    required this.repeat,
    this.isCompleted,
    this.createdAt,
    this.updatedAt,
  });

  factory CatatanInput.fromJson(Map<String, dynamic> json) => CatatanInput(
        title: json["title"],
        note: json["note"],
        date: json["date"],
        startTime: json["starttime"],
        endTime: json["endtime"],
        remind: json["remind"],
        repeat: json["repeat"],
        isCompleted: json["isCompleted"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "note": note,
        "date": date,
        "starttime": startTime,
        "endtime": endTime,
        "remind": remind,
        "repeat": repeat,
        "isCompleted": isCompleted,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
      };
}
