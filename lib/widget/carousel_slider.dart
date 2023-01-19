import 'package:flutter/material.dart';
import 'package:flutter_application/domain/movie/movie.dart';
import 'package:flutter_application/main.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_application/screen/detail_screen.dart';
import 'package:get/get.dart';

class CarouselImage extends StatefulWidget {
  final List<Movie> movies;
  CarouselImage({required this.movies});
  _CarouselImageState createState() => _CarouselImageState();
}

class _CarouselImageState extends State<CarouselImage> {
  late List<Movie> movies;
  late List<Widget> images;
  late List<String> keywords;
  late List<bool> likes;
  late int _currentPage = 0;
  late String _currentKeyword;

  @override
  void initState() {
    super.initState;
    movies = widget.movies;
    images = movies.map((m) => Image.network(m.poster)).toList();
    keywords = movies.map((m) => m.keyword).toList();
    likes = movies.map((m) => m.like).toList();
    _currentKeyword = keywords[0];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
          ),
          CarouselSlider(
            items: images,
            options: CarouselOptions(onPageChanged: (index, reason) {
              setState(() {
                _currentPage = index;
                _currentKeyword = keywords[_currentPage];
              });
            }),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 3),
            child: Text(
              _currentKeyword,
              style: TextStyle(fontSize: 11),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Column(
                    children: [
                      likes[_currentPage]
                          ? IconButton(
                              onPressed: () {
                                setState(() {
                                  likes[_currentPage] = !likes[_currentPage];
                                  movies[_currentPage]
                                      .reference
                                      .update({'like': likes[_currentPage]});
                                });
                              },
                              icon: Icon(Icons.check),
                            )
                          : IconButton(
                              onPressed: () {
                                setState(() {
                                  likes[_currentPage] = !likes[_currentPage];
                                  movies[_currentPage]
                                      .reference
                                      .update({'like': likes[_currentPage]});
                                });
                              },
                              icon: Icon(Icons.add),
                            ),
                      Text(
                        '내가 찜한 콘텐츠',
                        style: TextStyle(fontSize: 11),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 10),
                  child: TextButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.play_arrow,
                      color: Colors.black,
                    ),
                    label: Text(
                      "재생",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(right: 10),
                    child: Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.to(() =>
                                DetailScreen(movie: movies[_currentPage]));
                          },
                          icon: Icon(Icons.info),
                        ),
                        Text(
                          '정보',
                          style: TextStyle(fontSize: 11),
                        )
                      ],
                    )),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: makeIndicator(likes, _currentPage),
            ),
          ),
        ],
      ),
    );
  }
}

List<Widget> makeIndicator(List list, int _currentPage) {
  List<Widget> results = [];
  for (var i = 0; i < list.length; i++) {
    results.add(Container(
      width: 8,
      height: 8,
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentPage == i
            ? Color.fromRGBO(0, 0, 0, 0.9)
            : Color.fromRGBO(0, 0, 0, 0.4),
      ),
    ));
  }
  return results;
}
