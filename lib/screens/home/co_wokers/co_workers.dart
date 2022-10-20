import 'package:bluetick/components/app_theme.dart';
import 'package:bluetick/components/services/api_models/error_model.dart';
import 'package:bluetick/components/services/api_models/get_staff_response/all_staff_detail.dart';
import 'package:bluetick/components/services/api_models/get_staff_response/get_staff_response.dart';
import 'package:bluetick/components/services/providers.dart';
import 'package:bluetick/components/ui/ui_utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../components/config/config_sheet.dart';

class Workers extends ConsumerStatefulWidget {
  const Workers({Key? key}) : super(key: key);

  @override
  ConsumerState<Workers> createState() => WorkersState();
}

class WorkersState extends ConsumerState<Workers> {
  WorkersState();

  List<AllStaffDetail> staffList = [];

  bool isSearching = false;
  List<AllStaffDetail> searchedStaff = [];

  static final customCacheManager = CacheManager(Config('customCacheKey',
      stalePeriod: const Duration(days: 15), maxNrOfCacheObjects: 100));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          toolbarOpacity: 1,
          toolbarHeight: 44,
          backgroundColor: mainBlue,
          leading: IconButton(
              onPressed: () => null, icon: const Icon(Icons.arrow_back)),
          centerTitle: true,
          title: const Text(
            'Workers',
            style: TextStyle(fontSize: 24),
          ),
        ),
        body: RefreshIndicator(
          onRefresh: () {
            return Future.delayed(Duration(milliseconds: 1000), () {
              ref.refresh(getStaffProvider);
            });
          },
          child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  Container(
                      alignment: AlignmentDirectional.center,
                      height: 49,
                      margin: const EdgeInsets.only(bottom: 30),
                      decoration: BoxDecoration(color: blue2),
                      child: ListTile(
                        horizontalTitleGap: 2,
                        contentPadding:
                            const EdgeInsets.only(right: 2, left: 20),
                        dense: true,
                        trailing: IconButton(
                            color: Colors.black,
                            onPressed: () => null,
                            icon: ImageIcon(
                              const AssetImage('Assets/icons/Vector.png'),
                              color: blackerBlack,
                            )),
                        title: TextField(
                            //showCursor: false,
                            cursorHeight: 12,
                            style: const TextStyle(fontSize: 12),
                            decoration: InputDecoration(
                                constraints: const BoxConstraints.tightFor(
                                    width: 336, height: 28),
                                contentPadding:
                                    const EdgeInsets.only(left: 10, bottom: 2),
                                hintText: 'Search for a staff',
                                hintStyle: TextStyle(
                                    color: blue2,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 11.98),
                                fillColor: Colors.white,
                                filled: true,
                                border: createScreenBorder(),
                                focusedBorder: createScreenBorder(),
                                enabledBorder: createScreenBorder())),
                      )),
                  Consumer(
                    builder:
                        (BuildContext context, WidgetRef ref, Widget? child) {
                      AsyncValue<Either<ErrorModel, GetStaffResponse>>
                          listview = ref.watch(getStaffProvider);
                      return listview.when(
                        data: (Either<ErrorModel, GetStaffResponse> data) {
                          if (data.isRight) {
                            staffList = data.right.allStaffDetails!;

                            return isSearching && searchedStaff.isEmpty
                                ? Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const SizedBox(
                                          height: 100,
                                        ),
                                        Icon(
                                          Icons.search_off,
                                          size: 100,
                                          color: AppTheme.blue2,
                                        ),
                                        Text(
                                          'No results found',
                                          style: TextStyle(
                                            fontSize: 35,
                                            fontWeight: FontWeight.bold,
                                            color: AppTheme.blue2,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                :

                                ///if isearching is true
                                isSearching
                                    ? ListView.builder(
                                        shrinkWrap: true,
                                        itemBuilder: ((context, index) {
                                          return Container(
                                            width: double.infinity,
                                            margin:
                                                const EdgeInsets.only(top: 4),
                                            height: 51.97,
                                            color: AppTheme.mainBlue,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 4,
                                                      horizontal: 16),
                                              child: ListTile(
                                                title: Text(
                                                  searchedStaff[index]
                                                      .fullname!,
                                                  style: GoogleFonts.montserrat(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle: FontStyle.normal,
                                                    color: AppTheme.white,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                                        itemCount: searchedStaff.length,
                                      )
                                    : ListView.builder(
                                        shrinkWrap: true,
                                        itemBuilder: _staffList,
                                        itemCount:
                                            data.right.allStaffDetails!.length,
                                      );
                          } else {
                            return Center(
                                child: Text('You have no network connections'));
                          }
                        },
                        error: (Object error, StackTrace? stackTrace) => Center(
                            child: Text(
                          'something went wrong',
                          style: GoogleFonts.montserrat(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                            color: Colors.red,
                          ),
                        )),
                        loading: () => CircularProgressIndicator(
                          strokeWidth: 2,
                          color: mainBlue,
                          valueColor:
                              AlwaysStoppedAnimation(mainBlue.withOpacity(0.8)),
                          backgroundColor: Colors.transparent,
                        ),
                      );
                    },
                  )
                ],
              )),
        ),
      ),
    );
  }

  Widget _staffList(BuildContext context, int index) {
    return Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
      AsyncValue<Either<ErrorModel, GetStaffResponse>> stafflist =
          ref.watch(getStaffProvider);
      return stafflist.when(
        data: (Either<ErrorModel, GetStaffResponse> data) => Container(
          width: double.infinity,
          margin: const EdgeInsets.only(bottom: 4),
          height: 51.97,
          color: AppTheme.mainBlue,
          child: ListTile(
              leading: CachedNetworkImage(
                cacheManager: customCacheManager,
                key: UniqueKey(),
                imageUrl: data.right.allStaffDetails![index].profileimg!,
                errorWidget: (context, url, error) => Icon(Icons.error),
                placeholder: (context, url) => CircularProgressIndicator(),
                fit: BoxFit.contain,
                imageBuilder: (context, imageProvider) {
                  return CircleAvatar(
                    backgroundImage: imageProvider,
                  );
                },
              ),
              title: data.right.allStaffDetails![index].isAdmin!
                  ? Row(
                      children: [
                        Text(
                          data.right.allStaffDetails![index].fullname!,
                          style: GoogleFonts.montserrat(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                            color: AppTheme.white,
                          ),
                        ),
                        Text(' (Admin)',
                            style: GoogleFonts.montserrat(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.normal,
                              color: AppTheme.white,
                            ))
                      ],
                    )
                  : Text(
                      data.right.allStaffDetails![index].fullname!,
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                        color: AppTheme.white,
                      ),
                    )
              // subtitle: Text(''),
              // trailing: Text(''),
              ),
        ),
        error: (Object error, StackTrace? stackTrace) => Center(
            child: Text(
          'something went wrong',
          style: GoogleFonts.montserrat(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.normal,
              color: Colors.red),
        )),
        loading: () => CircularProgressIndicator(
          strokeWidth: 2,
          color: mainBlue,
          valueColor: AlwaysStoppedAnimation(mainBlue.withOpacity(0.8)),
          backgroundColor: Colors.transparent,
        ),
      );
    });
  }
}
