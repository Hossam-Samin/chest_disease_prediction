import 'package:flutter/material.dart';

import '../../constants/app_assets.dart';

class CustomCard extends StatefulWidget {
  CustomCard({
    Key? key,
    required this.image,
    required this.doctorRate,
    required this.doctorName,
    required this.doctorExp,
  });

  String image;
  String doctorRate;
  String doctorName;
  String doctorExp;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 5, right: 5),
      height: 200,
      width: 200,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.green.shade100,
        elevation: 5,
        child: Column(
          children: <Widget>[
            const SizedBox(height: 10),
            CircleAvatar(
              backgroundImage: AssetImage(widget.image),
              radius: 30,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.star_rate_rounded,
                  color: Colors.amber,
                ),
                Text(
                  "Rating ${widget.doctorRate}",
                )
              ],
            ),
            const SizedBox(height: 10),
            Text(
              widget.doctorName,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              widget.doctorExp,
            )
          ],
        ),
      ),
    );
  }
}
