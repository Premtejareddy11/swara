// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:swara_ui/home_page.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isFormFilled = false;
  bool rememberMe = false;
  @override
  void initState() {
    super.initState();
    emailController.addListener(_updateSubmitButtonState);
    passwordController.addListener(_updateSubmitButtonState);
  }

  @override
  void dispose() {
    emailController.removeListener(_updateSubmitButtonState);
    emailController.dispose();
    passwordController.removeListener(_updateSubmitButtonState);
    passwordController.dispose();
    super.dispose();
  }

  void _updateSubmitButtonState() {
    final isFilled =
        emailController.text.isNotEmpty && passwordController.text.isNotEmpty;
    if (isFormFilled != isFilled) {
      setState(() {
        isFormFilled = isFilled;
      });
    }
  }

  String convertToSha256(String password) {
    return sha256.convert(utf8.encode(password)).toString();
  }

  Future<void> login(String email, String password) async {
    const String apiUrl = "https://apiv2stg.promilo.com/user/oauth/token";
    String sha256Password = convertToSha256(password);
    String body =
        "username=$email&password=$sha256Password&grant_type=password";

    try {
      http.Response response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Authorization': 'Basic UHJvbWlsbzpxNCE1NkBaeSN4MiRHQg=='
        },
        body: body,
      );
      if (response.statusCode == 200) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const MeetUpHomePage()),
          (Route<dynamic> route) => false,
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Invalid ID Password message"),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Something went wrong...!"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Promilo"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Hi, Welcome Back!",
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Please sign in to continue",
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailController,
                      validator: (value) => EmailValidator.validate(value!)
                          ? null
                          : "Enter valid email id",
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        label: const Text("Enter Email or Phone Number"),
                        hintText: "Enter Email or Phone Number",
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Sign In With OTP",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "Password",
                        style: Theme.of(context).textTheme.titleMedium,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    TextFormField(
                      controller: passwordController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter password';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        label: const Text("Enter Password"),
                        hintText: "Enter Password",
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  value: rememberMe,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      rememberMe = value!;
                                    });
                                  },
                                ),
                                Text(
                                  "Remember Me",
                                  style:
                                      Theme.of(context).textTheme.displayMedium,
                                )
                              ],
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Forgot Password",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    OutlinedButton(
                      onPressed: isFormFilled
                          ? () {
                              if (_formKey.currentState!.validate()) {
                                login(emailController.text,
                                    passwordController.text);
                              }
                            }
                          : null,
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color?>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.disabled)) {
                              return Colors.grey;
                            }
                            return Theme.of(context).primaryColor;
                          },
                        ),
                        minimumSize: MaterialStateProperty.all<Size>(
                            const Size(double.infinity, 50)),
                      ),
                      child: const Text(
                        'Submit',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Divider(
                      height: 1,
                      thickness: 1,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Or"),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 1,
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: IconButton(
                      iconSize: 50,
                      onPressed: () {},
                      icon: SvgPicture.asset("assets/svg/google.svg",
                          fit: BoxFit.fill),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: IconButton(
                      iconSize: 50,
                      onPressed: () {},
                      icon: SvgPicture.asset("assets/svg/linkedin.svg",
                          fit: BoxFit.fill),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: IconButton(
                      onPressed: () {},
                      iconSize: 50,
                      icon: SvgPicture.asset("assets/svg/facebook.svg",
                          fit: BoxFit.fill),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: IconButton(
                      iconSize: 50,
                      onPressed: () {},
                      icon: SvgPicture.asset("assets/svg/instagram.svg",
                          fit: BoxFit.fill),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: IconButton(
                      iconSize: 50,
                      onPressed: () {},
                      icon: SvgPicture.asset("assets/svg/whatsapp.svg",
                          fit: BoxFit.fill),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Business User?"),
                      TextButton(
                        onPressed: () {},
                        child: const Text("Login Here"),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text("Don't have an account?"),
                      TextButton(
                        onPressed: () {},
                        child: const Text("Sign Up"),
                      )
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 0.1,
                  ),
                  const Text("By continuing, you agree to"),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Promilo's"),
                      TextButton(
                          onPressed: () {},
                          child: const Text("Terms of Use & Privacy Policy"))
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
