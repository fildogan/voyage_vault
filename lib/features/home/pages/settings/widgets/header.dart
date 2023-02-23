import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header(
    this.text, {
    super.key,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(text),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
