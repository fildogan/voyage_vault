import 'package:flutter/material.dart';

class AddEditFormBody extends StatelessWidget {
  final List<Widget> children;
  final Key formKey;

  const AddEditFormBody(
      {super.key, required this.children, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: children,
        ),
      ),
    );
  }
}
