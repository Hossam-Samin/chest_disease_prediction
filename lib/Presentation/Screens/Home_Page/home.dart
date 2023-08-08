import 'package:flutter/material.dart';
import 'package:chest_disease_prediction/Presentation/Screens/Login_Page/login.dart';
import 'package:chest_disease_prediction/Presentation/Screens/Signup_Page/signup.dart';
import 'package:chest_disease_prediction/constants/app_assets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 100),
                child: Text(
                  "Welcome",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontFamily: "JF-Flat"),
                ),
              ),
              const Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 10, left: 30, right: 30),
                  child: Text(
                    "We will help you to Prediction your Chest pain in the easiest way !",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                        fontFamily: "JF-Flat"),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              const CircleAvatar(
                maxRadius: 100,
                backgroundImage: AssetImage(AppAssets.chestimageHome),
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Login(),
                      ));
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    side: const BorderSide(
                      color: Colors.black,
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    padding: const EdgeInsets.only(
                        top: 13, left: 80, right: 80, bottom: 13)),
                child: const Text(
                  "Login",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Signup(),
                      ));
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    padding: const EdgeInsets.only(
                        top: 13, left: 80, right: 80, bottom: 13)),
                child: const Text(
                  "Sign up",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
