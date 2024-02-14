import 'package:flutter/material.dart';
import 'package:netflix_dec/utils/color_constants.dart';

class CustomNewArrivalCard extends StatelessWidget {
  final List newArrivals;
  final int indexvalue;
  const CustomNewArrivalCard(
      {super.key, required this.newArrivals, required this.indexvalue});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 76,
          width: 146,
          child: Image.network(
            newArrivals[indexvalue]['imageUrl'],
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: 30),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              newArrivals[indexvalue]['movieName'],
              style: TextStyle(color: ColorConstants.mainWhite, fontSize: 18),
            ),
            Text(
              newArrivals[indexvalue]['title'],
              style: TextStyle(color: ColorConstants.mainWhite, fontSize: 15),
            ),
            Text(
              newArrivals[indexvalue]['date'],
              style: TextStyle(
                  color: ColorConstants.mainWhite.withOpacity(.6),
                  fontSize: 12),
            ),
          ],
        ),
      ],
    );
  }
}
