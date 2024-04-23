class NoteModel {
  String? note;
  String? des;
  String? id;
  String? searchBy;

  NoteModel({this.note, this.des, this.id, this.searchBy});

  NoteModel.fromJson(Map<String, dynamic> json) {
    note = json["note"];
    des = json["des"];
    id = json["id"];
    searchBy = json["searchBy"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["note"] = note;
    data["des"] = des;
    data["id"] = id;
    data["searchBy"] = searchBy;
    return data;
  }
}
