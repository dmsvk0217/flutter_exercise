import 'package:flutter/material.dart';
import 'package:flutter_application/model/model_movie.dart';
import 'package:flutter_application/widget/box_slider.dart';
import 'package:flutter_application/widget/carousel_slider.dart';
import 'package:flutter_application/widget/circle_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FirebaseFirestore db = FirebaseFirestore.instance;

  late Stream<QuerySnapshot> streamData;

  @override
  void initState() {
    super.initState();
    streamData = db.collection("movie").snapshots();
  }

  Widget _fetchData(BuildContext context) {
    var movieSnapshot =
        FirebaseFirestore.instance.collection('movie').snapshots();

    return StreamBuilder<QuerySnapshot>(
      stream: movieSnapshot,
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();
        return _buildBody(context, snapshot.data!.docs);
      },
    );
  }

//collection('movie').snapshots().data!.docs.data()를 map으로 바꿔 Movie 객채로 반환

  Widget _buildBody(BuildContext context, List<DocumentSnapshot> snapshot) {
    List<Movie> movies = snapshot.map((e) => Movie.fromSnapshot(e)).toList();
    return Column(
      children: [
        TopBar(),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                CarouselImage(movies: movies),
                CircleSlider(movies: movies),
                BoxSlider(movies: movies)
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _fetchData(context);
  }
}

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 7, 20, 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Image.asset(
            'images/netflix_logo.png',
            fit: BoxFit.contain,
            height: 25,
          ),
          Container(
            padding: EdgeInsets.only(right: 1),
            child: Text(
              'TV 프로그램',
              style: TextStyle(fontSize: 14),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 1),
            child: Text(
              '영화',
              style: TextStyle(fontSize: 14),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 1),
            child: Text(
              '내가 찜한 콘텐츠',
              style: TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
