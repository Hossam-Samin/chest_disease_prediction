import 'package:flutter/material.dart';
import 'package:chest_disease_prediction/business_logic/onBoarding/onBoarding_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Presentation/Screens/Home_Page/home.dart';
import '../../constants/static_statement_for_onBoarding.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(InitBoarding());

  static OnBoardingCubit get(context) => BlocProvider.of(context);

  PageController pageController = PageController();
  int currentPosition = 0;
  next(context) {
    currentPosition++;

    if (currentPosition == onBoardingModelList.length) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ));
    }
    pageController.animateToPage(currentPosition,
        duration: const Duration(milliseconds: 800), curve: Curves.easeInOut);

    emit(SucessNextPage());
  }

  onChangePage(int index) {
    currentPosition = index;
    emit(SucessChangePage());
  }
}
