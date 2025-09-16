import 'package:flutter/material.dart';

enum Sizes { extraaSmall, small, medium, large, extraaLarge }

class MultipleChoice extends StatefulWidget {
  const MultipleChoice({super.key});

  @override
  State<MultipleChoice> createState() => _MultipleChoiceState();
}

class _MultipleChoiceState extends State<MultipleChoice> {
  Set<Sizes> selection = <Sizes>{Sizes.large, Sizes.extraaLarge};

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<Sizes>(
      segments: [
        ButtonSegment<Sizes>(value: Sizes.extraaSmall, label: Text("XS")),
        ButtonSegment<Sizes>(value: Sizes.small, label: Text("S")),
        ButtonSegment<Sizes>(value: Sizes.medium, label: Text("M")),
        ButtonSegment<Sizes>(value: Sizes.large, label: Text("L")),
        ButtonSegment<Sizes>(value: Sizes.extraaLarge, label: Text("XL")),
      ],
      selected: selection,
      onSelectionChanged: (Set<Sizes> newSelection) {
        setState(() {
          selection = newSelection;
        });
      },
      multiSelectionEnabled: true,
    );
  }
}
