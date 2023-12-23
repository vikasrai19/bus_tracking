import 'package:flutter/material.dart';

class SettingBottomSheet extends StatelessWidget {
  const SettingBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      constraints: BoxConstraints(
        maxHeight: size.height * 0.16,
      ),
      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 24.0),
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black45,
            offset: Offset(0, 0),
            blurRadius: 10.0,
            blurStyle: BlurStyle.outer,
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SettingButtonWidget(
            tileName: 'Terms And Conditions',
            onClick: () {},
            trailingIcon: Icons.file_copy_outlined,
          ),
          SettingButtonWidget(
            tileName: 'Logout',
            onClick: () {},
            trailingIcon: Icons.logout,
          ),
        ],
      ),
    );
  }
}

class SettingButtonWidget extends StatelessWidget {
  const SettingButtonWidget({
    super.key,
    this.tileName,
    this.trailingIcon,
    this.onClick,
  });

  final String? tileName;
  final IconData? trailingIcon;
  final Function? onClick;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => onClick!(),
      contentPadding: EdgeInsets.zero,
      trailing: Icon(
        trailingIcon!,
        color: Theme.of(context).colorScheme.outline,
      ),
      title: Text(
        '$tileName',
        style: Theme.of(context).textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}
