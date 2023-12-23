import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyBoardType;
  final String placeholder;
  final String label;
  final Function onChange;
  final bool? isObscure;
  final Widget? leadingWidget;
  final Widget? trailingWidget;
  const CustomTextField({
    super.key,
    this.controller,
    required this.placeholder,
    required this.label,
    required this.onChange,
    this.keyBoardType = TextInputType.text,
    this.isObscure = false,
    this.leadingWidget,
    this.trailingWidget,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyBoardType,
      obscureText: isObscure!,
      style: const TextStyle(
        color: Colors.black,
      ),
      decoration: InputDecoration(
          prefixIcon: leadingWidget,
          suffixIcon: trailingWidget,
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black54,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black54,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black54,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          hintText: placeholder,
          labelText: label,
          labelStyle: const TextStyle(
            color: Colors.black87,
          ),
          hintStyle: const TextStyle(
            color: Colors.black45,
          )),
    );
  }
}
