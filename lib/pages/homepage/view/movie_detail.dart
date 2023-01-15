import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmdb_clone/const/vedio_player_screen.dart';
import 'package:tmdb_clone/model/movie_model.dart';
import 'package:video_player/video_player.dart';
class MovieInfoPage extends StatefulWidget {
  MovieInfoPage({Key? key, required this.selectedMovie}) : super(key: key);
  MovieModel selectedMovie;



  @override
  State<MovieInfoPage> createState() => _MovieInfoPageState();
}

class _MovieInfoPageState extends State<MovieInfoPage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xFF032541),
          leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.menu_sharp,
                color: Colors.white,
              )),
          title: Image.asset(
            "asset/title.png",
            height: 40,
            width: 70,
          ),
          centerTitle: true,
          actions: [
            Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.person,
                      color: Colors.white,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                      color: Color(0xff0ab0df),
                    ))
              ],
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 50 ,
                width: double.infinity,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: [
                            Text("Overview",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                            Icon(Icons.arrow_drop_down)
                          ],),
                          Container(
                            color: Colors.blue,
                            height: 5,
                            width: 85,
                          )
                        ],
                      ),
                      Row(children: [
                        Text("Media",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                        Icon(Icons.arrow_drop_down)
                      ],),
                      Row(children: [
                        Text("Fandom",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                        Icon(Icons.arrow_drop_down)
                      ],),
                      Row(children: [
                        Text("Share",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                        Icon(Icons.arrow_drop_down)
                      ],)
                    ],
                  ),
                ),
              ),
            Container(
              height: MediaQuery.of(context).size.height*.3,
              width: double.infinity,
              child: Stack(
                children: [
                  Image.network("${widget.selectedMovie.thumbnail}",
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height*.3,
                    width: double.infinity,
                  ),
                  Positioned(
                    left: 10,
                      top: 20,
                      child:ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          height: 200,
                          width: 150,
                          child: Image.network("${widget.selectedMovie.image}",

                            fit: BoxFit.cover,),
                        ),
                      ) )
                ],
              ),
            ),
              Container(
                color: Colors.blueGrey,
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Flex(
                        direction: Axis.horizontal,
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              '${widget.selectedMovie.title}(${widget.selectedMovie.year})',
                              style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.blueGrey.shade500,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Rating: ${widget.selectedMovie.rating}/10',
                            style: TextStyle(fontSize: 20,color: Colors.white),
                          ),
                        ),
                        Container(
                          height: 20,
                          width: 1,
                          color: Colors.white,
                        ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Container(
                              child: InkWell(
                                child: Row(children: [
                                  Icon(Icons.play_arrow,color: Colors.white,),
                                  Text("Play Trailer",style: TextStyle(color: Colors.white),)
                                ],),
                                onTap: (){
                                  Get.to(()=>PlayTrailer(trailerLink: "${widget.selectedMovie.trailer}",));
                                },
                              ),
                            ),
                          )
                      ],),
                    ),
                    Flex(
                      direction: Axis.horizontal,
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment:CrossAxisAlignment.start,
                              children: [
                                Text("Overview",style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                                ),),
                                Text(
                                  '${widget.selectedMovie.description}',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal),
                                ),
                                SizedBox(height: 8,),
                                Text("Director",style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                ),),
                                Text(
                                  '${widget.selectedMovie.director}',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal),
                                ),
                                SizedBox(height: 8,),
                                Text("Writers",style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                ),),
                                Text(
                                  '${widget.selectedMovie.writers}',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal),
                                ),
                                SizedBox(height: 8,),
                                Text("Genre",style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                ),),
                                Text(
                                  '${widget.selectedMovie.genre}',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

            ],
          ),
        ));
  }
}
