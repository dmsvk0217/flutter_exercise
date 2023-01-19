import 'package:flutter_application/domain/todo/todo.dart';
import 'package:flutter_application/domain/todo/todo_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/state_manager.dart';

class TodoController extends GetxController {
  RxList list = <Todo>[].obs;
  TodoRepository _todoRepository = TodoRepository();

  @override
  void onInit() {
    super.onInit();
    getAllFuture();
  }

  //read
  Future<List<Todo>> getAllFuture() async {
    List<Todo> result = await _todoRepository.getAllFuture();
    list.value = result;
    return result;
  }

  Stream<List<Todo>> getAllStream() {
    return _todoRepository.getAllStream();
  }

  //create
  Future<int> create(Todo newTodo) async {
    int result = await _todoRepository.create(newTodo);
    if (result == 1) {
      print("[TodoController] create 성공 return : $result");
    } else {
      print("[TodoController] create 실패 return : $result");
    }
    return result;
  }

  //update
  Future<int> updateById(Todo newTodo, String id) async {
    int result = await _todoRepository.updateById(newTodo, id);
    return result;
  }

  //delete
  Future<int> deleteByReference(DocumentReference reference) async {
    int result = await _todoRepository.deleteByReference(reference);
    return result;
  }

  Future<int> deleteById(String id) async {
    int result = await _todoRepository.deleteById(id);
    return result;
  }
}
