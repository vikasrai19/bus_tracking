import 'package:bus_tracking/bottom_sheets/notification_bottom_sheet.dart';
import 'package:bus_tracking/bottom_sheets/setting_bottom_sheet.dart';
import 'package:bus_tracking/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({super.key, this.isHome = false});

  final HelperFunction helperInstance = HelperFunction.instance;

  final bool? isHome;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: !isHome! ? size.height * 0.08 : size.height * 0.1,
      width: size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome Back',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  helperInstance.getUserName(),
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            const Spacer(),
            GestureDetector(
              onTap: () => showModalBottomSheet(
                  context: context,
                  builder: (context) => NotificationBottomSheet()),
              child: SvgPicture.asset(
                'assets/icons/message.svg',
                width: 26,
              ),
            ),
            // SizedBox(
            //   width: size.width * 0.06,
            // ),
            // GestureDetector(
            //   onTap: () => showModalBottomSheet(
            //       context: context, builder: (context) => SettingBottomSheet()),
            //   child: SvgPicture.asset(
            //     'assets/icons/settings.svg',
            //     width: 24,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
