// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:get/get.dart';
// import 'package:giaodiengame/timmer/constants.dart';
// import 'package:giaodiengame/timmer/controller.dart';

// class buttontime extends StatefulWidget {
//   const buttontime({super.key});

//   @override
//   State<buttontime> createState() => _buttontime();
// }

// class _buttontime extends State<buttontime> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         children: [
//           Container(
//               width: double.infinity,
//               height: 35,
//               decoration: BoxDecoration(
//                   border: Border.all(
//                       color: Color.fromARGB(255, 25, 190, 240), width: 3),
//                   borderRadius: BorderRadius.circular(50)),
//               child: GetBuilder<questioncontroller>(
//                 init: questioncontroller(),
//                 builder: (controller) {
//                   print(controller.animation.value);
//                   return Stack(
//                     children: [
//                       LayoutBuilder(
//                         builder: (context, Constraints) => Container(
//                           width:
//                               Constraints.maxWidth * controller.animation.value,
//                           decoration: BoxDecoration(
//                               gradient: kPrimaryGradient,
//                               borderRadius: BorderRadius.circular(50)),
//                         ),
//                       ),
//                       Positioned.fill(
//                           child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             "${(controller.animation.value * 30).round()} sec",
//                             style: TextStyle(
//                                 fontSize:
//                                     MediaQuery.of(context).size.width / 20,
//                                 fontWeight: FontWeight.w600,
//                                 color: Colors.white),
//                           ),
//                           Icon(
//                             Icons.timelapse,
//                             color: Colors.white,
//                           )
//                         ],
//                       ))
//                     ],
//                   );
//                 },
//               ))
//         ],
//       ),
//     );
//   }
// }
