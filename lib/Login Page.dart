import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_ui_testing/Register%20Page.dart';
import 'Home Page.dart';
import 'constantpage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  late String _email, _pass;

  void Login() async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: _email, password: _pass)
        .catchError((onError) {
      const snackBar = SnackBar(
        content: Text(
          "Email or Password is wrong!",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }).then((Uuser) {
      if (Uuser.user != null) {
        Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage()));
      } else {
        setState(() {
          print("Invalid Login.................");
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double dvheight = MediaQuery.of(context).size.height;
    double dvwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Image.asset(
                      image1,
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
                      height: dvheight * 0.45,
                      width: dvwidth,
                    ),
                    Positioned(
                      bottom: 30,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Column(
                          children: [
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
                      "  Login",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
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
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (email) {
                      setState(() {
                        _email = email.toString();
                      });
                    },
                    validator: (email) {
                      if (email!.isEmpty) {
                        return 'please enter email address';
                      } else if (!RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(email)) {
                        return "please enter valid email";
                      }
                      ;
                    },
                    decoration: const InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: primarycolor),
                      ),
                      prefixIcon: Icon(
                        Icons.email,
                        color: primarycolor,
                      ),
                      labelText: "Enter Your email",
                      labelStyle: TextStyle(color: primarycolor),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    obscureText: true,
                    onSaved: (pass) {
                      setState(() {
                        _pass = pass.toString();
                      });
                    },
                    validator: (password) {
                      if (password!.isEmpty) {
                        return "please enter password";
                      } else if (password.length < 8) {
                        return "password is low, enter above 8 character ";
                      }
                    },
                    decoration: const InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: primarycolor),
                      ),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: primarycolor,
                      ),
                      labelText: "Enter Your Password",
                      labelStyle: TextStyle(color: primarycolor),
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    child: Text("Forget password?"),
                  ),
                ),
                Center(
                  child: SizedBox(
                    height: dvheight * 0.08,
                    width: dvwidth - 20,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      color: primarycolor,
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          _formkey.currentState!.save();
                          setState(() {
                            Login();
                          });
                        }
                      },
                      child: const Text(
                        "Login your account",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text("Don't have account?"),
                    FlatButton(
                      onPressed: () {
                        setState(() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => RegisterPage()));
                        });
                      },
                      child: const Text(
                        "Create account",
                        style: TextStyle(
                            color: primarycolor,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
