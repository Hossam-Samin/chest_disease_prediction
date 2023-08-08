import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chest_disease_prediction/Presentation/Screens/Login_Page/login.dart';
import '../../../Presentation/Screens/Categories/categories.dart';
import '../../../constants/constant_methods.dart';
import '../../../constants/end_points.dart';
import '../../../data/data_provider/remote/dio_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  String gender = 'm';
  void changeGender(value) {
    gender = value;
    emit(ChangeGenderState());
  }

  Future postRegister(
      {required String name,
      required String email,
      required String password,
      required String phoneNumber,
      required String gender,
      context}) async {
    emit(RegisterLoadingState());
    await DioHelper.postData(url: registerEndPoint, data: {
      "name": name,
      "email": email,
      "password": password,
      "phoneNumber": phoneNumber,
      "gender": gender,
    }).then((value) {
      if (value.statusCode == 200) {
        flutterToast(msg: 'Registered Successfully', color: Colors.green);
        print("Register is Sucessful");
      }
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(RegisterErrorState());
    });
  }

  // Future register({
  //   required String name,
  //   required String email,
  //   required String password,
  //   required String confirmPassword,
  //   required String phoneNumber,
  //   required String gender,
  // }) async {
  //   var result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //     email: userEmailIdController.text,
  //     password: passwordController.text,
  //   );

  //   if (result != null) {
  //     FirebaseFirestore.instance
  //         .collection(userCollection)
  //         .doc(result.user!.uid)
  //         .set({
  //       "name": userNameController.text,
  //       "email": userEmailIdController.text,
  //       "password": passwordController.text,
  //       "confirm password": confirmPasswordController.text,
  //       "mobile number": phoneNumberController.text,
  //       "gender": gender == 'male' ? 'm' : 'f',
  //     }).then((value) {
  //       if (true) {
  //         flutterToast(msg: 'Registered Successfully', color: Colors.green);
  //         print("Register is Sucessful");
  //         emit(RegisterSuccessState());
  //       }
  //     });
  //  }
  //}
}
