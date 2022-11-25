// import 'dart:io';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';

// import 'package:google_fonts/google_fonts.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:provider/provider.dart';

// import 'package:sealed_bidd/AutenticationScreens/login.dart';

// import 'package:sealed_bidd/Models/database.dart';

// class Signup extends StatefulWidget {
//   const Signup({super.key});

//   @override
//   State<Signup> createState() => _SignupState();
// }

// class _SignupState extends State<Signup> {
//   late DatabaseReference dbRef;
//   final _formKey = GlobalKey<FormState>();

//   FocusNode myFocusNode = new FocusNode();
//   final namecontroller = TextEditingController();
//   final usernamecontroller = TextEditingController();
//   final emailcontroller = TextEditingController();
//   final passwordcontroller = TextEditingController();

//   bool ishiden = true;
//   bool val = false;

//   void viewPassword() {
//     if (ishiden) {
//       setState(() {
//         ishiden = false;
//       });
//     } else {
//       setState(() {
//         ishiden = true;
//       });
//     }
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     dbRef = FirebaseDatabase.instance.ref().child('Users');
//   }

//   @override
//   Widget build(BuildContext context) {
//     var dbclass = context.read<Database>();
//     return Scaffold(
//       body: SingleChildScrollView(
//           child: Form(
//         key: _formKey,
//         child: Column(
//           children: [
//             SizedBox(height: MediaQuery.of(context).size.height * 0.035),
//             InkWell(
//               onTap: () async {
//                 var pickedFile =
//                     await ImagePicker().pickImage(source: ImageSource.gallery);

//                 dbclass.setProfileImage(File(pickedFile!.path));
//               },
//               child: Consumer<Database>(builder: (context, value, child) {
//                 return value.Profilepicture != null
//                     ? SizedBox(
//                         width: double.infinity,
//                         height: 150,
//                         child: CircleAvatar(
//                           child: ClipOval(
//                             child: Image.file(
//                               value.Profilepicture!,
//                               fit: BoxFit.cover,
//                               width: 150,
//                             ),
//                           ),
//                         ),
//                       )
//                     : Stack(
//                         alignment: Alignment.center,
//                         children: [
//                           const SizedBox(
//                             width: double.infinity,
//                             height: 200,
//                             child: CircleAvatar(
//                               backgroundImage: NetworkImage(
//                                   "https://cdn2.vectorstock.com/i/1000x1000/17/61/male-avatar-profile-picture-vector-10211761.jpg"),
//                             ),
//                           ),
//                           Container(
//                             width: MediaQuery.of(context).size.width * 0.35,
//                             height: MediaQuery.of(context).size.height * 0.05,
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(18),
//                               border: Border.all(color: Colors.black),
//                             ),
//                             child: Padding(
//                               padding: const EdgeInsets.only(left: 16.0),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     'Add Iamge',
//                                     style: GoogleFonts.workSans(
//                                       fontSize: 15,
//                                       fontWeight: FontWeight.w500,
//                                       fontStyle: FontStyle.normal,
//                                       color: Color(0xFF266325),
//                                     ),
//                                     textAlign: TextAlign.center,
//                                   ),
//                                   Icon(
//                                     Icons.camera,
//                                     color: Color(0xFF266325),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           )
//                         ],
//                       );
//               }),
//             ),
//             // Container(
//             //   decoration: BoxDecoration(
//             //     color: Color(0xFF02C908),
//             //     shape: BoxShape.circle,
//             //   ),
//             //   height: MediaQuery.of(context).size.height * 0.2,
//             //   child: Icon(
//             //     Icons.person,
//             //     size: 100,
//             //     color: Colors.white,
//             //   ),
//             // ),
//             Container(
//               width: double.infinity,
//               child: Text(
//                 'Hello User!',
//                 style: GoogleFonts.workSans(
//                   fontSize: 22,
//                   fontWeight: FontWeight.w500,
//                   fontStyle: FontStyle.normal,
//                   color: Color(0xFF266325),
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//             SizedBox(height: MediaQuery.of(context).size.height * 0.02),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Container(
//                 child: Text(
//                   'Signup For Better Experience',
//                   style: GoogleFonts.workSans(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w500,
//                     fontStyle: FontStyle.normal,
//                     color: Color(0xFF6C757D),
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//             ),
//             SizedBox(height: MediaQuery.of(context).size.height * 0.02),
//             Container(
//               width: MediaQuery.of(context).size.width * 0.85,
//               child: TextField(
//                 controller: namecontroller,
//                 decoration: InputDecoration(
//                   suffixIcon: Icon(
//                     Icons.person,
//                     color: Color(0xFF02C908),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.green),
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(12.0),
//                     ),
//                   ),
//                   labelText: 'Full Name',
//                   labelStyle: TextStyle(
//                     color:
//                         myFocusNode.hasFocus ? Colors.blue : Color(0xFF6C757D),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: MediaQuery.of(context).size.height * 0.04),
//             Container(
//               width: MediaQuery.of(context).size.width * 0.85,
//               child: TextFormField(
//                 controller: usernamecontroller,
//                 decoration: InputDecoration(
//                   suffixIcon: Icon(
//                     Icons.person,
//                     color: Color(0xFF02C908),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.green),
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(12.0),
//                     ),
//                   ),
//                   labelText: 'User Name',
//                   labelStyle: TextStyle(
//                     color:
//                         myFocusNode.hasFocus ? Colors.blue : Color(0xFF6C757D),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: MediaQuery.of(context).size.height * 0.02),
//             Container(
//               width: MediaQuery.of(context).size.width * 0.85,
//               child: TextFormField(
//                 controller: emailcontroller,
//                 decoration: InputDecoration(
//                   suffixIcon: Icon(
//                     Icons.email,
//                     color: Color(0xFF02C908),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.green),
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(12.0),
//                     ),
//                   ),
//                   labelText: 'Email',
//                   labelStyle: TextStyle(
//                     color:
//                         myFocusNode.hasFocus ? Colors.blue : Color(0xFF6C757D),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: MediaQuery.of(context).size.height * 0.04),
//             Container(
//               width: MediaQuery.of(context).size.width * 0.85,
//               child: TextFormField(
//                 obscureText: ishiden,
//                 controller: passwordcontroller,
//                 decoration: InputDecoration(
//                   focusColor: Colors.green,
//                   // prefixIcon: Icon(Icons.lock),
//                   suffix: InkWell(
//                     child: Icon(
//                       Icons.visibility_outlined,
//                       color: Color(0xFF02C908),
//                     ),
//                     onTap: viewPassword,
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.green, width: 2.0),
//                       borderRadius: BorderRadius.all(Radius.circular(12.0))),
//                   labelText: 'Password ',
//                   labelStyle: TextStyle(
//                     color:
//                         myFocusNode.hasFocus ? Colors.blue : Color(0xFF6C757D),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: MediaQuery.of(context).size.height * 0.02),
//             Container(
//               width: MediaQuery.of(context).size.width * 0.85,
//               height: MediaQuery.of(context).size.height * 0.08,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.all(
//                   Radius.circular(16.0),
//                 ),
//               ),
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Color(0xFF02C908),
//                 ),
//                 onPressed: () async {
//                   //dbclass.signUp(emailcontroller.text, passwordcontroller.text);
//                   try {
//                     UserCredential userCredential = await FirebaseAuth.instance
//                         .createUserWithEmailAndPassword(
//                             email: emailcontroller.text,
//                             password: passwordcontroller.text);
//                     Map<String, String> posts = {
//                       'Name': namecontroller.text,
//                       'UserName': usernamecontroller.text,
//                       'Email': emailcontroller.text,
//                       'Password': passwordcontroller.text,
//                     };
//                     dbRef.push().set(posts).whenComplete(() {
//                       print('redirect me elswhere');
//                     });
//                   } on FirebaseAuthException catch (e) {
//                     if (e.code == 'weak-password') {
//                       final scaffold = ScaffoldMessenger.of(context);
//                       scaffold.showSnackBar(
//                         SnackBar(
//                           content:
//                               const Text('The password provided is too weak.'),
//                           action: SnackBarAction(
//                               label: 'OK',
//                               onPressed: scaffold.hideCurrentSnackBar),
//                         ),
//                       );
//                       print('The password provided is too weak.');
//                     } else if (e.code == 'email-already-in-use') {
//                       final scaffold = ScaffoldMessenger.of(context);
//                       scaffold.showSnackBar(
//                         SnackBar(
//                           content: const Text('Email-already-in-use.'),
//                           action: SnackBarAction(
//                               label: 'OK',
//                               onPressed: scaffold.hideCurrentSnackBar),
//                         ),
//                       );
//                       print('The account already exists for that email.');
//                     }
//                   } catch (e) {
//                     print(e);
//                   }
//                 },
//                 child: Text(
//                   'SIGNUP',
//                   style: GoogleFonts.workSans(
//                     fontWeight: FontWeight.w600,
//                     fontSize: 16.0,
//                     color: Color(0xFFFFFFFF),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: MediaQuery.of(context).size.height * 0.02),
//             Container(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     'Already Have An Account?',
//                     style: GoogleFonts.workSans(
//                       fontWeight: FontWeight.w500,
//                       fontSize: 14.0,
//                       color: Color(0xFF6C757D),
//                     ),
//                   ),
//                   SizedBox(
//                     width: MediaQuery.of(context).size.width * 0.02,
//                   ),
//                   InkWell(
//                     onTap: () {
//                       print('Clicked');

//                       Navigator.push(
//                         context,
//                         new MaterialPageRoute(
//                             builder: (context) => new Login()),
//                       );
//                     },
//                     child: Text(
//                       'Sign In',
//                       style: GoogleFonts.workSans(
//                         decoration: TextDecoration.underline,
//                         fontWeight: FontWeight.w600,
//                         fontSize: 14.0,
//                         color: Color(0xFF02C908),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ),
//       )),
//     );
//   }
// }