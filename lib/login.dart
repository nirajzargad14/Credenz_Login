//import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';
//import 'package:http/http.dart' as http;
import 'main.dart';
import 'signup.dart';
import 'size.dart';
import 'package:glitcheffect/glitcheffect.dart';
import 'package:flutter_glow/flutter_glow.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  String error = "";

  bool _obscureText = true;
  final storage = const FlutterSecureStorage();
  late String username;
  late String password;

  //bool _load = false;

  // Future<http.Response> Login_request(String username, String password) async {
  //   final response = await http.post(
  //     Uri.parse(
  //         'http://schema.getpostman.com/json/collection/v2.1.0/collection.json/api/login'),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode(<String, String>{
  //       'username': username,
  //       'password': password,
  //     }),
  //   );
  //   if (response.statusCode == 200) {
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (context) => const MyHomePage()),
  //     );
  //     print("object");
  //     final json = jsonDecode(response.body);
  //     return json['exists'];
  //   } else {
  //     print("nv");
  //     throw Exception('Failed to check if user exists');
  //   }
  // }

  // void check() async {
  //   if (_usernameController.text.isEmpty) {
  //     setState(() {
  //       error = "Please enter your username";
  //     });
  //     Fluttertoast.showToast(msg: error);
  //     return;
  //   }
  //   if (_passwordController.text.isEmpty) {
  //     setState(() {
  //       error = "Please enter your password";
  //     });
  //     Fluttertoast.showToast(msg: error);
  //     return;
  //   }
  //   //Login_request(username, password);
  // }

  void toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  Future<bool> _onBackPressed() {
    Get.to(() => const MyHomePage());
    return Future.value(false);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/space1.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView(
              children: [
                SizedBox(
                  height: SizeConfig.getProportionateScreenHeight(100),
                ),
                Text(
                  "Welcome",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: SizeConfig.getProportionateScreenWidth(35),
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.8,
                    fontFamily: 'Mars',
                  ),
                ),
                SizedBox(
                  height: SizeConfig.getProportionateScreenHeight(50),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: SizeConfig.getProportionateScreenHeight(20),
                      // height: 20,
                    ),
                    GlassmorphicContainer(
                      blur: 2,
                      border: 2,
                      borderGradient: LinearGradient(colors: [
                        Colors.white.withOpacity(0.1),
                        //Colors.white.withOpacity(0.1)
                      ]),
                      borderRadius: 30,
                      height: SizeConfig.getProportionateScreenHeight(55),
                      linearGradient: LinearGradient(colors: [
                        Colors.white.withOpacity(0.2),
                        Colors.white.withOpacity(0.2)
                      ]),
                      width: SizeConfig.getProportionateScreenWidth(900),
                      child: TextFormField(
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'Oxanium',
                          fontWeight: FontWeight.bold,
                        ),
                        controller: _usernameController,
                        keyboardType: TextInputType.text,
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                          suffixIcon: const Icon(
                            Icons.alternate_email,
                            color: Colors.white,
                          ),
                          prefixIcon: const Icon(Icons.person,
                              color: Colors.white, size: 20),
                          hintText: "Username",
                          hintStyle: const TextStyle(
                              fontFamily: 'Oxanium',
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide.none),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.getProportionateScreenHeight(20),
                      // height: 20,
                    ),
                    GlassmorphicContainer(
                      blur: 2,
                      border: 2,
                      borderGradient: LinearGradient(colors: [
                        Colors.white.withOpacity(0.1),
                        //Colors.white.withOpacity(0.1)
                      ]),
                      borderRadius: 30,
                      height: SizeConfig.getProportionateScreenHeight(55),
                      linearGradient: LinearGradient(colors: [
                        Colors.white.withOpacity(0.2),
                        Colors.white.withOpacity(0.2)
                      ]),
                      width: SizeConfig.getProportionateScreenWidth(900),
                      child: TextFormField(
                        style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'Oxanium',
                            fontWeight: FontWeight.bold),
                        obscureText: _obscureText,
                        controller: _passwordController,
                        keyboardType: TextInputType.text,
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                              icon: _obscureText
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility),
                              color: Colors.white,
                              onPressed: toggle),
                          prefixIcon: const Icon(Icons.lock,
                              color: Colors.white, size: 20),
                          hintText: "Password",
                          hintStyle: const TextStyle(
                              fontFamily: 'Oxanium',
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide.none),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.getProportionateScreenHeight(20),
                      // height: 20,
                    ),
                  ],
                ),
                GestureDetector(
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 15,
                        letterSpacing: 1,
                        fontFamily: 'Oxanium',
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.right,
                  ),
                  onTap: () {
                    //Get.to(() => Forgot_password());
                  },
                ),
                SizedBox(
                  height: SizeConfig.getProportionateScreenHeight(40),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 60),
                  child: GlowingButton(
                    color1: Color.fromARGB(255, 93, 1, 109),
                    color2: Color.fromARGB(255, 245, 131, 235),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.getProportionateScreenHeight(10),
                  //  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontFamily: 'Oxanium',
                          fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.to(const SignUp(),
                            transition: Transition.cupertinoDialog,
                            duration: const Duration(milliseconds: 3000));
                      },
                      child: const Text(
                        "SignUp",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontFamily: 'Oxanium',
                          fontWeight: FontWeight.bold,
                        ),
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

class GlowingButton extends StatefulWidget {
  final Color color1;
  final Color color2;
  const GlowingButton(
      {Key? key, this.color1 = Colors.cyan, this.color2 = Colors.greenAccent})
      : super(key: key);
  @override
  State<GlowingButton> createState() => _GlowingButtonState();
}

class _GlowingButtonState extends State<GlowingButton> {
  final _LoginState obj = _LoginState();
  var glowing = true;
  var scale = 1.0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return const ComingSoonDialog();
            },
          );
        },
        child: AnimatedContainer(
          transform: Matrix4.identity()..scale(scale),
          duration: const Duration(milliseconds: 200),
          height: 48,
          width: 160,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              gradient: LinearGradient(
                colors: [
                  widget.color1,
                  widget.color2,
                ],
              ),
              boxShadow: glowing
                  ? [
                      BoxShadow(
                        color: widget.color1.withOpacity(0.6),
                        spreadRadius: 1,
                        blurRadius: 16,
                        offset: const Offset(-8, 0),
                      ),
                      BoxShadow(
                        color: widget.color2.withOpacity(0.6),
                        spreadRadius: 1,
                        blurRadius: 16,
                        offset: const Offset(8, 0),
                      ),
                      BoxShadow(
                        color: widget.color1.withOpacity(0.2),
                        spreadRadius: 16,
                        blurRadius: 32,
                        offset: const Offset(-8, 0),
                      ),
                      BoxShadow(
                        color: widget.color2.withOpacity(0.2),
                        spreadRadius: 16,
                        blurRadius: 32,
                        offset: const Offset(8, 0),
                      )
                    ]
                  : []),
          child: const Center(
              child: Text(
            "Login",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'Oxanium',
            ),
          )),
        ));
  }
}

class ComingSoonDialog extends StatelessWidget {
  const ComingSoonDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const GlitchEffect(
        duration: Duration(milliseconds: 415),
        child: GlowingOverscrollIndicator(
          axisDirection: AxisDirection.down,
          color: Colors.black,
          child: GlowText(
            'Registration will begin shortly!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: 'Oxanium',
              fontWeight: FontWeight.bold,
            ),
            glowColor: Colors.black,
            overflow: TextOverflow.visible,
            textAlign: TextAlign.center,
          ),
        ),
      ),
      content: SizedBox(height: SizeConfig.getProportionateScreenHeight(10)),
      backgroundColor: Colors.white.withOpacity(0.7),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      actions: const <Widget>[
        Center(
            child: GlowingButton1(
          color1: Color.fromARGB(255, 93, 1, 109),
          color2: Color.fromARGB(255, 245, 131, 235),
        ))
      ],
    );
  }
}

class GlowingButton1 extends StatefulWidget {
  final Color color1;
  final Color color2;
  const GlowingButton1(
      {Key? key, this.color1 = Colors.cyan, this.color2 = Colors.greenAccent})
      : super(key: key);
  @override
  State<GlowingButton1> createState() => _GlowingButtonState1();
}

class _GlowingButtonState1 extends State<GlowingButton1> {
  final _LoginState obj = _LoginState();
  var glowing = true;
  var scale = 1.0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => Navigator.pop(context),
        child: AnimatedContainer(
          transform: Matrix4.identity()..scale(scale),
          duration: const Duration(milliseconds: 200),
          height: SizeConfig.getProportionateScreenHeight(40),
          width: SizeConfig.getProportionateScreenWidth(100),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              gradient: LinearGradient(
                colors: [
                  widget.color1,
                  widget.color2,
                ],
              ),
              boxShadow: glowing
                  ? [
                      BoxShadow(
                        color: widget.color1.withOpacity(0.6),
                        spreadRadius: 1,
                        blurRadius: 16,
                        offset: const Offset(-8, 0),
                      ),
                      BoxShadow(
                        color: widget.color2.withOpacity(0.6),
                        spreadRadius: 1,
                        blurRadius: 16,
                        offset: const Offset(8, 0),
                      ),
                      BoxShadow(
                        color: widget.color1.withOpacity(0.2),
                        spreadRadius: 16,
                        blurRadius: 32,
                        offset: const Offset(-8, 0),
                      ),
                      BoxShadow(
                        color: widget.color2.withOpacity(0.2),
                        spreadRadius: 16,
                        blurRadius: 32,
                        offset: const Offset(8, 0),
                      )
                    ]
                  : []),
          child: const Center(
              child: Text(
            "OK",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'Oxanium',
            ),
          )),
        ));
  }
}
