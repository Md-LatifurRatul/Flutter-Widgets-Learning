import 'package:flutter/material.dart';
import 'package:flutter_widgets/widgets/Segmented_Button/multiple_choice.dart';
import 'package:flutter_widgets/widgets/Segmented_Button/single_choice.dart';

class SegmentedButtonApp extends StatelessWidget {
  const SegmentedButtonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Text("Single Choice", style: textStyle),
            SingleChoice(),
            SizedBox(height: 20),

            Text("Multiple Choice", style: textStyle),
            MultipleChoice(),
            Spacer(),
          ],
        ),
      ),
    );
  }

  TextStyle get textStyle => TextStyle(
    color: Colors.blueAccent,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
}
