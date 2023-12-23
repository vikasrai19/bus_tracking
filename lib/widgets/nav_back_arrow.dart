import 'package:flutter/material.dart';

class NavBackArrow extends StatelessWidget {
  const NavBackArrow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => Navigator.pop(context),
      icon: Icon(Icons.arrow_back),
    );
  }
}
