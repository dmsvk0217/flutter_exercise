import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application/domain/todo/todo.dart';
import 'package:flutter_application/domain/todo/todo_provider.dart';

class TodoRepository {
  TodoProvider _todoProvider = TodoProvider();

//read
  Future<List<Todo>> getAllFuture() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _todoProvider.getAllFuture();
    List<Todo> list =
        snapshot.docs.map((doc) => Todo.fromSnapshot(doc)).toList();
    return list;
  }

  Stream<List<Todo>> getAllStream() {
    Stream<QuerySnapshot> snapshots = _todoProvider.getAllStream();
    Stream<List<Todo>> result = snapshots.map(
      (snapshot) => snapshot.docs
          .map(
            (doc) => Todo.fromSnapshot(doc),
          )
          .toList(),
    );
    return result;
  }

  Future<Todo> getById(String id) async {
    DocumentSnapshot result = await _todoProvider.getById(id);
    return result.data() == null ? Todo() : Todo.fromSnapshot(result);
  }

  Future<Todo> getByReference(DocumentReference reference) async {
    DocumentSnapshot result = await reference.get();
    return result.data() == null ? Todo() : Todo.fromSnapshot(result);
  }

//create
  Future<int> create(Todo newTodo) async {
    DocumentSnapshot result = await _todoProvider.create(newTodo);
    Todo todo = Todo.fromSnapshot(result);
    return todo.id != null ? 1 : -1;
  }

//update
  Future<int> updateById(Todo newTodo, String id) async {
    //void 반환
    await _todoProvider.updateById(newTodo, id);

    //void이기 때문에 get()하여 update 완료 확인하기
    Todo todo = await getById(id);
    print("[TodoRepository] updateById 후 getById의 todo : $todo");
    print(todo.title == newTodo.title);
    print(todo.content == newTodo.content);

    bool result =
        todo.title == newTodo.title && todo.content == newTodo.content;
    return result ? 1 : -1;
  }

//delete
  Future<int> deleteById(String id) async {
    //void 반환
    await _todoProvider.deleteById(id);
    //void이기 때문에 get()하여 delete 완료 확인하기
    Todo todo = await getById(id);
    print("[TodoRepository] deleteById 후 getById의 todo : $todo");
    print(todo.id == null);
    return todo.id == null ? 1 : -1;
  }

  Future<int> deleteByReference(DocumentReference reference) async {
    //void 반환
    await _todoProvider.deleteByReference(reference);
    //void이기 때문에 get()하여 delete 완료 확인하기
    Todo todo = await getByReference(reference);
    print("[TodoRepository] deleteByReference 후 getByReference todo : $todo");
    print(todo.id == null);
    return todo.id == null ? 1 : -1;
  }
}
