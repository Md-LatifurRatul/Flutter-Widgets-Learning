import 'package:flutter/material.dart';

class SnackBarApp extends StatefulWidget {
  const SnackBarApp({super.key});
  @override
  State<SnackBarApp> createState() => _SnackBarApp();
}

class _SnackBarApp extends State<SnackBarApp> {
  SnackBarBehavior? _snackBarBehavior = SnackBarBehavior.floating;
  bool _withIcon = true;
  bool _withAction = true;
  bool _multiline = false;
  bool _longActionLabel = false;
  double _sliderValue = 0.25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Snack bar show")),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _snackShow();
        },
        icon: const Icon(Icons.play_arrow),
        label: const Text("Show Snackbar"),
      ),
      body: ListView(
        children: [
          ExpansionTile(
            title: const Text('Behavior'),
            initiallyExpanded: true,
            children: [
              RadioGroup<SnackBarBehavior>(
                groupValue: _snackBarBehavior,
                onChanged: (SnackBarBehavior? value) {
                  setState(() {
                    _snackBarBehavior = value;
                  });
                },
                child: RadioListTile<SnackBarBehavior>(
                  value: SnackBarBehavior.fixed,
                  title: const Text("Fixed"),
                ),
              ),

              RadioGroup<SnackBarBehavior>(
                groupValue: _snackBarBehavior,
                onChanged: (SnackBarBehavior? value) {
                  setState(() {
                    _snackBarBehavior = value;
                  });
                },
                child: RadioListTile<SnackBarBehavior>(
                  value: SnackBarBehavior.floating,
                  title: const Text("Floating"),
                ),
              ),
            ],
          ),

          ExpansionTile(
            title: const Text('Content'),
            initiallyExpanded: true,
            children: [
              SwitchListTile(
                title: const Text("Include close Icon"),
                value: _withIcon,
                onChanged: (bool value) {
                  setState(() {
                    _withIcon = value;
                  });
                },
              ),

              SwitchListTile(
                title: const Text("Multi Line Text"),
                value: _multiline,
                onChanged: (bool value) {
                  _multiline = value;
                },
              ),

              SwitchListTile(
                title: const Text("Include Action"),
                value: _withAction,
                onChanged: (bool value) {
                  setState(() {
                    _withAction = value;
                  });
                },
              ),

              SwitchListTile(
                title: const Text("Long Action Label"),
                value: _longActionLabel,
                onChanged: !_withAction
                    ? null
                    : (bool value) {
                        setState(() {
                          _longActionLabel = value;
                        });
                      },
              ),
            ],
          ),

          ExpansionTile(
            title: const Text('Action new-line overflow threshold'),

            initiallyExpanded: true,

            children: [
              Slider(
                value: _sliderValue,

                divisions: 20,
                label: _sliderValue.toStringAsFixed(2),

                onChanged: (double value) => setState(() {
                  _sliderValue = value;
                }),
              ),
            ],
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }

  void _snackShow() {
    ScaffoldMessenger.of(context).showSnackBar(_snackBar());
  }

  SnackBar _snackBar() {
    final SnackBarAction? action = _withAction
        ? SnackBarAction(
            label: _longActionLabel ? "Long Action Text" : "Action",
            onPressed: () {},
          )
        : null;

    final double? width = _snackBarBehavior == SnackBarBehavior.floating
        ? 400.0
        : null;
    final String label = _multiline
        ? 'A Snack Bar with a multiline text with spans of multiple line text '
              'lines. can look at how the Action Label moves around when trying '
              'to layout this text.'
        : "Single Line Snackbar Example";

    return SnackBar(
      content: Text(label),
      showCloseIcon: _withIcon,
      width: width,
      behavior: _snackBarBehavior,
      action: action,
      duration: const Duration(seconds: 3),
      actionOverflowThreshold: _sliderValue,
    );
  }
}
