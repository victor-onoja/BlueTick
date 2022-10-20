import 'package:bluetick/components/services/api_models/get_staff_response/all_staff_detail.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../components/config/config_sheet.dart';

class WorkerScreen extends StatelessWidget {
  final AllStaffDetail allStaffDetail;
  WorkerScreen({required this.allStaffDetail});

  @override
  Widget build(BuildContext context) {
    String userName = 'John Mac';
    String status = "(Online)";
    String about = "Lorem ipsum dolor sit amet, consectetur adipiscing elit.";
    const String direction = "Lagos 6km away";
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(children: [
              Stack(children: [
                const Positioned(
                  child: SizedBox(
                    width: 428,
                    height: 315,
                  ),
                ),
                Positioned(
                    child: Container(
                  decoration: BoxDecoration(gradient: linearWhiteGradient),
                  width: 428,
                  height: 271,
                )),
                Positioned(
                    right: 7,
                    bottom: 24,
                    child: Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                          color: blue2,
                          border: Border.all(color: Colors.black),
                          shape: BoxShape.circle),
                      child: IconButton(
                          onPressed: () => null,
                          icon: const ImageIcon(
                              AssetImage('Assets/message.png'))),
                    )),
                Positioned(
                    child: IconButton(
                        color: Colors.black,
                        onPressed: () => Navigator.pop(context),
                        // => Navigator.push(context,
                        //     MaterialPageRoute(builder: (_) => const HomeTab())),
                        icon: const Icon(Icons.arrow_back))),
                Positioned(
                    left: 2,
                    right: 2,
                    top: 60,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CachedNetworkImage(
                            key: UniqueKey(),
                            imageUrl: allStaffDetail.profileimg!,
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                            placeholder: (context, url) =>
                                CircularProgressIndicator(),
                            fit: BoxFit.contain,
                            imageBuilder: (context, imageProvider) {
                              return CircleAvatar(
                                backgroundImage: imageProvider,
                                radius: 42,
                              );
                            },
                          ),
                          Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 5),
                              child: Text(
                                allStaffDetail.fullname!,
                                style: const TextStyle(
                                  fontSize: 24,
                                ),
                              )),
                          Container(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Text(
                                status,
                                style: const TextStyle(fontSize: 12),
                              )),
                          SizedBox(
                              width: 200,
                              child: Text(
                                about,
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 12),
                              ))
                        ])),
                Positioned(
                  right: 1,
                  child: IconButton(
                    color: Colors.black,
                    onPressed: () => null,
                    icon: const Icon(Icons.phone),
                  ),
                ),
              ]),
              Container(
                color: mainBlue,
                width: 428,
                height: 170,
                child: ListView(
                  // physics: const NeverScrollableScrollPhysics(),
                  children: [
                    SizedBox(
                        height: 42,
                        child: ListTile(
                          leading: ImageIcon(
                            AssetImage('Assets/images/location.png'),
                            color: Colors.white,
                          ),
                          title: Text(
                            direction,
                            style: TextStyle(color: Colors.white),
                          ),
                        )),
                    Divider(
                      color: Colors.white,
                      thickness: 2,
                    ),
                    SizedBox(
                        height: 42,
                        child: ListTile(
                          leading: ImageIcon(
                            AssetImage('Assets/images/gis_position-man.png'),
                            color: Colors.white,
                          ),
                          title: Text(
                            allStaffDetail.role!,
                            style: TextStyle(color: Colors.white),
                          ),
                        )),
                    Divider(
                      color: Colors.white,
                      thickness: 2,
                    ),
                    SizedBox(
                        height: 42,
                        child: ListTile(
                          leading: ImageIcon(
                            AssetImage('Assets/images/clarity_email-solid.png'),
                            color: Colors.white,
                          ),
                          title: Text(
                            allStaffDetail.email!,
                            style: TextStyle(color: Colors.white),
                          ),
                        ))
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 30, right: 320),
                child: Text(
                  'Media',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              const Divider(
                thickness: 2,
                color: Colors.grey,
              ),
              SizedBox(
                height: 114,
                child: ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(
                      width: 136,
                      height: 114,
                      child: Image.asset('Assets/images/Rectangle 32.png'),
                    ),
                    SizedBox(
                      width: 136,
                      height: 114,
                      child: Image.asset('Assets/images/Rectangle 33.png'),
                    ),
                    SizedBox(
                      width: 136,
                      height: 114,
                      child: Image.asset('Assets/images/Rectangle 34.png'),
                    )
                  ],
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
