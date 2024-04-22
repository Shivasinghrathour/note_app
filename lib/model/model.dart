class NoteModel {
  String? note;
  String? des;

  NoteModel({this.note, this.des});

  NoteModel.fromJson(Map<String, dynamic> json) {
    note = json["note"];
    des = json["des"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["note"] = note;
    data["des"] = des;
    return data;
  }
}
