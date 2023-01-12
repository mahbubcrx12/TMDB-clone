import 'dart:convert';

import 'package:tmdb_clone/model/movie_model.dart';
import 'package:http/http.dart' as http;

class MovieDetails {
  static const Map<String, String> defaultHeader = {
    "Accept": "application/json",
  };

  Future<List<MovieModel>> fetchMovies() async {
    List<MovieModel> movieData = [];


    try {
      var link = "https://api.themoviedb.org/3/movie/550?api_key=ceb50715fd9e6acdaac3a23fc6f2e746";
      var response =
      await http.get(Uri.parse(link), headers: await defaultHeader);
      if (response.statusCode == 200) {
        print("status code");
        print(response.statusCode);
       // print(response.body);
         var data = jsonDecode(response.body);

       var fromResponse=MovieModel.fromJson(data);
        print(fromResponse);
        // MovieModel movieModel;
        // for (var i in fromResponse) {
        //   movieModel = MovieModel.fromJson(i.);
        //   movieData.add(movieModel);
        // }
        print("mmmmmmmmmmmmmmmmmmmmm");
        print(movieData);
        return movieData;
      } else {
        return movieData;
      }
    } catch (e) {
      print(e);
      return movieData;
    }
  }
}