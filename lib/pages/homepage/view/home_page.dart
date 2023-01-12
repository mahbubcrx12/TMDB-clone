import 'package:flutter/material.dart';
import 'package:tmdb_clone/model/movie_model.dart';
import 'package:tmdb_clone/service/movie_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //calling movie details from api
   List<MovieModel> movieData=[];

  @override
  void didChangeDependencies()async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    movieData= await MovieDetails().fetchMovies();
  setState(() {

  });

  }



  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          children: [
            Container(
               height: size.height*.4,
                width: size.width,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              const Color(0xFF3366FF),
                              const Color(0xFF00CCFF),
                            ],
                            begin: const FractionalOffset(0.0, 0.0),
                            end: const FractionalOffset(1.0, 0.0),
                            stops: [0.0, 1.0],
                            tileMode: TileMode.clamp),
                      ),
                    ),
                    Positioned(
                        child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome.",
                            style: TextStyle(
                                fontSize: 40,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Millions of movies,TV\nshows and People to\ndiscover.Explore now.",
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    )),
                    Positioned(
                        bottom: 50,
                        left: 10,
                        right: 10,
                        child: Container(
                          height: 50,
                          width: size.width * .9,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(40)),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 15,
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                  hintText: "Search...",
                                  border: InputBorder.none),
                            ),
                          ),
                        )),
                    Positioned(
                        bottom: 50,
                        right: 10,
                        child: Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.teal,
                        borderRadius: BorderRadius.circular(40),
                        gradient: LinearGradient(
                            colors: [

                              const Color(0xFF19d0b3),
                              const Color(0xFF01b6e1),
                            ],
                            begin: const FractionalOffset(0.0, 0.0),
                            end: const FractionalOffset(1.0, 0.0),
                            stops: [0.0, 1.0],
                            tileMode: TileMode.clamp
                        )
                      ),
                          child: Center(
                            child: Text("Search",style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                            fontWeight: FontWeight.bold
                            ),
                            ),
                          ),
                    ))
                  ],
                )),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Text("What's popular ",style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                ),),
                Container(
                  height: 50,
                  width: 120,
                  decoration: BoxDecoration(
                    color: Color(0xff032541),
                    borderRadius: BorderRadius.circular(40)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("On TV",style: TextStyle(color: Colors.white),),
                    Center(child: IconButton(onPressed: (){}, 
                        icon: Icon(Icons.arrow_drop_down,
                          size: 35,
                          color: Colors.white,)))
                  ],),
                )
              ],
            ),
          ),
            Container(
              height: size.height*.4,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: movieData.length,
                  itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 220,
                        width: size.width*.4,
                        decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                            child: Image.network("${movieData[index].image}",fit: BoxFit.cover,)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Container(
                          width: 200,
                          child: Text("${movieData[index].title}",
                            style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),

                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text("${movieData[index].year}",style: TextStyle(
                          color: Colors.black.withOpacity(.4),
                          fontSize: 18,
                        ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text("Rating: ${movieData[index].rating}",style: TextStyle(
                          color: Colors.black.withOpacity(.8),
                          fontSize: 18,
                        ),),
                      )
                    ],
                  ),
                );
              }),
            )

        ]
    )
      )

    );
  }
}
