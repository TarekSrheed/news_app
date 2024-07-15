import 'dart:async';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation backgroundcolor;
  late Animation sizeOfImageOne;
  late Animation sizeOfImageTwo;
  late Animation pathOfImageTwo;

  late Animation<Positioned> animation;
  GlobalKey<AnimatedListState> key = GlobalKey();
  Future future = Future(() {});
  // buildImage() async {
  //   future = future.then(
  //     (value) async {
  //       await Future.delayed(
  //           const Duration(
  //             seconds: 5,
  //           ), () {
  //         key.currentState!.build(context);
  //       });
  //     },
  //   );
  // }

  @override
  void initState() {
    // WidgetsBinding.instance.addPostFrameCallback(
    //   (_) {
    //     buildImage();
    //   },
    // );
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    // heightOfImage = Tween<double>(begin: 140, end: 0).animate(controller);
    // widthOfImage = Tween<double>(begin: 144, end: 0).animate(controller);
    backgroundcolor =
        ColorTween(begin: Colors.white, end: Colors.blue).animate(controller);
    sizeOfImageOne = TweenSequence([
      TweenSequenceItem(tween: Tween<double>(begin: 140, end: 140), weight: 2),
      TweenSequenceItem(tween: Tween<double>(begin: 140, end: 0), weight: 1),
    ]).animate(controller);

    sizeOfImageTwo = TweenSequence([
      
     
      TweenSequenceItem(tween: Tween<double>(begin: 168, end: 168), weight: 10),
      TweenSequenceItem(tween: Tween<double>(begin: 168, end: 103), weight: 2),
    ]).animate(controller);
 pathOfImageTwo = TweenSequence([
      TweenSequenceItem(tween: Tween<double>(begin: 200, end: 300), weight: 1),
      // TweenSequenceItem(tween: Tween<double>(begin: 168, end: 168), weight: 15),
      // TweenSequenceItem(tween: Tween<double>(begin: 168, end: 103), weight: 1),
    ]).animate(controller);

    controller.forward();
    super.initState();
  }

  Tween<Offset> offset =
      Tween(begin: const Offset(0, 1), end: const Offset(1, 1));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundcolor.value,
      body: Center(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: AnimatedBuilder(
                key: key,
                animation: controller,
                builder: ((context, _) {
                  return Image.asset(
                    "assets/images/imageOne.png",
                    width: sizeOfImageOne.value,
                    height: sizeOfImageOne.value,
                  );
                }),
              ),
            ),
            AnimatedBuilder(
                animation: controller,
                builder: (context, _) {
                  return AnimatedPositioned(
                    duration: const Duration(milliseconds: 100),
                    bottom: pathOfImageTwo.value,
                    left: 120,

                    child: Image.asset(
                      'assets/images/imageTwo.png',
                      width: sizeOfImageTwo.value,
                      height: sizeOfImageTwo.value,
                    ),
                    // ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
