import 'package:flutter/material.dart';
import 'package:netflix_dec/utils/color_constants.dart';

class CustomMovieCards extends StatelessWidget {
  const CustomMovieCards({
    super.key,
    required this.title,
    this.height = 177,
    this.width = 103,
    this.isCircular = false,
    required this.imagesList,
    this.isOptionsVisible = false,
  });
  final String title; // to get custom title to the custom widget
  final double height; // to adjust the height of the listview and contanier
  final double width; // to adjust the with of the contianer
  final bool isCircular; // to make the container circular
  final bool isOptionsVisible; // to show thw options on the bottom of the movie card
  final List<String> imagesList; //  images urls list

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
                    // alignment: Alignment.bottomCenter,
                    child: Visibility(
                      visible: isOptionsVisible,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: width,
                            height: 5,
                            color: ColorConstants.mainGrey,
                            alignment: Alignment.centerLeft,
                            child: Container(
                              width: 40,
                              height: 5,
                              color: ColorConstants.mainRed,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                            color: ColorConstants.mainBlack,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.info_outline,
                                  color: ColorConstants.mainWhite,
                                ),
                                Icon(
                                  Icons.more_vert,
                                  color: ColorConstants.mainWhite,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
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
