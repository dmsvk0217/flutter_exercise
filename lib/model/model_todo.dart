import 'package:cloud_firestore/cloud_firestore.dart';

class Todo {
  late final String title;
  late final String content;
  late final bool done;
  late final DocumentReference? reference;

  bool getDone() {
    return done;
  }

  Todo(String title, String content, bool done) {
    this.title = title;
    this.content = content;
    this.done = done;
  }

  Map<String, dynamic> toMap() {
    return {
      'title': this.title,
      'content': this.content,
      'done': this.done,
    };
  }

  Todo.fromMap(Map<String, dynamic> map, {required this.reference})
      : title = map['title'],
        content = map['content'],
        done = map['done'];

  Todo.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data() as Map<String, dynamic>,
            reference: snapshot.reference);

  @override
  String toString() => "Todo<$title:$content>";
}
