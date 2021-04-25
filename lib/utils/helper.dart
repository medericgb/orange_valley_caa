import 'package:orange_valley_caa/models/video.dart';

List<Video> getFakeVideos() {
  return [
    Video(
      name: "Jean",
      description: "This is a description",
      thumbnail:
          "http://orangevalleycaa.org/api/media/images/thumbs/WomanSculptsClay_042009083.png",
      keywords: "This is a keyword",
    ),
    Video(
      name: "Jean",
      description: "This is a description",
      thumbnail:
          "http://orangevalleycaa.org/api/media/images/thumbs/WomanSculptsClay_042009083.png",
      keywords: "This is a keyword",
    ),
    Video(
      name: "Jean",
      description: "This is a description",
      thumbnail:
          "http://orangevalleycaa.org/api/media/images/thumbs/WomanSculptsClay_042009083.png",
      keywords: "This is a keyword",
    ),
    Video(
      name: "Jean",
      description: "This is a description",
      thumbnail:
          "http://orangevalleycaa.org/api/media/images/thumbs/WomanSculptsClay_042009083.png",
      keywords: "This is a keyword",
    ),
    Video(
      name: "Jean",
      description: "This is a description",
      thumbnail:
          "http://orangevalleycaa.org/api/media/images/thumbs/WomanSculptsClay_042009083.png",
      keywords: "This is a keyword",
    ),
  ];
}

// VideoSort permet d'avoir
// qu'une des 3 valeurs qu'il énumère
enum VideoSort { id, name, duration }

// Ajoute de nouvelle fonctionnalité de l'enum VideoSort
extension ParseEnumName on VideoSort {
  String filterName() {
    return this.toString().split(',').last;
  }
}
