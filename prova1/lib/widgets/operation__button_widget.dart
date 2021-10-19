import 'package:flutter/material.dart';

class OperationButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const OperationButtonWidget(
      {Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
