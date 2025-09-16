import 'package:flutter/material.dart';

class LabelAboveTextField extends StatelessWidget {
  final String text;
  final String hint;
  final TextEditingController control;
  const LabelAboveTextField({
    super.key,
    required this.text,
    required this.hint,
    required this.control,
  });

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final textStyle = Theme.of(context).textTheme.bodyLarge;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 12),
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
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red, width: 1),
            ),
          ),
        ),
      ],
    );
  }
}
