import 'package:flutter/material.dart';
import '../../../business_logic/auth/register/register_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../constants/constant_methods.dart';
import '../../../constants/end_points.dart';
import '../../widgets/custom_textField.dart';
import '../Login_Page/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

final TextEditingController userNameController = TextEditingController();
final TextEditingController userEmailIdController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final TextEditingController confirmPasswordController = TextEditingController();
final TextEditingController phoneNumberController = TextEditingController();
final GlobalKey<FormState> registerKey = GlobalKey<FormState>();
var genderSelected = "Select gender";
bool isLoading = false;

List<DropdownMenuItem<String>> genderMenu = const [
  DropdownMenuItem(
    value: 'm',
    child: Text('Male'),
  ),
  DropdownMenuItem(
    value: 'f',
    child: Text('Female'),
  ),
];
String gender = 'm';
void changeGender(val) {
  gender = val;
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    RegisterCubit registerCubit = RegisterCubit.get(context);
    return BlocBuilder<RegisterCubit, RegisterState>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
        ),
        body: Form(
          key: registerKey,
          child: ListView(
            children: [
              Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
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
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 50, left: 20, right: 20),
                          child: CustomTextField(
                            onChange: (value) {},
                            controller: userNameController,
                            hintText: "Enter UserName",
                            prefixIcon: const Icon(Icons.person),
                            validation: (value) {
                              if (value!.isEmpty) {
                                return 'Please Enter Your User Name';
                              } else if (value.length > 32) {
                                return 'Name Must be less than 32 characters';
                              }
                            },
                          ),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: CustomTextField(
                            onChange: (value) {},
                            controller: userEmailIdController,
                            hintText: "Enter E-Mail",
                            prefixIcon: const Icon(Icons.email),
                            validation: (value) {
                              if (value!.isEmpty) {
                                return 'Please Enter Your Email';
                              } else if (!RegExp(
                                      "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9+_.-]+.[com]")
                                  .hasMatch(value)) {
                                return 'Please Enter Valid as example@gmail.com';
                              }
                            },
                          ),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: CustomTextField(
                            onChange: (value) {},
                            controller: passwordController,
                            hintText: "Enter Password",
                            prefixIcon: const Icon(Icons.lock),
                            isObscureText: true,
                            validation: (value) {
                              if (value!.isEmpty) {
                                return 'Please Enter Your Password';
                              }
                            },
                          ),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: CustomTextField(
                            onChange: (value) {},
                            controller: confirmPasswordController,
                            hintText: "Enter confirm Password",
                            prefixIcon: const Icon(Icons.lock),
                            isObscureText: true,
                            validation: (value) {
                              if (value!.isEmpty) {
                                return 'Please Enter Your confirm Password';
                              }
                            },
                          ),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: CustomTextField(
                            onChange: (value) {},
                            controller: phoneNumberController,
                            hintText: "Enter Phone Number",
                            prefixIcon: const Icon(Icons.phone),
                            keyboardType: TextInputType.number,
                            validation: (value) {
                              if (value!.isEmpty) {
                                return 'Please Enter Your Phone Number';
                              } else if (value.length > 11) {
                                return "Please Enetr Valid Number";
                              }
                            },
                          ),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Gender',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(
                                height: 50,
                                width: 150,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: Colors.green.shade100),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    onChanged: (value) {
                                      registerCubit.changeGender(value);
                                    },
                                    value: registerCubit.gender,
                                    items: genderMenu,
                                  ),
                                ),
                              ),
                            ],
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
                                  if (registerKey.currentState!.validate()) {
                                    // registerCubit.postRegister(
                                    //   name: userNameController.text,
                                    //   email: userEmailIdController.text,
                                    //   password: passwordController.text,
                                    //   phoneNumber: phoneNumberController.text,
                                    //   gender:
                                    //       registerCubit.gender == 'male' ? 'm' : 'f',
                                    // );
                                    setState(() {
                                      isLoading = true;
                                    });

                                    var result = await FirebaseAuth.instance
                                        .createUserWithEmailAndPassword(
                                      email: userEmailIdController.text,
                                      password: passwordController.text,
                                    );

                                    if (result != null) {
                                      FirebaseFirestore.instance
                                          .collection(userCollection)
                                          .doc(result.user!.uid)
                                          .set({
                                        "name": userNameController.text,
                                        "email": userEmailIdController.text,
                                        "password": passwordController.text,
                                        "confirm password":
                                            confirmPasswordController.text,
                                        "mobile number":
                                            phoneNumberController.text,
                                        "gender": gender == 'male' ? 'm' : 'f',
                                      }).then((value) {
                                        if (true) {
                                          flutterToast(
                                              msg: 'Registered Successfully',
                                              color: Colors.green);
                                        }
                                      });
                                      setState(() {
                                        isLoading = false;
                                      });
                                    } else {
                                      flutterToast(
                                          msg:
                                              'The Network is off or email is already',
                                          color: Colors.green);
                                    }
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.white,
                                    padding: const EdgeInsets.only(
                                        top: 10,
                                        left: 80,
                                        right: 80,
                                        bottom: 10)),
                                child: const Text(
                                  "Sign Up",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                        const Divider(
                          color: Colors.white,
                          thickness: 2,
                          indent: 20,
                          endIndent: 20,
                        ),
                        OutlinedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Login(),
                                ),
                              );
                            },
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.only(
                                  top: 10, bottom: 10, left: 80, right: 80),
                              primary: Colors.white,
                              side: BorderSide(color: Colors.green.shade100),
                            ),
                            child: const Text('Login')),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
