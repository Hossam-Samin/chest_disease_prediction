import 'package:flutter/material.dart';
import 'package:chest_disease_prediction/Presentation/Screens/Categories/categories.dart';
import 'package:chest_disease_prediction/Presentation/Screens/Signup_Page/signup.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chest_disease_prediction/business_logic/auth/login/login_cubit.dart';
import 'package:chest_disease_prediction/constants/app_assets.dart';
import '../../../constants/constant_methods.dart';
import '../../widgets/custom_textField.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final GlobalKey<FormState> loginKey = GlobalKey<FormState>();
bool isLoading = false;

void checkEmailUser() {
  Categories(emailController.text);
  print("Email: ${emailController.text}");
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(listener: (context, state) {
      if (state is LoginSuccessState) {
        flutterToast(msg: 'Login Successfully', color: Colors.green);
        checkEmailUser();
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => Categories(emailController.text),
            ),
            (route) => false);
      }
    }, builder: (context, state) {
      LoginCubit loginCubit = LoginCubit.get(context);
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
        ),
        body: Form(
          key: loginKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: 500,
                  height: 1000,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                    colors: [
                      Colors.blue,
                      Colors.black,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  )),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 80),
                        child: CircleAvatar(
                          backgroundColor: Colors.grey,
                          maxRadius: 100,
                          backgroundImage: AssetImage(AppAssets.chestLogin),
                        ),
                      ),
                      const SizedBox(height: 50),
                      Padding(
                        padding: const EdgeInsets.only(left: 40, right: 40),
                        child: CustomTextField(
                          onChange: (value) {},
                          controller: emailController,
                          prefixIcon: const Icon(Icons.email),
                          hintText: "Email",
                          validation: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter Your E-Mail";
                            } else if (!RegExp(
                                    "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9+_.-]+.[com]")
                                .hasMatch(value)) {
                              return 'Please Enter Valid as example@gmail.com';
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40, right: 40),
                        child: CustomTextField(
                          onChange: (value) {},
                          controller: passwordController,
                          prefixIcon: const Icon(Icons.lock),
                          hintText: "Password",
                          isObscureText: true,
                          validation: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter Your Password";
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 240),
                        child: Text(
                          "Forget Password?",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 50),
                      isLoading == true
                          ? const Center(
                              child: CircularProgressIndicator(
                                backgroundColor: Colors.amber,
                                color: Colors.greenAccent,
                              ),
                            )
                          : ElevatedButton(
                              onPressed: () async {
                                if (loginKey.currentState!.validate()) {
                                  // loginCubit.postLogin(
                                  //   email: emailController.text,
                                  //   password: passwordController.text,
                                  // );
                                  setState(() {
                                    isLoading = true;
                                  });
                                  try {
                                    var credential = await FirebaseAuth.instance
                                        .signInWithEmailAndPassword(
                                            email: emailController.text,
                                            password: passwordController.text)
                                        .then((value) => {
                                              if (true)
                                                {
                                                  flutterToast(
                                                      msg: 'Login Successfully',
                                                      color: Colors.green)
                                                }
                                            });

                                    // ignore: use_build_context_synchronously
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) =>
                                          Categories(emailController.text),
                                    ));
                                  } on FirebaseAuthException catch (e) {
                                    if (e.code == 'user-not-found') {
                                      flutterToast(
                                          msg: 'User not found',
                                          color: Colors.red);
                                    } else if (e.code == 'wrong-password') {
                                      flutterToast(
                                          msg: 'Wrong Password',
                                          color: Colors.red);
                                    }
                                  } catch (ex) {
                                    flutterToast(
                                        msg: 'There is an error',
                                        color: Colors.red);
                                  }
                                  setState(() {
                                    isLoading = false;
                                  });
                                }
                              },
                              // ignore: sort_child_properties_last
                              child: const Text(
                                "Sign In",
                                style: TextStyle(color: Colors.black),
                              ),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  side: const BorderSide(
                                    color: Colors.black,
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16)),
                                  padding: const EdgeInsets.only(
                                      top: 13,
                                      left: 100,
                                      right: 100,
                                      bottom: 13)),
                            ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            "Don’t have an acount ? ",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                            ),
                          ),
                          GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Signup(),
                                    ));
                              },
                              child: const Text("Sign up",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ))),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
