import 'dart:convert';
import 'dart:io';

import 'package:tmdb_clone/model/movie_model.dart';
import 'package:http/http.dart' as http;

class MovieDetails {

  static const Map<String, String> defaultHeader = {
    "X-RapidAPI-Key":"1ab7d2f230mshcf76ade66fd0e68p1e5554jsn0d7fdcc4fc1f",
     "Accept": "application/json",

  };

  Future<List<MovieModel>> fetchMovies() async {
    List<MovieModel> movieData = [];


    try {
      var link = "https://imdb-top-100-movies.p.rapidapi.com/";
      var response =
      await http.get(Uri.parse(link), headers: await defaultHeader);
      print("ppppppppppppp");

      if (response.statusCode == 200) {
         var data = jsonDecode(response.body);

        MovieModel movieModel;
        for (var i in data) {
          movieModel = MovieModel.fromJson(i);
          movieData.add(movieModel);
        }

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