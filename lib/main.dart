import 'package:audioplayerui/screens/home_screen.dart';
import 'package:audioplayerui/screens/playlist_screen.dart';
import 'package:audioplayerui/screens/song_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: Colors.white,
                displayColor: Colors.white,
              ),
        ),
        home: const HomeScreen(),
        getPages: [
          GetPage(
            name: "/",
            page: () => const HomeScreen(),
          ),
          GetPage(
            name: "/song",
            page: () => const SongScreen(),
          ),
          GetPage(
            name: "/playlist",
            page: () => const PlaylistScreen(),
          ),
        ]);
  }
}
