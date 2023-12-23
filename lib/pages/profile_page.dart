import 'package:bus_tracking/blocs/profile_bloc/profile_bloc.dart';
import 'package:bus_tracking/blocs/profile_bloc/profile_event.dart';
import 'package:bus_tracking/blocs/profile_bloc/profile_state.dart';
import 'package:bus_tracking/helper/helper_functions.dart';
import 'package:bus_tracking/models/user_model.dart';
import 'package:bus_tracking/widgets/profile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final HelperFunction helperInstance = HelperFunction.instance;

  @override
  void initState() {
    BlocProvider.of<ProfileBloc>(context).add(
      GetProfileData(userId: helperInstance.getUserId()),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: size.width,
      child: SafeArea(
        child: BlocConsumer<ProfileBloc, ProfileState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is ProfileLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is ProfileLoadedState) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ProfileCard(
                    profile: state.profile,
                  ),
                );
              } else if (state is ProfileErrorState) {
                return Center(
                  child: Text(state.message!),
                );
              }
              return const Center(
                child: Text(
                  'Please refresh the app',
                ),
              );
            }),
      ),
    );
  }
}
