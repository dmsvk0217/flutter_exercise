import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/model/model_todo.dart';
import 'package:get/get.dart';

class CrudScreen extends StatefulWidget {
  @override
  State<CrudScreen> createState() => _CrudScreenState();
}

class _CrudScreenState extends State<CrudScreen> {
  List<bool> doneList = [];

  _CrudScreenState() {
    initState();
  }

  Widget _buildBody() {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('todo').snapshots(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();
        return _buildList(snapshot.data!.docs);
      },
    );
  }

  Widget _buildList(List<DocumentSnapshot> snapshot) {
    List<Todo> todoList = snapshot.map((e) => Todo.fromSnapshot(e)).toList();

    return Expanded(
      child: ListView(
        children: snapshot.map((data) => _buildListItem(data)).toList(),
      ),
    );
  }

  Widget _buildListItem(DocumentSnapshot data) {
    final todo = Todo.fromSnapshot(data);
    var done = todo.done;

    return Container(
      color: Colors.grey,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: InkWell(
        onTap: () {
          // Get.to(() => todoDetail());
        },
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(todo.title),
                  Text(todo.content),
                ],
              ),
            ),
            done
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        done = !done;
                        todo.reference?.update({"done": !todo.done});
                      });
                    },
                    icon: Icon(Icons.check),
                  )
                : IconButton(
                    onPressed: () {
                      setState(() {
                        done = !done;
                        todo.reference?.update({"done": !todo.done});
                      });
                    },
                    icon: Icon(Icons.close),
                  ),
            IconButton(
                onPressed: () {
                  todo.reference?.delete();
                },
                icon: Icon(Icons.delete)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          _buildBody(),
          Container(
            alignment: Alignment.bottomRight,
            padding: EdgeInsets.all(20),
            child: FloatingActionButton(
              onPressed: () async {
                // Get.to(() => ());
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

class createWidget extends StatelessWidget {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        child: Column(
          children: [
            Text("Todo 등록하기"),
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'title'),
            ),
            TextField(
              controller: _contentController,
              decoration: InputDecoration(labelText: 'content'),
            ),
          ],
        ),
      ),
      actions: [
        Center(
          child: TextButton(
            onPressed: () {
              Map<String, dynamic> newTodo =
                  new Todo(_titleController.text, _contentController.text)
                      .toMap();

              FirebaseFirestore.instance
                  .collection("todo")
                  .add(newTodo)
                  .whenComplete(() {
                Get.back();
              });
            },
            child: Text("등록하기"),
          ),
        )
      ],
    );
  }
}
