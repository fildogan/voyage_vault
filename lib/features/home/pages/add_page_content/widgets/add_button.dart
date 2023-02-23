import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  const AddButton({
    super.key,
    required this.title,
    required this.pageRoute,
  });

  final String title;
  final Widget pageRoute;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ElevatedButton(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => pageRoute,
            fullscreenDialog: true,
          ),
        ),
        child: Container(
            width: 150,
            alignment: Alignment.center,
            child: AutoSizeText(
              title,
              maxLines: 1,
            )),
      ),
    );
  }
}
