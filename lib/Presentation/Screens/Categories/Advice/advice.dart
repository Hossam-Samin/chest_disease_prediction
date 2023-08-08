import 'package:flutter/material.dart';
import 'package:chest_disease_prediction/constants/app_assets.dart';

class AdviceBottomSheet extends StatelessWidget {
  const AdviceBottomSheet({super.key});

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
              image: AssetImage(AppAssets.adviceBottomSheet),
              fit: BoxFit.contain,
            ),
          ),
          child: Column(children: [
            const ExpansionTile(
              iconColor: Colors.black,
              title: Text(
                "Treatment",
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
                    "Chest pain treatment varies depending on what's causing the pain.",
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
                "Medications",
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
                    "Medicines used to treat some of the most common causes of chest pain include:",
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
                        text: "Artery relaxers:",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "JF-Flat",
                            color: Colors.black),
                        children: [
                          TextSpan(
                              text:
                                  "\nNitroglycerin — usually taken as a tablet under the tongue — relaxes heart arteries so blood can flow more easily through the narrowed spaces. Some blood pressure medicines also relax and widen blood vessels.",
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
                        text: "Aspirin:",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "JF-Flat",
                            color: Colors.black),
                        children: [
                          TextSpan(
                              text:
                                  "\nIf health care providers think that your chest pain is related to your heart, you'll likely be given aspirin.",
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
                        text: "Clot-busting drugs, also called thrombolytics:",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "JF-Flat",
                            color: Colors.black),
                        children: [
                          TextSpan(
                              text:
                                  "\nIf you are having a heart attack, you may receive these medicines. These work to dissolve the clot that is blocking blood from reaching the heart muscle.",
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
                        text: "Blood thinners:",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "JF-Flat",
                            color: Colors.black),
                        children: [
                          TextSpan(
                              text:
                                  "\nIf you have a clot in an artery going to your heart or lungs, you'll likely be given medicines to prevent more clots from forming.",
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
                        text: "Acid-reducing medicines:",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "JF-Flat",
                            color: Colors.black),
                        children: [
                          TextSpan(
                              text:
                                  "\nIf chest pain is caused by stomach acid splashing into the esophagus, a health care provider may suggest these medicines. They reduce the amount of acid in the stomach.",
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
                        text: "Antidepressants:",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "JF-Flat",
                            color: Colors.black),
                        children: [
                          TextSpan(
                              text:
                                  "\nIf you're having panic attacks, your health care provider may prescribe antidepressants to help control symptoms. Talk therapy, such as cognitive behavioral therapy, also might be recommended.",
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
                "Surgical and other procedures",
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
                    "Other treatments for some of the most dangerous causes of chest pain include:",
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
                        text: "Angioplasty and stent placement:",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "JF-Flat",
                            color: Colors.black),
                        children: [
                          TextSpan(
                              text:
                                  "\nThis treatment helps remove a blockage in an artery going to the heart. The health care provider inserts a thin tube with a balloon on the end into a large blood vessel, usually in the groin. The provider guides the tube to the blockage. The balloon expands. This widens the artery. The balloon is deflated and removed with the tube. A small wire mesh tube called a stent is often placed in the artery to keep it open.",
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
                        text: "Coronary artery bypass surgery:",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "JF-Flat",
                            color: Colors.black),
                        children: [
                          TextSpan(
                              text:
                                  "\nThis type of open-heart surgery creates a new pathway for blood to flow around a blockage in the heart. The surgeon takes a blood vessel from another part of the body and uses it to create the new pathway.",
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
                        text: "Emergency repair surgery:",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "JF-Flat",
                            color: Colors.black),
                        children: [
                          TextSpan(
                              text:
                                  "\nYou may need emergency heart surgery to repair a ruptured aorta, also called an aortic dissection. It's a life-threatening condition",
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
                        text: "Lung reinflation:",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "JF-Flat",
                            color: Colors.black),
                        children: [
                          TextSpan(
                              text:
                                  "\nIf you have a collapsed lung, a health care provider may insert a tube in the chest to expand the lung.",
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
