import 'package:flutter/material.dart';
import 'package:tenzi/constants.dart';
import 'package:tenzi/models/tenzi.dart';
import 'package:tenzi/pages/tenzi_details.dart';
import 'package:tenzi/models/tenzi.dart';

class LessonCard extends StatelessWidget {
  final Tenzi lesson;
  LessonCard({required this.lesson});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TenziDetails(
              //ToDo - Hardcoded data, make it real depending on `ariving` data
                tenzi: Tenzi(titleNo: '1', titleEnglish: 'En title',
                    title: 'Mwokozi Mungu', verses: 'Vers blah blah')
            ),
          ),
        );
      }, // Handle onTap anywhere along the lesson card
      child: Container(
        margin: EdgeInsets.only(bottom: 10.0),
        padding: EdgeInsets.all(6.0),
        width: double.infinity,
        // height: ScreenUtil().setHeight(65.0), original
        height: 65,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(169, 176, 185, 0.42),
              spreadRadius: 0,
              blurRadius: 8,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              // height: ScreenUtil().setHeight(55.0),
              // width: ScreenUtil().setWidth(55.0),
              height: 55.0,
              width: 55.0,
              decoration: BoxDecoration(
                // color: Color.fromRGBO(224, 230, 255, 1),
                color: Colors.amber[800]
              ),
              child: Center(
                child: Text(this.lesson.titleNo,
                style: TextStyle(
                  fontSize: 24,
                  color: Constants.primaryTextColor,
                  letterSpacing: 1,
                  fontWeight: FontWeight.bold
                ),
                ),
              ),
            ),
            SizedBox(
              width: 25.0,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    this.lesson.title,
                    style: TextStyle(
                      color: Constants.primaryTextColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 14.0,
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    this.lesson.titleEnglish,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Constants.captionTextColor,
                    ),
                  ),
                ],
              ),
            ), IconButton(onPressed: (){
              //ToDo -- Play corresponding audio
            },
                icon: Icon(Icons.play_circle_fill_rounded),
                color: Constants.primaryColor,
                ),
            SizedBox(
              width: 15.0,
            )
          ],
        ),
      ),
    );
  }
}
