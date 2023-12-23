import 'package:flutter/material.dart';

class NotificationBottomSheet extends StatelessWidget {
  const NotificationBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      constraints: BoxConstraints(
        maxHeight: size.height * 0.4,
      ),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
      ),
      child: const Center(
        child: Text('No Notifications'),
      ),
    );
  }
}
