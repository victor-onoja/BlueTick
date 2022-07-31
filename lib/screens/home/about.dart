import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../components/app_theme.dart';
import 'package:bluetick/screens/home/home.dart';
class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const img = "Assets/images/Variant4.png";
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFFF3F6FF), Color(0xFF96A7D0),])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            "About",
            style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w500, color: AppTheme.offWhite)),
          ),
          centerTitle: true,
          backgroundColor: AppTheme.mainBlue,
          leading: Icon(
            Icons.arrow_back,
            color: AppTheme.offWhite,
          ),
          actions: [
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(
                        context,
                        MaterialPageRoute(
                            builder: (_) =>  HomeScreen() ));
                  },
                ),
              ],
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 72,),
              Image.asset (img,width: 302, height: 302,),
              SizedBox(height: 32,),
              Center(
                child: Text(
                  "A mobile app that allows employees check in remotely, find co-workers, learn about their whereabouts and see how far they are.",
                  style: GoogleFonts.montserrat(textStyle: TextStyle(
                      color: AppTheme.mainBlue,
                      fontWeight: FontWeight.w500,
                      fontSize: 16),),
                ),
              ),
              SizedBox(height: 205,),
              Row(
                children: [
                  Image.asset("Assets/images/openmoji_regional-indicator-c.png"),
                  SizedBox(width: 8.0,),
                  Text("2022 BlueTick",
                    style: GoogleFonts.montserrat(textStyle: TextStyle(
                        color: AppTheme.mainBlue,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),),
                  )
                ],
              ),
              SizedBox(height: 12,),
              Text("All rights reserved.",
                style: GoogleFonts.montserrat(textStyle: TextStyle(
                    color: AppTheme.mainBlue,
                    fontWeight: FontWeight.w500,
                    fontSize: 16),),
              )
            ],
      ),
          ),
        ),
      ),
    );
  }
}
