
import 'package:flutter/material.dart';

import '../Screens/video_page.dart';

class VideoPlayerApp extends StatelessWidget {
  const VideoPlayerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Video player',
        theme: ThemeData(
            primaryColor: Colors.white70
            ,
            appBarTheme: AppBarTheme(
                color: Colors.green.shade800

            )
        ),
        themeMode:ThemeMode.light,
        home:VideoPage()
    );
  }
}
