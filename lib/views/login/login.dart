// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:themar/core/dio_helper.dart';
//
// import '../products/view.dart';
//
// class LoginView extends StatefulWidget {
//   const LoginView({super.key});
//
//   @override
//   State<LoginView> createState() => _LoginViewState();
// }
//
// class _LoginViewState extends State<LoginView> {
//   final phoneController = TextEditingController();
//   final passwordController = TextEditingController();
//   bool isLoading = false;
//
//   Future<void> send() async {
//     isLoading = true;
//     setState(() {});
//     //https://thimar.amr.aait-d.com/api/
//     final response = await DioHelper.send("login", data: {
//       "phone": "966550011223344",
//       "password": "123456789 ",
//       "device_taken": "test",
//       "type": Platform.operatingSystem,
//       "user_type": "client"
//     });
//     if (response.isSuccess) {
//       Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => ProductsView(),
//           ));
//     } else {
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text(response.message!)));
//     }
//     isLoading = false;
//     setState(() {});
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: SingleChildScrollView(
//           padding: EdgeInsets.all(24),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               TextFormField(
//                 controller: phoneController,
//                 decoration: InputDecoration(labelText: "Phone Number"),
//               ),
//               SizedBox(height: 16),
//               TextFormField(
//                 controller: passwordController,
//                 decoration: InputDecoration(labelText: "Password"),
//               ),
//               SizedBox(height: 24),
//               isLoading
//                   ? Center(
//                       child: CircularProgressIndicator(),
//                     )
//                   : FilledButton(
//                       onPressed: () {
//                         send();
//                         // print(passwordController.text);
//                         // print(phoneController.text);
//                       },
//                       child: Text("Login"))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
