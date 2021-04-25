import 'package:flutter/material.dart';
import 'package:orange_valley_caa/models/video.dart';
import 'package:orange_valley_caa/pages/details_page.dart';

// Widget affichant une GridView
class VideosGrid extends StatelessWidget {
  final List<Video> videos;

  VideosGrid({this.videos});
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: [
        for (var video in videos)
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsPage(video: video),
              ),
            ),
            child: _VideoTile(
              imageUrl: video.thumbnail,
              title: video.name,
            ),
          ),
      ],
    );
  }
}

// Widget réprésentant une élément de la GridView
class _VideoTile extends StatelessWidget {
  _VideoTile({this.imageUrl, this.title});
  final String imageUrl, title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      // Mettre de l'espace autour de la GridView
      padding: const EdgeInsets.all(10.0),
      child: Stack(
        children: [
          // Image
          Hero(
            tag: imageUrl,
            child: Container(
              height: double.infinity,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Image.network(imageUrl, fit: BoxFit.cover),
              ),
            ),
          ),
          // Titre
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.black.withOpacity(0.6),
              height: 35.0,
              child: Center(
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
