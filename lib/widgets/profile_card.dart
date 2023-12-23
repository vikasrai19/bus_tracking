import 'package:bus_tracking/helper/helper_functions.dart';
import 'package:bus_tracking/models/profile_model.dart';
import 'package:bus_tracking/models/user_model.dart';
import 'package:bus_tracking/pages/login_page.dart';
import 'package:bus_tracking/widgets/custom_snackbar.dart';
import 'package:bus_tracking/widgets/grid_cart.dart';
import 'package:flutter/material.dart';

import '../bottom_sheets/setting_bottom_sheet.dart';

class ProfileCard extends StatelessWidget {
  ProfileCard({
    super.key,
    this.profile,
  });

  final HelperFunction helperInstance = HelperFunction.instance;

  final ProfileModel? profile;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: size.height * 0.06,
        ),
        CircleAvatar(
          backgroundColor: Colors.grey[300],
          radius: size.width * 0.13,
          child: Icon(
            Icons.person,
            size: size.width * 0.2,
          ),
        ),
        SizedBox(
          height: size.height * 0.03,
        ),
        Text(
          profile?.name ?? '',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Text(
          profile?.email ?? '',
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
        ),
        SizedBox(
          height: size.height * 0.05,
        ),
        Expanded(
          child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2.3,
            ),
            children: [
              GridCard(
                name: 'Phone Number',
                value: profile?.phoneNo! ?? '',
              ),
              GridCard(
                name: 'Boarding Point',
                value: profile?.boardingPoint!,
              ),
              GridCard(
                name: 'Boarding Time',
                value: profile?.boardingTime,
              ),
              GridCard(
                name: 'Seat No',
                value: profile?.seatNo!.toString(),
              ),
            ],
          ),
        ),
        const Divider(),
        SizedBox(
          height: size.height * 0.01,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Settings',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              SettingButtonWidget(
                tileName: 'Terms And Conditions',
                onClick: () {},
                trailingIcon: Icons.file_copy_outlined,
              ),
              SettingButtonWidget(
                tileName: 'Logout',
                onClick: () {
                  showSnackbar(context, 'Signing Out ! Please wait');
                  Future.delayed(const Duration(seconds: 2), () {
                    helperInstance.invalidaate();
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                      (route) => false,
                    );
                  });
                },
                trailingIcon: Icons.logout,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
