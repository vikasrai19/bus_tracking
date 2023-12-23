import 'package:flutter/material.dart';

class BottomNavIcon extends StatelessWidget {
  const BottomNavIcon({
    super.key,
    this.icon,
    this.selectedIcon,
    this.isSelected = false,
    this.onClick,
  });

  final IconData? icon;
  final IconData? selectedIcon;
  final bool? isSelected;
  final Function? onClick;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => onClick!(),
      icon: Icon(
        isSelected! ? selectedIcon : icon,
        color: isSelected! ? Colors.black : Colors.grey,
        size: 28,
      ),
    );
  }
}
