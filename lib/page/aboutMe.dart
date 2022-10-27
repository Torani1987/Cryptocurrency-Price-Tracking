import 'package:crypto_app_pi/page/constants.dart';
import 'package:crypto_app_pi/widget/background.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class aboutMe extends StatelessWidget {
  const aboutMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: 50.0,
            backgroundImage: AssetImage('images/test.jpeg'),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Card(
              color: kbackgroundColor,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.email,
                      size: 20,
                      color: Colors.black54,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'rahmattorani20@gmail.com',
                      style: GoogleFonts.raleway(
                        color: Colors.black54,
                        fontSize: 12,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kbackgroundColor,
        child: Icon(
          Icons.arrow_back_ios,
          color: Colors.black54,
        ),
        onPressed: (() => Navigator.pop(context)),
      ),
    );
  }
}
