import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      body: Column(
        children: [
          Expanded(
              flex: 3,
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
          Expanded(flex: 4, child: Container())
        ],
      ),
    );
  }
}
