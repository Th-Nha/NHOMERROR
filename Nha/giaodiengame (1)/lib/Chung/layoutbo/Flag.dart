// import 'package:flutter/material.dart';
// import 'package:giaodiengame/vao_game/vaogame.dart';

// class Flag extends StatelessWidget {
//   Flag({super.key, required this.path});
//   String path;
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: MediaQuery.of(context).size.width / 5,
//       child: SizedBox(
//         child: TextButton(
//           onPressed: () {
//             Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => vaogame(
//                     id: 1,
//                     sumquestion: 0,
//                     point: 0,
//                   ),
//                 ));
//           },
//           child: Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(200),
//               color: Colors.black,
//               border: Border.all(
//                 width: 2,
//               ),
//             ),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(200),
//               child: Image.asset(
//                 path,
//                 fit: BoxFit.cover,
//                 width: MediaQuery.of(context).size.width / 8,
//                 height: MediaQuery.of(context).size.width / 8,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
