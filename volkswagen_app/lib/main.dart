import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:volkswagen_app/utils/screen_wrapper.dart';

import 'model/car_model.dart';

void main() {
  runApp(const MyApp());
}

List<CarModel> car1 = [];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.robotoTextTheme().copyWith(
          bodyText1:
              TextStyle(color: Colors.black), // change the color as needed
          bodyText2:
              TextStyle(color: Colors.black), // change the color as needed
        ),
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: ScreenWrapper(),
    );
  }
}
