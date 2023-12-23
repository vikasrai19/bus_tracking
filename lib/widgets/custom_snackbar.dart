import 'package:flutter/material.dart';

Widget customSnackBar(
    {required String message, String? actionLabel, Function? onAction}) {
  return SnackBar(
    content: Text(
      message,
      style: const TextStyle(
        color: Colors.black,
      ),
    ),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10.0),
      ),
    ),
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.white,
    dismissDirection: DismissDirection.horizontal,
    action: SnackBarAction(
      textColor: Colors.red,
      label: actionLabel.toString(),
      onPressed: () => onAction!(),
    ),
  );
}

void showSnackbar(
  BuildContext context,
  String message, {
  Function? onAction,
  String? actionLabel = '',
}) {
  final SnackBar snackBar = customSnackBar(
      message: message,
      actionLabel: actionLabel!,
      onAction: onAction ?? () {}) as SnackBar;
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
