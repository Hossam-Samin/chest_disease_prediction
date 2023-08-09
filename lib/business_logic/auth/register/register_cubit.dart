import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../constants/constant_methods.dart';
import '../../../constants/end_points.dart';
import '../../../data/data_provider/remote/dio_helper.dart';
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
      }
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(RegisterErrorState());
    });
  }
}
