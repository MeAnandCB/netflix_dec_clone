import 'package:flutter/material.dart';
import 'package:netflix_dec/utils/color_constants.dart';

class CustomMovieCards extends StatelessWidget {
  const CustomMovieCards({
    super.key,
    required this.title,
    this.height = 200,
    this.width = 100,
    this.isCircular = false,
    required this.imagesList,
  });
  final String title;
  final double height;
  final double width;
  final bool isCircular;
  final List<String> imagesList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: ColorConstants.mainWhite,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            SizedBox(
              height: height,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: imagesList.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        shape: isCircular == true ? BoxShape.circle : BoxShape.rectangle,
                        color: Colors.red,
                        image: DecorationImage(image: NetworkImage(imagesList[index]), fit: BoxFit.cover)),
                    height: height,
                    width: width,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
