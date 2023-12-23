import 'package:bus_tracking/blocs/auth_bloc/auth_bloc.dart';
import 'package:bus_tracking/blocs/bottom_nav_bloc/bottom_nav_bloc.dart';
import 'package:bus_tracking/blocs/bus_detail_bloc/bus_detail_bloc.dart';
import 'package:bus_tracking/blocs/dashboard_bloc/dashboard_bloc.dart';
import 'package:bus_tracking/blocs/profile_bloc/profile_bloc.dart';
import 'package:bus_tracking/blocs/start_up_bloc/start_up.dart';
import 'package:bus_tracking/blocs/start_up_bloc/start_up_event.dart';
import 'package:bus_tracking/blocs/start_up_bloc/start_up_state.dart';
import 'package:bus_tracking/constants/theme_constant.dart';
import 'package:bus_tracking/helper/helper_functions.dart';
import 'package:bus_tracking/pages/landing_page.dart';
import 'package:bus_tracking/pages/login_page.dart';
import 'package:bus_tracking/pages/main_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  HelperFunction helperInstance = HelperFunction.instance;
  helperInstance.init();
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (_) => StartUpBloc()),
    BlocProvider(create: (_) => BottomNavBloc()),
    BlocProvider(create: (_) => AuthBloc()),
    BlocProvider(create: (_) => DashboardBloc()),
    BlocProvider(create: (_) => ProfileBloc()),
    BlocProvider(create: (_) => BusDetailBloc()),
  ], child: const MyApp()));
  // runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      BlocProvider.of<StartUpBloc>(context).add(StartUpAuthEvent());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bus Tracking',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      themeMode: ThemeMode.light,
      home: BlocBuilder<StartUpBloc, StartUpState>(
        builder: (context, state) {
          if (state is StartUpIdleState) {
            return const LandingPage(
              showPrimaryButton: false,
            );
          } else if (state is StartUpFirstTimeState) {
            return const LandingPage(
              showPrimaryButton: true,
            );
          } else if (state is StartUpLoadedState) {
            return LoginPage();
          } else if (state is SignedInState) {
            return MainPage();
          } else if (state is StartUpErrorState) {
            return Scaffold(
              body: Center(
                child: Text(
                  '${state.error}',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            );
          }
          return const Scaffold();
        },
      ),
    );
  }
}
