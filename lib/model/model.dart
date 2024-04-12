class NoteModel {
  String? userName;
  String? note;
  String? noteI;

  NoteModel({this.userName, this.note, this.noteI});

  NoteModel.fromJson(Map<String, dynamic> json) {
    userName = json["userName"];
    note = json["note"];
    noteI = json["noteI"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["userName"] = userName;
    _data["note"] = note;
    _data["noteI"] = noteI;
    return _data;
  }
}
