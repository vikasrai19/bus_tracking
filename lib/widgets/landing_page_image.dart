import 'package:flutter/material.dart';

class LandingPageImage extends StatefulWidget {
  const LandingPageImage({
    super.key,
    this.width,
  });

  final double? width;

  @override
  State<LandingPageImage> createState() => _LandingPageImageState();
}

class _LandingPageImageState extends State<LandingPageImage>
    with TickerProviderStateMixin {
  late AnimationController _slideAnimationController;
  late Animation<Offset> _slideAnimationOffset;

  late AnimationController _fadeAnimationController;
  late Animation<double> _fadeAnimationOffset;

  @override
  void initState() {
    _slideAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _slideAnimationOffset = Tween<Offset>(
      begin: const Offset(0.0, -0.075),
      end: const Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(
        parent: _slideAnimationController,
        curve: Curves.easeInOut,
      ),
    );

    _slideAnimationController.forward();

    _fadeAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _fadeAnimationOffset = Tween<double>(
      begin: 0.5,
      end: 1.0,
    ).animate(
      CurvedAnimation(
          parent: _fadeAnimationController, curve: Curves.easeInOut),
    );

    _fadeAnimationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _slideAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FadeTransition(
      opacity: _fadeAnimationOffset,
      child: SlideTransition(
        position: _slideAnimationOffset,
        child: Image.asset(
          'assets/images/main_bus.png',
          width: size.width * 0.7,
        ),
      ),
    );
  }
}
