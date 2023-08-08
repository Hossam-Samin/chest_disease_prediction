import 'package:flutter/material.dart';
import 'package:chest_disease_prediction/business_logic/auth/login/login_cubit.dart';
import 'package:chest_disease_prediction/business_logic/auth/register/register_cubit.dart';
import 'package:chest_disease_prediction/business_logic/detection_model/detection_cubit.dart';
import 'package:chest_disease_prediction/business_logic/onBoarding/onBoarding_cubit.dart';
import 'Presentation/Screens/Onboarding/onborading_screen.dart';
import 'business_logic/detection_model/detiction_observer.dart';
import 'data/data_provider/local/cache_helper.dart';
import 'data/data_provider/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await CacheHelper.init();
  await DioHelper.init();

  BlocOverrides.runZoned(() {
    runApp(const MyApp());
  }, blocObserver: MyBlocObserver());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => OnBoardingCubit(),
        ),
        BlocProvider(
          create: (context) => AppCubit(),
        ),
        BlocProvider(
          create: (context) => RegisterCubit(),
        ),
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: OnBoardingScreen(),
      ),
    );
  }
}
