import 'package:flutter/material.dart';

class GridCard extends StatelessWidget {
  final String? name;
  final String? value;
  final bool? reduceSize;
  const GridCard({
    super.key,
    this.name,
    this.value,
    this.reduceSize = false,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Text(
          name!,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontSize: reduceSize! ? 14.0 : 16.0,
                fontWeight: FontWeight.w400,
              ),
        ),
        SizedBox(
          height: reduceSize! ? size.height * 0.004 : size.height * 0.01,
        ),
        Text(
          value!,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                fontSize: reduceSize! ? 18.0 : 22.0,
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }
}
