import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmdb_clone/model/movie_model.dart';
import 'package:tmdb_clone/pages/homepage/view/home_page.dart';
import 'package:tmdb_clone/pages/homepage/view/movie_detail.dart';
import 'package:tmdb_clone/service/movie_service.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      initialRoute: "/homePage",
      getPages: [
        GetPage(name: "/homePage", page: ()=>HomePage()),

      ],

    );
  }
}
