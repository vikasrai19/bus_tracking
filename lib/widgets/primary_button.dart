import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final Function? onPressed;
  final String? buttonName;

  const PrimaryButton({
    super.key,
    this.onPressed,
    this.buttonName,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(Theme.of(context).colorScheme.primary),
        shape: MaterialStateProperty.all(const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(6.0)),
        )),
      ),
      onPressed: () => onPressed!(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
        child: Text(
          buttonName!,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}
