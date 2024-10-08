import 'package:flutter/material.dart';

class ContaninerWidget extends StatelessWidget {
  final String innerText;

  const ContaninerWidget({
    super.key,
    required this.innerText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey.shade800,
      ),
      child: Text(
        innerText,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
