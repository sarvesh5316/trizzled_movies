// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static String verify = "";
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController countryCode = TextEditingController();
  var phone = " ";

  @override
  void initState() {
    countryCode.text = "+91";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: EdgeInsets.only(left: 25, right: 25),
      alignment: Alignment.center,
      child: SingleChildScrollView(
        // controller:Null,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            SizedBox(
                height: 100,
                child: Image.asset(
                  'assets/images/logo.jpg',
                  height: 150,
                  width: 150,
                )),
            SizedBox(
              height: 50,
            ),
            Text(
              'Phone Verification',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'We need to get Registered before getting Started!',
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 55,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      left: 9,
                    ),
                    width: 40,
                    child: TextField(
                      controller: countryCode,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(border: InputBorder.none),
                    ),
                  ),
                  Text(
                    '| ',
                    style: TextStyle(fontSize: 33, color: Colors.grey),
                  ),
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.phone,
                      onChanged: (value) {
                        phone = value;
                      },
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: 'Phone'),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 21,
            ),
            SizedBox(
              height: 45,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  await FirebaseAuth.instance.verifyPhoneNumber(
                    phoneNumber: '${countryCode.text + phone}',
                    verificationCompleted: (PhoneAuthCredential credential) {},
                    verificationFailed: (FirebaseAuthException e) {},
                    codeSent: (String verificationId, int? resendToken) {
                      LoginScreen.verify = verificationId;
                      Navigator.pushNamed(context, 'otp_screen');
                    },
                    codeAutoRetrievalTimeout: (String verificationId) {},
                  );
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.cyan,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                child: Text('Send the Code'),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
