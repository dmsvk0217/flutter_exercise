import 'package:flutter_application/domain/todo/todo.dart';
import 'package:flutter_application/domain/todo/todo_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/state_manager.dart';

class TodoController extends GetxController {
  RxList<Todo> list = <Todo>[].obs;
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
    Todo result = await _todoRepository.create(newTodo);
    if (result == 1) {
      print("[TodoController] create 성공 return : $result");
    } else {
      print("[TodoController] create 실패 return : $result");
    }
    if (result.id != null) {
      list.add(result);
      return 1;
    }
    return -1;
  }

  //update
  Future<int> updateById(Todo newTodo, String id) async {
    int result = await _todoRepository.updateById(newTodo, id);
    if (result == 1) {
      //update에 성공했으면 그 todo 객체를 가져와서 list에 반영하기
      // 새로 가져오지 않으면 id값을 할당하지 못함.
      Todo todo = await _todoRepository.getById(id);
      list.value = list.map((e) => e.id == id ? todo : e).toList();
    }
    return result;
  }

  //delete
  Future<int> deleteById(String id) async {
    int result = await _todoRepository.deleteById(id);
    if (result == 1) {
      list.value = list.where((e) => e.id != id).toList();
    }
    return result;
  }

  // Future<int> deleteByReference(DocumentReference reference) async {
  //   int result = await _todoRepository.deleteByReference(reference);
  //   return result;
  // }
}
