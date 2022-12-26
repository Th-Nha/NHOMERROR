// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:giaodiengame/login/phone.dart';
// import 'package:giaodiengame/login/register.dart';
// import 'package:pinput/pinput.dart';

// class ScreenOTP extends StatefulWidget {
//   const ScreenOTP({super.key});
//   @override
//   State<ScreenOTP> createState() {
//     return ScreenOTPState();
//   }
// }

// class ScreenOTPState extends State<ScreenOTP> {
//   final FirebaseAuth auth = FirebaseAuth.instance;

//   @override
//   Widget build(BuildContext context) {
//     var code = "";
//     return Scaffold(
//         extendBodyBehindAppBar: true,
//         appBar: AppBar(
//           backgroundColor: Colors.transparent,
//           leading: IconButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             icon: Icon(
//               Icons.arrow_back_ios_rounded,
//               color: Colors.black,
//             ),
//           ),
//           elevation: 0,
//         ),
//         body: Stack(
//           children: [
//             Container(
//               decoration: BoxDecoration(
//                   image: DecorationImage(
//                       image: AssetImage('images/background.png'),
//                       fit: BoxFit.cover)),
//             ),
//             Container(
//               margin: EdgeInsets.only(left: 25, right: 25),
//               alignment: Alignment.center,
//               child: SingleChildScrollView(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Pinput(
//                       length: 6,
//                       onChanged: (value) {
//                         code = value;
//                       },
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     SizedBox(
//                       width: double.infinity,
//                       height: 45,
//                       child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                               primary: Colors.green.shade600,
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(10))),
//                           onPressed: () async {
//                             try {
//                               PhoneAuthCredential credential =
//                                   PhoneAuthProvider.credential(
//                                       verificationId: ScreenPhone.verify,
//                                       smsCode: code);

//                               await auth.signInWithCredential(credential);
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: ((context) => MyRegister())));
//                             } catch (e) {}
//                           },
//                           child: Text("Verify Phone Number")),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ));
//   }
// }
