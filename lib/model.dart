class Note {
  String title;
  Note({this.title});

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      title: json["title"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "title": this.title,
    };
  }
}
