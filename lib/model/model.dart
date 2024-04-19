class NoteModel {
  String? userName;
  String? note;
  String? noteI;
  String? des;

  NoteModel({this.userName, this.note, this.noteI, this.des});

  NoteModel.fromJson(Map<String, dynamic> json) {
    userName = json["userName"];
    note = json["note"];
    noteI = json["noteI"];
    des = json["des"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["userName"] = userName;
    _data["note"] = note;
    _data["noteI"] = noteI;
    _data["des"] = des;
    return _data;
  }
}
