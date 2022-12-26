// import 'package:flutter/animation.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';

// class questioncontroller extends GetxController
//     with SingleGetTickerProviderMixin {
//   late PageController _pageController;
//   late AnimationController _animationController;
//   late Animation _animation;
//   Animation get animation => this._animation;
//   @override
//   void onInit() {
//     _animationController = AnimationController(
//       duration: Duration(seconds: 30),
//       vsync: this,
//     );
//     _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
//       ..addListener(() {
//         update();
//       });
//     _animationController.forward();

//     super.onInit();
//   }
// }
