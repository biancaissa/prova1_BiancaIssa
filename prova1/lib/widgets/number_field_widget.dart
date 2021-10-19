import 'package:flutter/material.dart';

class NumberFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String title;

  const NumberFieldWidget({
    Key? key,
    required this.controller,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Text('$title:'),
          const SizedBox(width: 20),
          Expanded(
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.number,
            ),
          ),
        ],
      ),
    );
  }
}
