import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/domain/movie/movie.dart';
import 'package:flutter_application/screen/detail_screen.dart';
import 'package:get/get.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _filter = TextEditingController();
  FocusNode focusNode = FocusNode();
  String _searchText = "";

  _SearchScreenState() {
    _filter.addListener(() {
      setState(
        () {
          _searchText = _filter.text;
        },
      );
    });
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection("movie").snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return LinearProgressIndicator();
          return _buildList(context, snapshot.data!.docs);
        });
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    List<DocumentSnapshot> searchResults = [];
    for (DocumentSnapshot d in snapshot) {
      if (d.data.toString().contains(_searchText)) {
        searchResults.add(d);
      }
    }
    return Expanded(
      child: GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 1 / 1.5,
        padding: EdgeInsets.all(3),
        children:
            searchResults.map((data) => _buildListItem(context, data)).toList(),
      ),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final movie = Movie.fromSnapshot(data);
    return InkWell(
      child: Image.network(movie.poster),
      onTap: () {
        Get.to(() => DetailScreen(movie: movie));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
          ),
          Container(
            color: Colors.black,
            padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
            child: Row(
              children: [
                Expanded(
                  flex: 6,
                  child: TextField(
                    focusNode: focusNode,
                    style: TextStyle(fontSize: 15),
                    autofocus: false,
                    controller: _filter,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white12,
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.white60,
                        size: 20,
                      ),
                      suffixIcon: focusNode.hasFocus
                          ? IconButton(
                              onPressed: () => setState(() {
                                _searchText = "";
                                _filter.clear();
                              }),
                              icon: Icon(
                                Icons.cancel,
                                size: 20,
                              ),
                            )
                          : Container(),
                      hintText: '??????',
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius:
                              BorderRadius.all(Radius.circular((10)))),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius:
                              BorderRadius.all(Radius.circular((10)))),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius:
                              BorderRadius.all(Radius.circular((10)))),
                    ),
                  ),
                ),
                focusNode.hasFocus
                    ? Expanded(
                        child: TextButton(
                          child: Text('??????'),
                          onPressed: () {
                            setState(
                              () {
                                _filter.clear();
                                _searchText = "";
                                focusNode.unfocus();
                              },
                            );
                          },
                        ),
                      )
                    : Expanded(
                        flex: 0,
                        child: Container(),
                      )
              ],
            ),
          ),
          _buildBody(context),
        ],
      ),
    );
  }
}
