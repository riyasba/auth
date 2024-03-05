


  //   final TextEditingController _recipientEmailController =
  //     TextEditingController();
  // final TextEditingController _mailMessageController = TextEditingController();

  // // Send Mail function
  // void sendMail() async {
  //   // change your email here
  //   String username = 'it.department@electromaxsa.com';
  //   // change your password here
  //   String password = 'puwsmrzkwpsvpjls';
  //   final smtpServer = SmtpServer("smtp.bizmail.yahoo.com",
  //   port: 465,
  //   ssl: true,
  //   username: username,
  //   password: password,
  //   ); 
  //   final message = Message()
  //     ..from = Address(username, 'Mail Service')
  //     ..recipients.add("riyasklb89@gmail.com")
  //     ..subject = 'Hyy Anas '
  //     ..text = 'This is a test message from server';
  //  print("---------------->>>>>");
  // //  //print(dat.mail);
  // //  var dat = await send(message, smtpServer);
  // //  print(dat.mail);
  // //  print(dat.mail);
  // //  print(dat.connectionOpened);
  // //  print(dat.messageSendingEnd);
  // //  print(dat.messageSendingStart);
  //   try {
  //     await send(message, smtpServer);
  //     print("-------on success");
  //     showSnackbar('Email sent successfully');
  //   } catch (e) {
  //     print("-------on f");
        
  //       print(e.toString());
     
  //   }
  // }



// import 'dart:js';

// import 'package:flutter/material.dart';
// import 'package:mailer/mailer.dart';
// import 'package:mailer/smtp_server.dart';
// import 'package:mailer/smtp_server/gmail.dart';

// class SendMail extends StatelessWidget {
//   const SendMail({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Flutter Mailer'),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             _showDialog(context);
//           },
//           child: const Text('Send Mail'),
//         ),
//       ),
//     );
//   }

//   void _showDialog(BuildContext context) {
//     TextEditingController recipientController = TextEditingController();
//     TextEditingController messageController = TextEditingController();

//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Send Email'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               TextField(
//                 controller: recipientController,
//                 decoration: InputDecoration(labelText: 'Recipient Email'),
//               ),
//               TextField(
//                 controller: messageController,
//                 decoration: InputDecoration(labelText: 'Message'),
//               ),
//             ],
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 _sendMail(
//                   recipientController.text,
//                   messageController.text,
//                 );
//                 Navigator.pop(context);
//               },
//               child: Text('Send'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void _sendMail(String recipientEmail, String mailMessage) async {
//     String username = 'it.department@electromaxsa.com';
//     String password = 'puwsmrzkwpsvpjls';
//     final smtpServer = gmail(username, password);
//     final message = Message()
//       ..from = Address(username, 'Mail Service')
//       ..recipients.add(recipientEmail)
//       ..subject = 'Mail'
//       ..text = 'Message: $mailMessage';

//     try {
//       await send(message, smtpServer);
//       _showSnackbar(context, 'Email sent successfully');
//     } catch (e) {
//       _showSnackbar(context, 'Failed to send email: $e');
//     }
//   }

//   void _showSnackbar(BuildContext context, String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(message),
//       ),
//     );
//   }
// }
