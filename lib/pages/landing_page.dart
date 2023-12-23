import 'package:bus_tracking/pages/login_page.dart';
import 'package:bus_tracking/widgets/landing_page_image.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key, this.showPrimaryButton = true});
  final bool? showPrimaryButton;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(flex: 4),
            LandingPageImage(),
            const SizedBox(
              height: 10,
            ),
            Text(
              'FIND YOUR',
              style: Theme.of(context)
                  .textTheme
                  .labelLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'BUS HERE !',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              'Track Your Bus On The Go',
              style: Theme.of(context).textTheme.labelSmall,
            ),
            const Spacer(),
            showPrimaryButton! ? const LandingPageButton() : const SizedBox(),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class LandingPageButton extends StatelessWidget {
  const LandingPageButton({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.white),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(
            vertical: 12.0,
          ),
        ),
        shape: MaterialStateProperty.all(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
        ),
      ),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      },
      child: SizedBox(
        width: size.width * 0.6,
        child: Center(
          child: Text(
            'Get Started',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
