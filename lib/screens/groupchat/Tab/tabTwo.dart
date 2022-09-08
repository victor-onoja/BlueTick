import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AttachmentTab extends StatelessWidget {
  const AttachmentTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
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
                      child: Image.asset('Assets/Rectangle 32.png'),
                    ),
                    SizedBox(
                      //padding: const EdgeInsets.symmetric(vertical :3.0),
                      width: 160,
                      height: 114,
                      child: Image.asset('Assets/Rectangle 33.png'),
                    ),
                    SizedBox(
                      //padding: const EdgeInsets.symmetric(vertical: 3.0),
                      width: 160,
                      height: 114,
                      child: Image.asset('Assets/Rectangle 34.png'),
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
                      child: Image.asset('Assets/Rectangle 32.png'),
                    ),
                    SizedBox(
                      //padding: const EdgeInsets.symmetric(vertical :3.0),
                      width: 160,
                      height: 114,
                      child: Image.asset('Assets/Rectangle 33.png'),
                    ),
                    SizedBox(
                      //padding: const EdgeInsets.symmetric(vertical: 3.0),
                      width: 160,
                      height: 114,
                      child: Image.asset('Assets/Rectangle 34.png'),
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
            SizedBox(
              height: 114,
              child: ListView(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(
                      //padding: const EdgeInsets.symmetric(vertical: 3.0 ),
                      //width: 136,
                      height: 114,
                      child: Text("Lorem ipsum dolor sit amet, Chuks the boss"),
                    ),
                    SizedBox(
                      //padding: const EdgeInsets.symmetric(vertical :3.0),
                      //width: 160,
                      height: 114,
                      child: Text("Lorem ipsum dolor sit amet, Chuks the boss"),
                    ),
                    SizedBox(
                      //padding: const EdgeInsets.symmetric(vertical: 3.0),
                      //width: 160,
                      height: 114,
                      child: Text("Lorem ipsum dolor sit amet, Chuks the boss"),
                    )
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
