import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'size.dart';
//import 'user.dart';
import 'login.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
//import 'package:http/http.dart' as http;

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String initialCountry = 'IN';
  PhoneNumber number = PhoneNumber(isoCode: 'IN');

  bool ieeeMember = false;
  bool pictian = false;

  bool _obscureText = true;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pictIDController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _collegeController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _password1Controller = TextEditingController();
  final TextEditingController _ieeeController = TextEditingController();

  final storage = const FlutterSecureStorage();

  late String name;
  late String email;
  late String collegeName;
  String password = "";
  String password1 = "";
  late String phoneNumber;
  late String userName;
  late String pictID;
  late String ieeeID;
  String countryCode = "+91";

  final bool _load = false;

  bool isSenior = false;

  // void check() async {
  //   if (_nameController.text.trim().isEmpty) {
  //     Fluttertoast.showToast(msg: 'Please enter name');
  //     return;
  //   } else if (_usernameController.text.trim().isEmpty) {
  //     Fluttertoast.showToast(msg: 'Please enter username');
  //     return;
  //   } else if (_emailController.text.trim().isEmpty) {
  //     Fluttertoast.showToast(msg: 'Please enter email');
  //     return;
  //   } else if (_collegeController.text.trim().isEmpty) {
  //     Fluttertoast.showToast(msg: 'Please enter college name');
  //     return;
  //   } else if (_passwordController.text.trim().isEmpty) {
  //     Fluttertoast.showToast(msg: 'Please enter password');
  //     return;
  //   } else if (_password1Controller.text.trim().isEmpty) {
  //     Fluttertoast.showToast(msg: 'Please enter confirm password');
  //     return;
  //   }
  //   if (_passwordController.text.trim() != _password1Controller.text.trim()) {
  //     Fluttertoast.showToast(msg: 'Passwords do not match');
  //     return;
  //   }
  //   if (ieeeMember == true && _ieeeController.text.trim().isEmpty) {
  //     Fluttertoast.showToast(msg: 'Please enter IEEE registration ID');
  //     return;
  //   }
  //   registerUser(userName, name, email, password, phoneNumber, ieeeID);
  // }

  // final baseUrl =
  //     'https://schema.getpostman.com/json/collection/v2.1.0/collection.json';

  // Future registerUser(String username, String firstName, String email,
  //     String password, String phone, String studentId) async {
  //   final response = await http.post(
  //     Uri.parse(
  //         'https://schema.getpostman.com/json/collection/v2.1.0/collection.json/api/register/'),
  //     body: {
  //       'username': username,
  //       'first_name': firstName,
  //       'email': email,
  //       'password': password,
  //       'phone': phone,
  //       'student_id': studentId,
  //     },
  //   );

  //   if (response.statusCode == 200) {
  //     // Registration successful
  //     await signup(username, password);
  //   } else {
  //     // Registration failed
  //     throw Exception('Failed to register user');
  //   }
  // }

  // //await getData();

  // @override
  // void dispose() {
  //   _nameController.dispose();
  //   _usernameController.dispose();
  //   _emailController.dispose();
  //   _phoneController.dispose();
  //   _collegeController.dispose();
  //   _passwordController.dispose();
  //   _password1Controller.dispose();
  //   _ieeeController.dispose();
  //   _pictIDController.dispose();
  //   super.dispose();
  // }

  void toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return _load == false
        ? Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/space1.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: SingleChildScrollView(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: SizeConfig.getProportionateScreenHeight(80),
                      //  height: 20,
                    ),
                    Text(
                      "Sign Up",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: SizeConfig.getProportionateScreenHeight(35),
                          letterSpacing: 2,
                          //  fontSize: 20,
                          fontFamily: 'Mars',
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: SizeConfig.getProportionateScreenHeight(20),
                      // height: 20,
                    ),
                    GlassmorphicContainer(
                      blur: 1.5,
                      border: 2,
                      borderGradient: LinearGradient(colors: [
                        Colors.white.withOpacity(0.1),
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
                        controller: _nameController,
                        keyboardType: TextInputType.text,
                        cursorColor: const Color.fromARGB(255, 255, 255, 255),
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.person,
                              color: Color.fromARGB(255, 255, 255, 255),
                              size: 20),
                          hintText: "Name",
                          hintStyle: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'Oxanium',
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide.none),
                        ),
                        onChanged: (val) {
                          setState(() {
                            name = val;
                          });
                        },
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
                        cursorColor: const Color.fromARGB(255, 255, 255, 255),
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.person,
                              color: Color.fromARGB(255, 255, 255, 255),
                              size: 20),
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
                        onChanged: (val) {
                          setState(() {
                            userName = val;
                          });
                        },
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
                      ]),
                      borderRadius: 30,
                      height: SizeConfig.getProportionateScreenHeight(55),
                      linearGradient: LinearGradient(colors: [
                        Colors.white.withOpacity(0.2),
                        Colors.white.withOpacity(0.2)
                      ]),
                      width: SizeConfig.getProportionateScreenWidth(900),
                      child: TextFormField(
                        style: const TextStyle(color: Colors.white),
                        controller: _emailController,
                        keyboardType: TextInputType.text,
                        cursorColor: const Color.fromARGB(255, 255, 255, 255),
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.email,
                              color: Color.fromARGB(255, 255, 255, 255),
                              size: 20),
                          hintText: "Email",
                          hintStyle: const TextStyle(
                              fontFamily: 'Oxanium',
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide.none),
                        ),
                        onChanged: (val) {
                          setState(() {
                            email = val;
                          });
                        },
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
                      ]),
                      borderRadius: 30,
                      height: SizeConfig.getProportionateScreenHeight(55),
                      linearGradient: LinearGradient(colors: [
                        Colors.white.withOpacity(0.2),
                        Colors.white.withOpacity(0.2)
                      ]),
                      width: SizeConfig.getProportionateScreenWidth(900),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 3, 8, 0),
                        child: InternationalPhoneNumberInput(
                          textStyle: const TextStyle(color: Colors.white),
                          spaceBetweenSelectorAndTextField:0,
                          selectorConfig: const SelectorConfig(
                            selectorType: PhoneInputSelectorType.DIALOG,
                          ),
                          cursorColor: const Color.fromARGB(255, 255, 255, 255),
                          ignoreBlank: false,
                          autoValidateMode: AutovalidateMode.disabled,
                          selectorTextStyle: const TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255)),
                          initialValue: number,
                          textFieldController: _phoneController,
                          formatInput: false,
                          keyboardType: const TextInputType.numberWithOptions(
                              signed: true),
                          inputDecoration: InputDecoration(
                            hintText: "Phone Number",
                            hintStyle: const TextStyle(
                                fontFamily: 'Oxanium',
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: BorderSide.none),
                          ),
                          onInputChanged: (PhoneNumber value) {
                            countryCode = value.dialCode.toString();
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.getProportionateScreenHeight(20),
                      // height: 20,
                    ),
                    GlassmorphicContainer(
                      blur: 1.5,
                      border: 2,
                      borderGradient: LinearGradient(colors: [
                        Colors.white.withOpacity(0.1),
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
                        cursorColor: const Color.fromARGB(255, 255, 255, 255),
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                              icon: _obscureText
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility),
                              color: const Color.fromARGB(255, 255, 255, 255),
                              onPressed: toggle),
                          prefixIcon: const Icon(Icons.lock,
                              color: Color.fromARGB(255, 255, 255, 255),
                              size: 20),
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
                        onChanged: (val) {
                          setState(() {
                            password = val;
                          });
                        },
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
                        controller: _password1Controller,
                        keyboardType: TextInputType.text,
                        cursorColor: const Color.fromARGB(255, 255, 255, 255),
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                              icon: _obscureText
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility),
                              color: const Color.fromARGB(255, 255, 255, 255),
                              onPressed: toggle),
                          prefixIcon: const Icon(Icons.lock,
                              color: Color.fromARGB(255, 255, 255, 255),
                              size: 20),
                          hintText: "Confirm Password",
                          hintStyle: const TextStyle(
                              fontFamily: 'Oxanium',
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide.none),
                        ),
                        onChanged: (val) {
                          setState(() {
                            password1 = val;
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SwitchListTile(
                      value: pictian,
                      onChanged: (bool val) {
                        setState(() {
                          pictian = val;
                          if (val) {
                            _collegeController.text =
                                "Pune Institute Of Computer Technology";
                          } else {
                            _collegeController.text = "";
                          }
                        });
                      },
                      inactiveTrackColor: Colors.grey,
                      activeColor: const Color.fromARGB(255, 255, 255, 255),
                      title: const Text(
                        'PICTian',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Oxanium',
                            letterSpacing: 1.5,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.getProportionateScreenHeight(10),
                      // height: 20,
                    ),
                    GlassmorphicContainer(
                      blur: 2,
                      border: 2,
                      borderGradient: LinearGradient(colors: [
                        Colors.white.withOpacity(0.1),
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
                        readOnly: pictian,
                        controller: _collegeController,
                        keyboardType: TextInputType.text,
                        cursorColor: const Color.fromARGB(255, 255, 255, 255),
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.school,
                              color: Color.fromARGB(255, 255, 255, 255),
                              size: 20),
                          hintText: "College Name",
                          hintStyle: const TextStyle(
                              fontFamily: 'Oxanium',
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide.none),
                        ),
                        onChanged: (val) {
                          setState(() {
                            collegeName = val;
                          });
                        },
                      ),
                    ),
                    pictian
                        ? SizedBox(
                            height: SizeConfig.getProportionateScreenHeight(20),
                            // height: 20,
                          )
                        : Container(),
                    pictian
                        ? GlassmorphicContainer(
                            blur: 2,
                            border: 2,
                            borderGradient: LinearGradient(colors: [
                              Colors.white.withOpacity(0.1),
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
                              controller: _pictIDController,
                              keyboardType: TextInputType.text,
                              cursorColor:
                                  const Color.fromARGB(255, 255, 255, 255),
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.app_registration,
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    size: 20),
                                hintText: "PICT Registration ID",
                                hintStyle: const TextStyle(
                                    fontFamily: 'Oxanium',
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    borderSide: BorderSide.none),
                              ),
                              onChanged: (val) {
                                setState(() {
                                  pictID = val;
                                });
                              },
                            ),
                          )
                        : Container(),
                    const SizedBox(
                      height: 10,
                    ),
                    SwitchListTile(
                      value: ieeeMember,
                      onChanged: (bool val) {
                        setState(() {
                          ieeeMember = val;
                        });
                      },
                      inactiveTrackColor: Colors.grey,
                      activeColor: const Color.fromARGB(255, 255, 255, 255),
                      title: const Text(
                        'IEEE Member',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 1.5,
                          fontFamily: 'Oxanium',
                        ),
                      ),
                    ),
                    ieeeMember
                        ? SizedBox(
                            height: SizeConfig.getProportionateScreenHeight(20),
                            // height: 20,
                          )
                        : Container(),
                    ieeeMember
                        ? GlassmorphicContainer(
                            blur: 2,
                            border: 2,
                            borderGradient: LinearGradient(colors: [
                              Colors.white.withOpacity(0.1),
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
                              controller: _ieeeController,
                              keyboardType: TextInputType.text,
                              cursorColor:
                                  const Color.fromARGB(255, 255, 255, 255),
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.app_registration,
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    size: 20),
                                hintText: "IEEE Registration ID",
                                hintStyle: const TextStyle(
                                    fontFamily: 'Oxanium',
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    borderSide: BorderSide.none),
                              ),
                              onChanged: (val) {
                                setState(() {
                                  ieeeID = val;
                                });
                              },
                            ),
                          )
                        : Container(),
                    SizedBox(
                      height: SizeConfig.getProportionateScreenHeight(20),
                      // height: 20,
                    ),
                    const GlowingButton(
                        color1: Color.fromARGB(255, 93, 1, 109),
                        color2: Color.fromARGB(255, 245, 131, 235)),
                    SizedBox(
                      height: SizeConfig.getProportionateScreenHeight(10),
                      //  height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an account?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontFamily: 'Oxanium',
                              fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.to(const Login(),
                                transition: Transition.cupertinoDialog,
                                duration: const Duration(milliseconds: 3000));
                          },
                          child: const Text(
                            "Login",
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
                    SizedBox(
                      height: SizeConfig.getProportionateScreenHeight(20),
                      // height: 20,
                    ),
                  ],
                ),
              )),
            ),
          )
        : const Center(
            //child: Loader(),
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
            "SignUp",
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Oxanium',
                fontWeight: FontWeight.bold),
          )),
        ));
  }
}
