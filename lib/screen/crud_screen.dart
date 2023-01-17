import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/model/model_todo.dart';
import 'package:flutter_application/widget/todo_create.dart';
import 'package:flutter_application/widget/todo_update.dart';
import 'package:flutter_application/widget/todo_update2.dart';
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
        onTap: () async {
          return await showDialog(
            context: context,
            builder: (context) {
              return UpdateWidget(todo: todo);
            },
          );
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
