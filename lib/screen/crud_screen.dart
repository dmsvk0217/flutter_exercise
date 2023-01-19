import 'package:flutter/material.dart';
import 'package:flutter_application/controller/todo_controller.dart';
import 'package:flutter_application/domain/todo/todo.dart';
import 'package:flutter_application/widget/UpdateTotoDialog.dart';
import 'package:flutter_application/widget/todo_create.dart';
import 'package:get/get.dart';

class CrudScreen extends StatefulWidget {
  @override
  State<CrudScreen> createState() => _CrudScreenState();
}

class _CrudScreenState extends State<CrudScreen> {
  List<bool> doneList = [];
  final TodoController _todoController = Get.put(TodoController());

  Widget _buildBody() {
    // return StreamBuilder(
    return StreamBuilder(
      stream: _todoController.getAllStream(),
      builder: (BuildContext context, AsyncSnapshot<List<Todo>> snapshot) {
        if (snapshot.hasError || !snapshot.hasData)
          return LinearProgressIndicator();

        return Expanded(
          child: ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (BuildContext context, int index) {
              Todo todo = snapshot.data![index];
              return Container(
                color: Colors.green,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: InkWell(
                  onTap: () async {
                    return await showDialog(
                        context: context,
                        builder: ((context) {
                          return UpdateTotoDialog(todo: todo);
                        }));
                  },
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            children: [
                              Text(todo.title!),
                              Text(todo.content!),
                            ],
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          print("push update");
                          print(todo.done);
                          todo.reference!.update({"done": !todo.done!});
                        },
                        icon:
                            todo.done! ? Icon(Icons.check) : Icon(Icons.cancel),
                      ),
                      IconButton(
                        onPressed: () {
                          print("onPressed : ${todo.id!}");
                          // _todoController.deleteById(todo.id!);
                          _todoController.deleteByReference(todo.reference!);
                        },
                        icon: Icon(Icons.delete),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          _buildBody(),
          Container(
            alignment: Alignment.bottomRight,
            padding: EdgeInsets.all(20),
            child: FloatingActionButton(
              onPressed: () async {
                return await showDialog(
                  context: context,
                  builder: (context) {
                    return createWidget();
                  },
                );
              },
              child: Icon(Icons.add),
            ),
          )
        ],
      ),
    );
  }
}
