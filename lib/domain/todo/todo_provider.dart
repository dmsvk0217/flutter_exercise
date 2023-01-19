import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application/domain/todo/todo.dart';

class TodoProvider {
  final _db = FirebaseFirestore.instance;
  final _collection = "todo";

//read
  Future<QuerySnapshot<Map<String, dynamic>>> getAllFuture() async {
    var result = await _db.collection(_collection).get();
    return result;
  }

  Stream<QuerySnapshot> getAllStream() {
    Stream<QuerySnapshot> result = _db.collection(_collection).snapshots();
    return result;
  }

  Future<DocumentSnapshot> getById(String id) async {
    return await _db.collection(_collection).doc(id).get();
  }

//create
  Future<DocumentSnapshot> create(Todo todo) async {
    Map<String, dynamic> data = todo.toMap();
    return await _db.collection(_collection).add(data).then((value) {
      value.update({"id": value.id});
      return value.get();
    });
  }

//update
  Future<void> updateById(Todo newTodo, String id) async {
    Map<String, dynamic> data = newTodo.toMap();
    await _db.collection(_collection).doc(id).update(data);
  }

//delete
  Future<void> deleteById(String id) async {
    await _db.collection(_collection).doc(id).delete();
  }

  Future<void> deleteByReference(DocumentReference reference) async {
    await reference.delete();
  }
}
