import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:chest_disease_prediction/Presentation/Screens/Home_Page/home.dart';
import 'package:chest_disease_prediction/Presentation/Screens/Prediction/chest_prediction.dart';
import 'package:chest_disease_prediction/constants/app_assets.dart';
import '../../../business_logic/detection_model/detection_cubit.dart';
import '../../../data/Models/Doctor_List_Model/doctor_list_model.dart';
import '../../widgets/custom_Card.dart';
import '../../widgets/custom_textField.dart';
import 'Advice/advice.dart';
import 'Information/information.dart';

class Categories extends StatefulWidget {
  Categories(this.email);

  final String email;

  @override
  State<Categories> createState() => _CategoriesState();
}

final TextEditingController searchController = TextEditingController();
int? length;

class _CategoriesState extends State<Categories> {
  static List<DoctorModel> doctorList = [
    DoctorModel(
        image: AppAssets.youssef,
        rate: "4.8",
        docName: "Dr.Youssef Mansour",
        jobTitle: "Chest doctor 5 y.e,"),
    DoctorModel(
        image: AppAssets.mina,
        rate: "4.6",
        docName: "Dr.Mina Moussa",
        jobTitle: "Chest doctor 4 y.e,"),
    DoctorModel(
        image: AppAssets.hossam,
        rate: "4.2",
        docName: "Dr.Hossam Samin",
        jobTitle: "Chest doctor 3 y.e,"),
    DoctorModel(
        image: AppAssets.andrew,
        rate: "4.4",
        docName: "Dr.Andrew Nassim",
        jobTitle: "Chest doctor 4 y.e,"),
    DoctorModel(
        image: AppAssets.moheb,
        rate: "4.5",
        docName: "Dr.Moheb Youssef",
        jobTitle: "Chest doctor 4 y.e,"),
  ];

  List<DoctorModel> display_list = List.from(doctorList);

  void updateList(String value) {
    setState(() {
      display_list = doctorList
          .where((element) =>
              element.docName.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 50,
                left: 10,
                right: 40,
              ),
              child: CustomTextField(
                onChange: (value) => updateList(value),
                controller: searchController,
                prefixIcon: const Icon(Icons.search),
                hintText: "Search any doctor in list ...",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 50,
            ),
            child: Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.green.shade100),
              child: IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            backgroundColor: Colors.blueGrey.shade100,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18)),
                            contentPadding: const EdgeInsets.all(50),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Log out",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "JF-Flat"),
                                ),
                                Image.asset(
                                  AppAssets.logout,
                                  height: 70,
                                )
                              ],
                            ),
                            content: const Text(
                              "Are you sure to logout?",
                              style: TextStyle(
                                  fontSize: 18, fontFamily: "JF-Flat"),
                            ),
                            actions: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.green.shade300,
                                  ),
                                  child: const Text(
                                    "Cancel",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "JF-Flat"),
                                  ),
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: OutlinedButton(
                                  onPressed: () {
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const HomePage(),
                                        ),
                                        (route) => false);
                                  },
                                  style: OutlinedButton.styleFrom(
                                      primary: Colors.red,
                                      side:
                                          const BorderSide(color: Colors.red)),
                                  child: const Text(
                                    "Ok",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "JF-Flat"),
                                  ),
                                ),
                              ),
                            ],
                          );
                        });
                  },
                  icon: const Icon(
                    Icons.logout_outlined,
                    color: Colors.pink,
                  )),
            ),
          )
        ],
      ),
      const Padding(
        padding: EdgeInsets.only(top: 40, left: 10),
        child: Text(
          "Hello Dr !",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10, left: 10),
        child: Text(
          " ${widget.email}",
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      const Divider(
          color: Colors.blueGrey, thickness: 1, indent: 20, endIndent: 20),
      Card(
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        color: Colors.green.shade100,
        elevation: 5,
        child: Column(
          children: [
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 20, left: 10, bottom: 20),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 50,
                    backgroundImage: AssetImage(AppAssets.onBoardingChest5),
                  ),
                ),
                const SizedBox(width: 20),
                Column(
                  children: [
                    const Text(
                      "How do you feel ?",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: "JF-Flat"),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Check Prediction Normal or Pneumonia chest",
                      style: TextStyle(
                        fontSize: 11,
                        fontFamily: "JF-Flat",
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChestPrediction(
                              imageMean: 244.0,
                              imageStd: 244.0,
                              numResults: 4,
                              threshold: 0.2,
                            ),
                          ),
                        );
                        AppCubit.get(context).loadBrainTumourModel();
                        AppCubit.get(context).clearImage();
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          padding: const EdgeInsets.only(
                              top: 10, bottom: 10, left: 30, right: 30)),
                      child: const Text(
                        "Get Start",
                        style: TextStyle(fontSize: 20, fontFamily: "JF-Flat"),
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
      const SizedBox(height: 20),
      Container(
        alignment: Alignment.center,
        height: 100,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            InkWell(
              onTap: () {
                showModalBottomSheet(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13)),
                    context: context,
                    builder: (context) {
                      return const InformationBottomSheet();
                    });
              },
              child: Container(
                margin: const EdgeInsets.only(left: 10),
                height: 50,
                width: 180,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Colors.green.shade100,
                  elevation: 5,
                  child: Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(top: 15, left: 5, bottom: 15),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage(AppAssets.info),
                        ),
                      ),
                      SizedBox(width: 10),
                      Text("Information")
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13)),
                    context: context,
                    builder: (context) {
                      return const AdviceBottomSheet();
                    });
              },
              child: Container(
                margin: const EdgeInsets.only(left: 10),
                height: 50,
                width: 180,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Colors.green.shade100,
                  elevation: 5,
                  child: Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(top: 15, left: 5, bottom: 15),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundImage:
                              AssetImage(AppAssets.adviceBottomSheet),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Advice")
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      const SizedBox(height: 20),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "Doctors List",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "See all",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
      const SizedBox(height: 20),
      Container(
        margin: const EdgeInsets.only(left: 5, right: 5),
        height: 200,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: display_list.length,
          itemBuilder: (context, index) => CustomCard(
            image: display_list[index].image,
            doctorRate: display_list[index].rate,
            doctorName: display_list[index].docName,
            doctorExp: display_list[index].jobTitle,
          ),
        ),
      ),
    ])));
  }
}
