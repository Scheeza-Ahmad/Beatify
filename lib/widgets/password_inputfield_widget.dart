import 'package:flutter/material.dart';

class PasswordInput extends StatefulWidget {
  final String hintText;
  final String text;
  final TextEditingController textEditingController;

  const PasswordInput({
    required this.textEditingController,
    required this.hintText,
    required this.text,
    super.key,
  });

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool pwdVisibility = false;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final textStyle = Theme.of(context).textTheme.bodyLarge;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 12),
        TextFormField(
          controller: widget.textEditingController,
          style: textStyle?.copyWith(color: Colors.white),

          obscureText: !pwdVisibility,
          decoration: InputDecoration(
            hintText: widget.hintText,
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

            suffixIcon: InkWell(
              onTap: () => setState(() => pwdVisibility = !pwdVisibility),
              child: Icon(
                pwdVisibility
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                color: Colors.grey.shade400,
                size: 18,
              ),
            ),
          ),
          validator: (val) {
            if (val!.isEmpty) {
              return 'Required';
            }
            return null;
          },
        ),
      ],
    );
  }
}
