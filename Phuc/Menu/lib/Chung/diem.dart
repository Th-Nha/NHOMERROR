// import 'dart:async';

// import 'package:flutter/material.dart';

// class diem extends StatefulWidget {
//   const buttontime({super.key});

//   @override
//   State<buttontime> createState() => _buttontime();
// }

// class _buttontime extends State<buttontime> {
//   int count = 30;
//   late Timer _timer;
//   void startime() {
//     count = 30;

//     _timer = Timer.periodic(Duration(seconds: 1), (timer) {
//       setState(() {
//         if (count > 0) {
//           count--;
//         } else
//           (timer.cancel());
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(children: [
//       TextButton(
//           onPressed: startime,
//           child: Row(
//             children: [
//               Icon(
//                 Icons.timer_off_rounded,
//                 color: Colors.yellow,
//               ),
//               Text(
//                 '$count' + 's',
//                 style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.w600,
//                     color: Colors.yellow),
//               ),
//             ],
//           )),
//     ]);
//   }
// }
