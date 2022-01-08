import 'package:flutter/material.dart';

import 'constantpage.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    double dvheight = MediaQuery.of(context).size.height;
    double dvwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset(
                  image2,
                  height: dvheight * 0.40,
                  width: dvwidth,
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                    stops: [0.1, 0.75],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.white,
                    ],
                  )),
                  height: dvheight * 0.42,
                  width: dvwidth,
                ),
                Positioned(
                  bottom: 30,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Column(
                      children: [
                        // Text(
                        //   AppSlogan,
                        //   style: TextStyle(color: Colors.grey),
                        // ),
                        RichText(
                          textAlign: TextAlign.center,
                          text: const TextSpan(
                              text: AppName + "\n",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30),
                              children: [
                                TextSpan(
                                    text: AppSlogan,
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal)),
                              ]),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                child: const Text(
                  "  Create Account",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                decoration: BoxDecoration(
                  border: const Border(
                      left: BorderSide(color: primarycolor, width: 5)),
                  gradient: LinearGradient(
                    colors: [
                      primarycolor.withOpacity(0.5),
                      Colors.white,
                    ],
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: primarycolor),
                  ),
                  prefixIcon: Icon(
                    Icons.account_circle,
                    color: primarycolor,
                  ),
                  labelText: "Name",
                  labelStyle: TextStyle(color: primarycolor),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: primarycolor),
                  ),
                  prefixIcon: Icon(
                    Icons.email,
                    color: primarycolor,
                  ),
                  labelText: "Email",
                  labelStyle: TextStyle(color: primarycolor),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: primarycolor),
                  ),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: primarycolor,
                  ),
                  labelText: "Password",
                  labelStyle: TextStyle(color: primarycolor),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Center(
                child: SizedBox(
                  height: dvheight * 0.08,
                  width: dvwidth - 20,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: primarycolor,
                    onPressed: () {},
                    child: const Text(
                      "Submit",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: SizedBox(
                height: dvheight * 0.1,
                width: dvwidth,
                child: FlatButton(
                    onPressed: () {
                      setState(() {
                        Navigator.pop(context);
                      });
                    },
                    child: const Text(
                      "Go Back",
                      style: TextStyle(color: primarycolor),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
