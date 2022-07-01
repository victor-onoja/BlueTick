import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../components/app_theme.dart';

class AttachmentTab extends StatelessWidget {
  const AttachmentTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 30, right: 200, left: 20),
            child: Text('Media',
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                )),
          ),
          Divider(
            thickness: 2,
            color: Colors.grey,
          ),
          SizedBox(
            height: 114,
            child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    //padding: const EdgeInsets.symmetric(vertical: 3.0 ),
                    width: 136,
                    //height: 114,
                    child: Image.asset('Assets/images/Attachment1.png'),
                  ),
                  SizedBox(
                    //padding: const EdgeInsets.symmetric(vertical :3.0),
                    width: 160,
                    height: 114,
                    child: Image.asset('Assets/images/Attachment2.png'),
                  ),
                  SizedBox(
                    //padding: const EdgeInsets.symmetric(vertical: 3.0),
                    width: 160,
                    height: 114,
                    child: Image.asset('Assets/images/Attachment3.png'),
                  )
                ]),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30, right: 200, left: 20),
            child: Text('Documents',
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                )),
          ),
          Divider(
            thickness: 2,
            color: Colors.grey,
          ),
          SizedBox(
            height: 114,
            child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    //padding: const EdgeInsets.symmetric(vertical: 3.0 ),
                    width: 136,
                    //height: 114,
                    child: Image.asset('Assets/images/Attachment4.png'),
                  ),
                  SizedBox(
                    //padding: const EdgeInsets.symmetric(vertical :3.0),
                    width: 160,
                    height: 114,
                    child: Image.asset('Assets/images/Attachment5.png'),
                  ),
                  SizedBox(
                    //padding: const EdgeInsets.symmetric(vertical: 3.0),
                    width: 160,
                    height: 114,
                    child: Image.asset('Assets/images/Attachment6.png'),
                  )
                ]),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30, right: 200, left: 20),
            child: Text('Links',
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                )),
          ),
          Divider(
            thickness: 2,
            color: Colors.grey,
          ),
          Text(
            'Lorem ipsum dolor sit amet, Ibrahim the boss',
            style: GoogleFonts.montserrat(
              fontSize: 12,
              fontStyle: FontStyle.normal,
              color: AppTheme.white,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Lorem ipsum dolor sit amet, Bishop the boss',
            style: GoogleFonts.montserrat(
              fontSize: 12,
              fontStyle: FontStyle.normal,
              color: AppTheme.white,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Lorem ipsum dolor sit amet, Victor the boss',
            style: GoogleFonts.montserrat(
              fontSize: 12,
              fontStyle: FontStyle.normal,
              color: AppTheme.white,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Lorem ipsum dolor sit amet, Chuks the boss',
            style: GoogleFonts.montserrat(
              fontSize: 12,
              fontStyle: FontStyle.normal,
              color: AppTheme.white,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Lorem ipsum dolor sit amet, Ola the boss',
            style: GoogleFonts.montserrat(
              fontSize: 12,
              fontStyle: FontStyle.normal,
              color: AppTheme.white,
            ),
          ),
        ],
      ),
    );
  }
}
