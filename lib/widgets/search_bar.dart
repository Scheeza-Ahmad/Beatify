import 'package:flutter/material.dart';

class SearchBarr extends StatelessWidget {
  final String hint;
  final TextEditingController control;
  const SearchBarr({super.key, required this.hint, required this.control});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final textStyle = Theme.of(context).textTheme.bodyLarge;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: control,
          style: textStyle?.copyWith(color: Colors.white),

          decoration: InputDecoration(
            hintText: hint,
            hintStyle: textStyle?.copyWith(color: Colors.grey),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: primaryColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: primaryColor),
            ),
          ),
        ),
      ],
    );
  }
}
