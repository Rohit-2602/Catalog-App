import 'package:catalog_app/utils/routes.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String name = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(const Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/images/login_image.png"),
            const SizedBox(height: 20.0),
            Text(
              "Welcome $name",
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20.0),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      onChanged: (value) {
                        setState(() {
                          name = value;
                        });
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "UserName cannot be Empty";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          hintText: "Enter Username",
                          labelText: "Username",
                          hintStyle: TextStyle(color: Colors.black)),
                    ),
                    TextFormField(
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password cannot be Empty";
                        } else if (value.length < 5) {
                          return "Password Length should be atleast 5";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          hintText: "Enter Password",
                          labelText: "Password",
                          hintStyle: TextStyle(color: Colors.black)),
                    ),
                    const SizedBox(height: 40.0),
                    Material(
                      color: Colors.blue,
                      borderRadius:
                          BorderRadius.circular(changeButton ? 40 : 8),
                      child: InkWell(
                        onTap: () => moveToHome(context),
                        child: AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          width: changeButton ? 40 : 100,
                          height: 40,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(changeButton ? 40 : 8),
                            // color: Colors.pink,
                          ),
                          child: changeButton
                              ? const Icon(
                                  Icons.done,
                                  color: Colors.white,
                                )
                              : const Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
