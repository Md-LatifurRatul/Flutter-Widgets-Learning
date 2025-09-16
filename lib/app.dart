import 'package:flutter/material.dart';
import 'package:flutter_widgets/widgets/Segmented_Button/segmented_button_app.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SegmentedButtonApp(),
      theme: theme,
    );
  }

  ThemeData get theme => ThemeData(colorSchemeSeed: const Color(0xff6750a4));
}
