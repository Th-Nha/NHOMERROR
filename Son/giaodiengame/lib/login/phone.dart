// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'otp.dart';

// class ScreenPhone extends StatefulWidget {
//   const ScreenPhone({super.key});
//   static String verify = "";
//   @override
//   State<ScreenPhone> createState() {
//     return ScreenPhoneState();
//   }
// }

// class ScreenPhoneState extends State<ScreenPhone> {
//   TextEditingController country = TextEditingController();
//   @override
//   void initState() {
//     country.text = "+84";
//     super.initState();
//   }

//   var phone = "";
//   @override
//   Widget build(BuildContext context) {
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
//               color: Colors.white,
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
//                     Container(
//                       height: 55,
//                       decoration: BoxDecoration(
//                           border: Border.all(width: 1, color: Colors.grey),
//                           borderRadius: BorderRadius.circular(10)),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           SizedBox(
//                             width: 10,
//                           ),
//                           SizedBox(
//                             width: 40,
//                             child: TextField(
//                               controller: country,
//                               keyboardType: TextInputType.number,
//                               style: TextStyle(color: Colors.white),
//                               decoration:
//                                   InputDecoration(border: InputBorder.none),
//                             ),
//                           ),
//                           Text(
//                             "|",
//                             style: TextStyle(fontSize: 33, color: Colors.grey),
//                           ),
//                           SizedBox(
//                             width: 10,
//                           ),
//                           Expanded(
//                               child: TextField(
//                             keyboardType: TextInputType.phone,
//                             style: TextStyle(color: Colors.white),
//                             onChanged: (value) {
//                               phone = value;
//                             },
//                             decoration: InputDecoration(
//                                 border: InputBorder.none,
//                                 hintText: "Phone",
//                                 hintStyle: TextStyle(color: Colors.white)),
//                           ))
//                         ],
//                       ),
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
//                             await FirebaseAuth.instance.verifyPhoneNumber(
//                               phoneNumber: '${country.text + phone}',
//                               verificationCompleted:
//                                   (PhoneAuthCredential credential) {},
//                               verificationFailed: (FirebaseAuthException e) {},
//                               codeSent:
//                                   (String verificationId, int? resendToken) {
//                                 ScreenPhone.verify = verificationId;
//                                 Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) => ScreenOTP()));
//                               },
//                               codeAutoRetrievalTimeout:
//                                   (String verificationId) {},
//                             );
//                           },
//                           child: Text("Gữi mã xác nhận")),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ));
//   }
// }
