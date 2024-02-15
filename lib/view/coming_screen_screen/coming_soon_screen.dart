import 'package:flutter/material.dart';
import 'package:netflix_dec/utils/color_constants.dart';
import 'package:netflix_dec/utils/dummy_db.dart';
import 'package:netflix_dec/view/coming_screen_screen/widgets/custom_new_arrival_card.dart';
import 'package:netflix_dec/view/coming_screen_screen/widgets/notification_screen_cutom_movie_card.dart';

class ComingSoonSCreen extends StatelessWidget {
  const ComingSoonSCreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.mainBlack,
      appBar: AppBar(
        backgroundColor: ColorConstants.mainBlack,
        leading: Center(
          child: CircleAvatar(
            radius: 15,
            backgroundColor: ColorConstants.mainRed,
            child: Icon(
              Icons.notifications,
              color: ColorConstants.mainWhite,
            ),
          ),
        ),
        title: Text(
          "Notifications",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: ColorConstants.mainWhite),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: ColorConstants.mainGrey,
                child: ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: DummyDb.moviesData.length,
                  itemBuilder: (context, index) => CustomNewArrivalCard(
                    newArrivals: DummyDb.moviesData,
                    indexvalue: index,
                  ),
                  separatorBuilder: (context, index) => SizedBox(height: 10),
                ),
              ),
              ListView.separated(
                padding: EdgeInsets.symmetric(vertical: 20),
                itemCount: DummyDb.notificationMovieList.length,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) =>
                    NotificationScreenCustomMovieCard(
                  imageUrl: DummyDb.notificationMovieList[index]['imageUrl'],
                  subTitle: DummyDb.notificationMovieList[index]['subtitle'],
                  title: DummyDb.notificationMovieList[index]['title'],
                  des: DummyDb.notificationMovieList[index]['description'],
                ),
                separatorBuilder: (context, index) => SizedBox(height: 20),
              )
            ],
          ),
        ),
      ),
    );
  }
}
