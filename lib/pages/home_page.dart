import 'package:bus_tracking/blocs/dashboard_bloc/dashboard_bloc.dart';
import 'package:bus_tracking/blocs/dashboard_bloc/dashboard_event.dart';
import 'package:bus_tracking/blocs/dashboard_bloc/dashboard_state.dart';
import 'package:bus_tracking/helper/helper_functions.dart';
import 'package:bus_tracking/models/dashboard_model.dart';
import 'package:bus_tracking/widgets/app_bar.dart';
import 'package:bus_tracking/widgets/custom_snackbar.dart';
import 'package:bus_tracking/widgets/grid_cart.dart';
import 'package:bus_tracking/widgets/home_page_bus_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HelperFunction helperInstance = HelperFunction.instance;

  @override
  void initState() {
    BlocProvider.of<DashboardBloc>(context).add(
      GetDashboardData(userId: helperInstance.getUserId()),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(
            isHome: true,
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          BlocConsumer<DashboardBloc, DashboardState>(
              builder: (context, state) {
            if (state is DashboardLoadingState) {
              return SizedBox(
                height: size.height * 0.6,
                width: size.width,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else if (state is DashboardLoadedState) {
              return DashboardWidget(
                dashboard: state.dashboard,
              );
            } else if (state is DashboardErrorState) {
              return SizedBox(
                height: size.height * 0.6,
                width: size.width,
                child: Center(
                  child: Text(
                    state.message!,
                  ),
                ),
              );
            }
            return const SizedBox();
          }, listener: (context, state) {
            if (state is DashboardErrorState) {
              showSnackbar(context, state.message!, actionLabel: 'Retry',
                  onAction: () {
                BlocProvider.of<DashboardBloc>(context).add(
                  GetDashboardData(userId: helperInstance.getUserId()),
                );
              });
            }
          })
        ],
      ),
    );
    // return Center(child: Text('Home Page'));
  }
}

class DashboardWidget extends StatelessWidget {
  const DashboardWidget({super.key, this.dashboard});

  final DashboardModel? dashboard;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        HomePageBusCard(
          heroKey: 'HomePage',
          busNo: dashboard?.busNo!,
          startingPoint: dashboard?.startingPoint,
        ),
        SizedBox(
          height: size.height * 0.04,
        ),
        Text(
          'Driver Details',
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GridCard(
              name: 'Name',
              value: dashboard?.driverName,
              reduceSize: true,
            ),
            GridCard(
              name: 'Phone Number',
              value: dashboard?.driverPhoneNo,
              reduceSize: true,
            ),
            const GridCard(
              name: 'Age',
              value: '-',
              reduceSize: true,
            ),
          ],
        ),
        SizedBox(
          height: size.height * 0.03,
        ),
        Text(
          'Conductor Details',
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GridCard(
              name: 'Name',
              value: '-',
              reduceSize: true,
            ),
            GridCard(
              name: 'Phone Number',
              value: '-',
              reduceSize: true,
            ),
            GridCard(
              name: 'Age',
              value: '-',
              reduceSize: true,
            ),
          ],
        ),
      ],
    );
  }
}
