import 'package:flutter/material.dart';
import 'package:chest_disease_prediction/business_logic/onBoarding/onBoarding_cubit.dart';
import 'package:chest_disease_prediction/business_logic/onBoarding/onBoarding_state.dart';

import '../../../constants/static_statement_for_onBoarding.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Home_Page/home.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnBoardingCubit, OnBoardingState>(
      listener: (context, state) {},
      builder: (context, state) {
        OnBoardingCubit onBoardingCubit = BlocProvider.of(context);
        return Scaffold(
          body: SafeArea(
            child: PageView.builder(
              controller: onBoardingCubit.pageController,
              onPageChanged: (value) {
                onBoardingCubit.onChangePage(value);
              },
              itemCount: onBoardingModelList.length,
              itemBuilder: (context, index) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      Text(
                        onBoardingModelList[index].title,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: "JF-Flat"),
                      ),
                      const SizedBox(height: 80),
                      Image.asset(onBoardingModelList[index].image,
                          height: 300),
                      const SizedBox(height: 50),
                      Text(
                        onBoardingModelList[index].body,
                        style: const TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                            fontFamily: "JF-Flat"),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ...List.generate(
                            onBoardingModelList.length,
                            (index) => AnimatedContainer(
                              duration: const Duration(milliseconds: 800),
                              margin: const EdgeInsets.only(right: 5),
                              height: 6,
                              width: onBoardingCubit.currentPosition == index
                                  ? 20
                                  : 6,
                              decoration: BoxDecoration(
                                color: Colors.redAccent,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const HomePage(),
                                  ));
                            },
                            child: const Text(
                              "Skip",
                              style: TextStyle(
                                  fontSize: 16, fontFamily: "JF-Flat"),
                            ),
                          ),
                          const SizedBox(width: 8),
                          MaterialButton(
                            onPressed: () {
                              onBoardingCubit.next(context);
                            },
                            color: Colors.pink.shade300,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16)),
                            child: const Text(
                              "Continue",
                              style: TextStyle(
                                  color: Colors.white, fontFamily: "JF-Flat"),
                            ),
                          ),
                          const SizedBox(width: 20)
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
