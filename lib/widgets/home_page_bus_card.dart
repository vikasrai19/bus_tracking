import 'package:bus_tracking/pages/bus_details_page.dart';
import 'package:flutter/material.dart';

class HomePageBusCard extends StatelessWidget {
  const HomePageBusCard({
    super.key,
    this.heroKey = '',
    this.busNo = 'MNG 01',
    this.startingPoint = 'Derlakatte',
  });

  final String heroKey;
  final String? busNo;
  final String? startingPoint;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BusDetailsPage()),
      ),
      child: Hero(
        tag: heroKey,
        child: Container(
          width: size.width,
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    busNo!,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Text(
                    'Nitte - $startingPoint',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
              Image.asset(
                'assets/images/main_bus.png',
                width: size.width * 0.4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
