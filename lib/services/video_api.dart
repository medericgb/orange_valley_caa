import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:orange_valley_caa/models/video.dart';

Future<List<Video>> getVideosFromApi() async {
  final url = "https://orangevalleycaa.org/api/videos/";
  var response = await http.get(url);

  if (response.statusCode == 200) {
    var json = response.body;
    return videoFromJson(json);
  } else {
    return [];
  }
}
