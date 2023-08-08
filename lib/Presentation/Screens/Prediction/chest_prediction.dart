import 'dart:io';
import 'package:flutter/material.dart';
import 'package:chest_disease_prediction/Presentation/Screens/Prediction/result_of_prediction.dart';
import 'package:chest_disease_prediction/business_logic/detection_model/detection_state.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../business_logic/detection_model/detection_cubit.dart';

class ChestPrediction extends StatelessWidget {
  ChestPrediction({
    Key? key,
    required this.imageMean,
    required this.imageStd,
    required this.numResults,
    required this.threshold,
  }) : super(key: key);

  double imageMean;
  double imageStd;
  int numResults;
  double threshold;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Text(
              "Chest Prediction",
              style: TextStyle(
                color: Colors.black,
                fontFamily: "JF-Flat",
                fontWeight: FontWeight.bold,
              ),
            ),
            elevation: 0,
            centerTitle: true,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
          ),
          body: cubit.loading
              ? Container(
                  alignment: Alignment.center,
                  child: const CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      cubit.iimage == null
                          ? Container(
                              margin: const EdgeInsets.symmetric(vertical: 40),
                              child: const Text(
                                "Result of prediction...",
                                style: TextStyle(
                                    fontSize: 18, fontFamily: "JF-Flat"),
                              ),
                            )
                          : ResultOfPrediction(
                              cubit: cubit,
                            ),
                      cubit.iimage == null
                          ? Container(
                              height: 250,
                              width: 400,
                              margin: const EdgeInsets.only(
                                  top: 150, left: 20, right: 20),
                              decoration: BoxDecoration(
                                  color: Colors.blueGrey.shade300,
                                  borderRadius: BorderRadius.circular(16)),
                              child: const Center(
                                  child: Text(
                                "Select Chest x ray from: ",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: "JF-Flat"),
                              )),
                            )
                          : Container(
                              height: 250,
                              width: 400,
                              margin: const EdgeInsets.only(
                                  top: 150, left: 20, right: 20),
                              decoration: BoxDecoration(
                                  color: Colors.blueGrey.shade300,
                                  borderRadius: BorderRadius.circular(16)),
                              child: Image.file(
                                cubit.iimage as File,
                                fit: BoxFit.fill,
                                height: 250,
                                width: 400,
                              ),
                            ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              cubit.pickImgFromCamera(
                                imageMean: imageMean,
                                imageStd: imageStd,
                                threshold: threshold,
                                numResult: numResults,
                              );
                            },
                            child: Container(
                              height: 50,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(16)),
                              child: Row(
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: Icon(
                                      Icons.camera_alt,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Camera",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "JF-Flat"),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              cubit.pickImgFromGallary(
                                imageMean: imageMean,
                                imageStd: imageStd,
                                numResult: numResults,
                                threshold: threshold,
                              );
                            },
                            child: Container(
                              margin: const EdgeInsets.only(left: 20),
                              height: 50,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(16)),
                              child: Row(
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: Icon(
                                      Icons.upload,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Upload",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "JF-Flat"),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
