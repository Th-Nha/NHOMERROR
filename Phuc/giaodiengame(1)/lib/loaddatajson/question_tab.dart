// import 'package:flutter/material.dart';
// import 'package:giaodiengame/loaddatajson/question_obj.dart';
// import 'package:giaodiengame/loaddatajson/question_provider.dart';

// class contacttab extends StatefulWidget {
//   const contacttab({super.key});

//   @override
//   State<StatefulWidget> createState() {
//     return contacttabstate();
//   }
// }

// class contacttabstate extends State<contacttab> {
//   //bo sung 6

//   List<questionobject> lscontact = [];

//   void _loaddanhsachcontact() async {
//     final data = await questionprovider.getallquesrtion();
//     setState(() {});
//     lscontact = data;
//   }

//   @override
//   void initState() {
//     super.initState();
//     _loaddanhsachcontact();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // bo sung khi co du lieu
//     return Container(
//         padding: EdgeInsets.all(5),
//         child: Stack(
//           children: [
//             ListView.builder(
//               itemCount: lscontact.length,
//               itemBuilder: (context, index) => Card(
//                   child: ListTile(
//                 leading: CircleAvatar(
//                     backgroundImage:
//                         CachedNetworkImageProvider(lscontact[index].picture),
//                     child: Text(
//                         '${lscontact[index].name.substring(0, 1).toUpperCase()}')),
//                 title: Text('${lscontact[index].name}'),
//                 subtitle: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(lscontact[index].phone),
//                     Text(lscontact[index].email)
//                   ],
//                 ),
//                 onTap: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => contactdetail(
//                           Contact: lscontact[index],
//                         ),
//                       ));
//                 },
//               )),
//             ),
//           ],
//         ));
//   }
// }
