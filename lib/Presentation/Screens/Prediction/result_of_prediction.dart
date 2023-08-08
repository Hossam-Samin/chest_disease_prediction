import 'package:flutter/material.dart';
import '../../../business_logic/detection_model/detection_cubit.dart';

class ResultOfPrediction extends StatelessWidget {
  ResultOfPrediction({Key? key, required this.cubit}) : super(key: key);

  AppCubit cubit;
  var time = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
            ),
            child: Container(
              width: double.infinity,
              height: 100,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  Text(
                    "Accuracy: ${cubit.outputs![0]["confidence"] * 100} %",
                    style: const TextStyle(
                      color: Colors.lightGreen,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontFamily: "JF-Flat",
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "Label: ${cubit.outputs![0]["label"]}",
                    style: const TextStyle(
                        color: Colors.lightGreen,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontFamily: "JF-Flat"),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
