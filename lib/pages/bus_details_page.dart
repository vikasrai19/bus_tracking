import 'package:bus_tracking/blocs/bus_detail_bloc/bus_detail_bloc.dart';
import 'package:bus_tracking/blocs/bus_detail_bloc/bus_detail_event.dart';
import 'package:bus_tracking/blocs/bus_detail_bloc/bus_details_state.dart';
import 'package:bus_tracking/helper/helper_functions.dart';
import 'package:bus_tracking/models/bus_details_model.dart';
import 'package:bus_tracking/widgets/custom_snackbar.dart';
import 'package:bus_tracking/widgets/grid_cart.dart';
import 'package:bus_tracking/widgets/home_page_bus_card.dart';
import 'package:bus_tracking/widgets/nav_back_arrow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BusDetailsPage extends StatefulWidget {
  const BusDetailsPage({super.key});

  @override
  State<BusDetailsPage> createState() => _BusDetailsPageState();
}

class _BusDetailsPageState extends State<BusDetailsPage> {
  final HelperFunction helperInstance = HelperFunction.instance;

  @override
  void initState() {
    BlocProvider.of<BusDetailBloc>(context).add(
      GetBusDetails(collegeBusId: helperInstance.getCollegeBusId()),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: BlocConsumer<BusDetailBloc, BusDetailsState>(
                builder: (context, state) {
              if (state is BusDetailsLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is BusDetailsLoadedState) {
                return BusDetailsCard(
                  busDetail: state.busDetail,
                );
              } else if (state is BusDetailsErrorState) {
                return Center(
                  child: Text(state.message!),
                );
              }
              return const SizedBox();
            }, listener: (context, state) {
              if (state is BusDetailsErrorState) {
                showSnackbar(
                  context,
                  state.message!,
                  actionLabel: 'Retry',
                  onAction: () {
                    BlocProvider.of<BusDetailBloc>(context).add(
                      GetBusDetails(
                          collegeBusId: helperInstance.getCollegeBusId()),
                    );
                  },
                );
              }
            }),
          ),
        ),
      ),
    );
  }
}

class BusDetailsCard extends StatelessWidget {
  const BusDetailsCard({super.key, this.busDetail});

  final BusDetailsModel? busDetail;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            NavBackArrow(),
          ],
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        HomePageBusCard(
          heroKey: 'HomePage',
          busNo: busDetail?.busNo,
          startingPoint: busDetail?.startingPoint,
        ),
        SizedBox(
          height: size.height * 0.03,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GridCard(
              name: 'Starting Point',
              value: busDetail?.startingPoint,
              reduceSize: true,
            ),
            const GridCard(
              name: 'Ending Point',
              value: 'Nitte',
              reduceSize: true,
            ),
          ],
        ),
        SizedBox(
          height: size.height * 0.03,
        ),
        Text(
          'Bus Stop Points',
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: busDetail?.busBoardingPoints?.length,
              itemBuilder: (context, index) {
                return BusBoardingPointCard(
                  busBoardingPoint: busDetail?.busBoardingPoints![index],
                );
              }),
        )
      ],
    );
  }
}

class BusBoardingPointCard extends StatelessWidget {
  const BusBoardingPointCard({
    super.key,
    this.busBoardingPoint,
  });

  final BusBoardingPoints? busBoardingPoint;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Column(
        children: [
          Text(
            'Boarding Point Name',
            style: Theme.of(context).textTheme.labelSmall,
          ),
          Text(
            '${busBoardingPoint?.boardingPointName}',
          ),
        ],
      ),
      trailing: Column(
        children: [
          Text(
            'Boarding Time',
            style: Theme.of(context).textTheme.labelSmall,
          ),
          Text('${busBoardingPoint?.boardingTime}'),
        ],
      ),
    );
  }
}
