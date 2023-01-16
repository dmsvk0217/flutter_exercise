import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";
import 'package:flutter_application/model/model_movie.dart';
import 'package:flutter_application/screen/detail_screen.dart';
import 'package:get/get.dart';

class LikeScreen extends StatefulWidget {
  @override
  State<LikeScreen> createState() => _LikeScreenState();
}

class _LikeScreenState extends State<LikeScreen> {
  Widget _buildBody() {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('movie')
          .where('like', isEqualTo: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();
        return _buildList(snapshot.data!.docs);
      },
    );
  }

  Widget _buildList(List<DocumentSnapshot> snapshot) {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 1 / 1.5,
        padding: EdgeInsets.all(3),
        children: snapshot.map((data) => _buildListItem(data)).toList(),
      ),
    );
  }

  Widget _buildListItem(DocumentSnapshot data) {
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
          Container(
            child: Row(
              children: [
                Image.asset(
                  'images/netflix_logo.png',
                  fit: BoxFit.contain,
                  height: 25,
                ),
                Container(
                  padding: EdgeInsets.only(left: 30),
                  child: Text(
                    "내가 찜한 콘텐츠",
                    style: TextStyle(fontSize: 14),
                  ),
                )
              ],
            ),
          ),
          _buildBody(),
        ],
      ),
    );
  }
}
