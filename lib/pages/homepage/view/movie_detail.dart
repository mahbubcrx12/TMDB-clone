import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmdb_clone/model/movie_model.dart';

class MovieInfoPage extends StatelessWidget {
  MovieInfoPage({Key? key, required this.selectedMovie}) : super(key: key);
  MovieModel selectedMovie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF032541),
          title: Text("${selectedMovie.title}"),
          centerTitle: true,
        ),
        body: Container(
          height:  MediaQuery.of(context).size.height ,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                "${selectedMovie.image}",
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height * .7,
                width: MediaQuery.of(context).size.width * .90,

              ),
              
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Movie Name: ${selectedMovie.title}",style: TextStyle(
                      fontSize: 25,
                      color: Colors.black
                    ),),
                    Text("Release year: ${selectedMovie.year}",style: TextStyle(
                        fontSize: 25,
                        color: Colors.black
                    ),)
                  ],
                ),
              ),

            ],
          ),
        ));
  }
}
