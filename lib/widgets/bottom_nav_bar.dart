import 'package:bus_tracking/blocs/bottom_nav_bloc/bottom_nav_bloc.dart';
import 'package:bus_tracking/blocs/bottom_nav_bloc/bottom_nav_event.dart';
import 'package:bus_tracking/widgets/bottom_nav_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key, this.selectedIndex});
  final int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * 0.07,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 4.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BottomNavIcon(
            icon: Icons.home_outlined,
            selectedIcon: Icons.home,
            isSelected: selectedIndex! == 1,
            onClick: () => BlocProvider.of<BottomNavBloc>(context)
                .add(ChangeBottomNavEvent(selectedIndex: 1)),
          ),
          // BottomNavIcon(
          //   icon: Icons.map_outlined,
          //   selectedIcon: Icons.map,
          //   isSelected: selectedIndex! == 2,
          //   onClick: () => BlocProvider.of<BottomNavBloc>(context).add(
          //     ChangeBottomNavEvent(selectedIndex: 2),
          //   ),
          // ),
          BottomNavIcon(
            icon: Icons.person_outline,
            selectedIcon: Icons.person,
            isSelected: selectedIndex! == 3,
            onClick: () => BlocProvider.of<BottomNavBloc>(context).add(
              ChangeBottomNavEvent(selectedIndex: 3),
            ),
          ),
        ],
      ),
    );
  }
}
