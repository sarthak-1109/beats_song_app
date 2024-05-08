import 'package:flutter/material.dart';
import 'package:music_project/consts/check_box.dart';
import 'package:music_project/views/home.dart';

class PremiumPage extends StatelessWidget {
  const PremiumPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0XFF662D8C), Color(0xffED1E79)])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: Icon(
            Icons.music_note,
            color: Color(0XFFD8B5FF),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    color: Color(0XFFD8B5FF),
                  ),
                ))
          ],
        ),
        body: Column(
          children: [
            Text(
              'Your first three months free',
              style: TextStyle(
                color: Color(0XFFD8B5FF),
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'No commitment.Cancel Anytime',
              style: TextStyle(
                color: Color(0XFFD8B5FF),
                fontSize: 15,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              width: double.infinity,
              height: 120,
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Individual',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Color(0XFFD8B5FF),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        '520 Rs per month after trial ends',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                          color: Color(0XFFD8B5FF),
                        ),
                      ),
                      SizedBox(
                        width: 70,
                      ),
                      CheckBoxWidget(),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              height: 120,
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Family',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Color(0XFFD8B5FF),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        '750 Rs per month after trial ends',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                          color: Color(0XFFD8B5FF),
                        ),
                      ),
                      SizedBox(
                        width: 70,
                      ),
                      CheckBoxWidget(),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              height: 120,
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'College Student',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Color(0XFFD8B5FF),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        '320 Rs per month after trial ends',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                          color: Color(0XFFD8B5FF),
                        ),
                      ),
                      SizedBox(
                        width: 70,
                      ),
                      CheckBoxWidget(),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    side: BorderSide(color: Colors.white),
                    elevation: 0),
                onPressed: () {},
                child: Text(
                  'Start Trial',
                  style: TextStyle(
                    color: Color(0XFFD8B5FF),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
