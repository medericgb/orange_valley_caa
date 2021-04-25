import 'package:flutter/material.dart';
import 'package:orange_valley_caa/models/video.dart';
import 'package:orange_valley_caa/utils/constants.dart';

// Widget représentant la page de détails
class DetailsPage extends StatelessWidget {
  DetailsPage({this.video});
  final Video video;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          video.name,
          style: TextStyle(
            fontFamily: 'ZenDots',
          ),
        ),
      ),
      body: Container(
        color: backgroundColor,
        height: double.infinity,
        child: _VideoDetail(video),
      ),
    );
  }
}

// Widget affichant la liste des informations
class _VideoDetail extends StatelessWidget {
  _VideoDetail(this.video);
  final Video video;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _DetailsPoster(
          posterUrl: video.thumbnail,
        ),
        SizedBox(height: 15.0),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: _getDescription(),
        ),
        SizedBox(height: 15.0),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: _DetailsKeywords(
            keywords: video.keywords,
          ),
        ),
      ],
    );
  }

  // Méthode retournant la description d'une vidéo
  Widget _getDescription() => Text(
        video.description,
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.white,
        ),
      );
}

// Detail Poster
class _DetailsPoster extends StatelessWidget {
  _DetailsPoster({this.posterUrl});
  final posterUrl;
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: posterUrl,
      child: Container(
        width: double.infinity,
        height: 200.0,
        child: Image.network(
          posterUrl,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}

// Keywords
class _DetailsKeywords extends StatelessWidget {
  final keywords;
  _DetailsKeywords({this.keywords});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        children: [
          for (var genre in keywords.split(','))
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Chip(
                label: Text(genre),
              ),
            )
        ],
      ),
    );
  }
}
