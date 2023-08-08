import 'package:flutter/material.dart';

import '../../../../constants/app_assets.dart';

class InformationBottomSheet extends StatelessWidget {
  const InformationBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 80),
          alignment: Alignment.center,
          padding: const EdgeInsets.only(bottom: 70),
          decoration: const BoxDecoration(
            image: DecorationImage(
              opacity: 0.3,
              image: AssetImage(AppAssets.info),
              fit: BoxFit.contain,
            ),
          ),
          child: Column(children: [
            const ExpansionTile(
              iconColor: Colors.black,
              title: Text(
                "Diagnosis",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: "JF-Flat",
                  fontSize: 20,
                ),
              ),
              children: [
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Chest pain doesn't always signal a heart attack. But that's what health care providers in the emergency room usually test for first because it's potentially the most immediate threat to your life. They also may check for life-threatening lung conditions — such as a collapsed lung or a blood clot in the lung.",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontFamily: "JF-Flat",
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
            ExpansionTile(
              iconColor: Colors.black,
              title: const Text(
                "Immediate tests",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: "JF-Flat",
                  fontSize: 20,
                ),
              ),
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Some of the first tests a health care provider may order when diagnosing the cause of chest pain include:",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontFamily: "JF-Flat",
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RichText(
                    text: const TextSpan(
                        text: "Electrocardiogram (ECG or EKG):",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "JF-Flat",
                            color: Colors.black),
                        children: [
                          TextSpan(
                              text:
                                  "\nThis quick test measures the electrical activity of the heart. Sticky patches called electrodes are placed on the chest and sometimes the arms and legs. Wires connect the electrodes to a computer, which displays or prints the test results. An ECG can show if the heart is beating too fast or too slowly. An ECG can help show if you have had or are having a heart attack.",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal))
                        ]),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RichText(
                    text: const TextSpan(
                        text: "Blood tests:",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "JF-Flat",
                            color: Colors.black),
                        children: [
                          TextSpan(
                              text:
                                  "\nCertain heart proteins slowly leak into the blood after heart damage from a heart attack. Blood tests can be done to check for these proteins.",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal))
                        ]),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RichText(
                    text: const TextSpan(
                        text: "Chest X-ray:",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "JF-Flat",
                            color: Colors.black),
                        children: [
                          TextSpan(
                              text:
                                  "\nAn X-ray of the chest shows the condition of the lungs and the size and shape of the heart and major blood vessels. A chest X-ray also can reveal lung problems such as pneumonia or a collapsed lung.",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal))
                        ]),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RichText(
                    text: const TextSpan(
                        text: "Computerized tomography (CT) scan:",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "JF-Flat",
                            color: Colors.black),
                        children: [
                          TextSpan(
                              text:
                                  "\nCT scans can spot a blood clot in the lung or find an aortic dissection.",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal))
                        ]),
                  ),
                ),
              ],
            ),
            ExpansionTile(
              iconColor: Colors.black,
              title: const Text(
                "Follow-up testing",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: "JF-Flat",
                  fontSize: 20,
                ),
              ),
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Depending on the results from the first tests for chest pain, you may need more testing, which may include:",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontFamily: "JF-Flat",
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RichText(
                    text: const TextSpan(
                        text: "Echocardiogram:",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "JF-Flat",
                            color: Colors.black),
                        children: [
                          TextSpan(
                              text:
                                  "\nSound waves are used to create videos of the heart in motion. Sometimes, a more detailed echocardiogram may be done to get better pictures of the heart. A small device may be passed down the throat to obtain better views of different parts of the heart.",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal))
                        ]),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RichText(
                    text: const TextSpan(
                        text: "Computerized tomography (CT) scan:",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "JF-Flat",
                            color: Colors.black),
                        children: [
                          TextSpan(
                              text:
                                  "\nDifferent types of CT scans can be used to check the heart arteries for blockages. A CT coronary angiogram also can be done with dye to check the heart and lung arteries for blockages and other problems.",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal))
                        ]),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RichText(
                    text: const TextSpan(
                        text: "Stress tests:",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "JF-Flat",
                            color: Colors.black),
                        children: [
                          TextSpan(
                              text:
                                  "\nThese tests often involve walking on a treadmill or riding a stationary bike while the heart rhythm is watched. Exercise tests help show how the heart reacts to exercise. If you can't exercise, you might be given medicines that affect the heart like exercise does.",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal))
                        ]),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RichText(
                    text: const TextSpan(
                        text: "Coronary catheterization:",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "JF-Flat",
                            color: Colors.black),
                        children: [
                          TextSpan(
                              text:
                                  "\nThis test helps health care providers see blockages in the heart arteries. A long, thin flexible tube is inserted into a blood vessel, usually in the groin or wrist, and guided to the heart. Dye flows through the tube to arteries in the heart. The dye helps the arteries show up more clearly on X-ray images and video.",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal))
                        ]),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
