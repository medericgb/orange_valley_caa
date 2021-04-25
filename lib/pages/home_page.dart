import 'package:flutter/material.dart';
import 'package:orange_valley_caa/services/video_api.dart';
import 'package:orange_valley_caa/utils/constants.dart';
import 'package:orange_valley_caa/utils/helper.dart';
import 'package:orange_valley_caa/widgets/video_grid.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var videos = [];

  @override
  Widget build(BuildContext context) {
    getVideosFromApi().then((value) {
      setState(() {
        videos = value;
      });
    });
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Orange Valley CAA",
          style: TextStyle(
            fontFamily: 'ZenDots',
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: backgroundColor,
        child: VideosGrid(videos: videos),
      ),
      // USING FUTURE BUILDER
      // body: Container(
      //   color: backgroundColor,
      //   child: FutureBuilder(
      //     future: getVideosFromApi(),
      //     builder: (context, snapshot) {
      //       if (snapshot.connectionState == ConnectionState.waiting)
      //         return Center(child: CircularProgressIndicator());
      //       else if (snapshot.hasError)
      //         return Center(child: Text(snapshot.error));
      //       else
      //         return VideosGrid(videos: snapshot.data);
      //     },
      //   ),
      // ),
    );
  }
}
