class DiskModel {
  int? id;
  String? title;

  DiskModel({this.id, this.title});
  DiskModel.fromMap(Map<String, dynamic> map) {
    id = map["id"];
    title = map["title"];
  }

  Map<String, dynamic> toMap() {
    return {"id": id, "title": title};
  }

  @override
  String toString() {
    return "DiskModel(id: $id, title: $title)";
  }

  static String get ddl {
    return """
    CREATE TABLE IF NOT EXISTS disks (
      id  INTEGER PRIMARY KEY AUTOINCREMENT,
      title TEXT
    )
    """;
  }

  static String get resetDdl {
    return "DROP TABLE IF EXISTS disks";
  }
}
