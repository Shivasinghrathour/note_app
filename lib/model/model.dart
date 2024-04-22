class NoteModel {
  String? note;
  String? des;
  String? id;

  NoteModel({this.note, this.des, this.id});

  NoteModel.fromJson(Map<String, dynamic> json) {
    note = json["note"];
    des = json["des"];
    id = json["id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["note"] = note;
    data["des"] = des;
    data["id"] = id;
    return data;
  }
}
