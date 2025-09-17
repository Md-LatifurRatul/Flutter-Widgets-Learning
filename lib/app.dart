import 'package:flutter/material.dart';
import 'package:flutter_widgets/widgets/Snackbar/snack_bar_app.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: SegmentedButtonApp(),
      home: SnackBarApp(),
      theme: theme,
    );
  }

  ThemeData get theme => ThemeData(colorSchemeSeed: const Color(0xff6750a4));
}
