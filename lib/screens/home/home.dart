import 'dart:developer';

import 'package:bluetick/components/config/config_sheet.dart';
import 'package:bluetick/components/constants/app_router/app_router.dart';
import 'package:bluetick/components/services/api_models/get_staff_response/all_staff_detail.dart';
import 'package:bluetick/components/services/api_models/get_staff_response/get_staff_response.dart';
import 'package:bluetick/components/services/providers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import '../../components/app_theme.dart';
import '../../components/services/api_models/error_model.dart';
import 'home_drawer.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  late final TextEditingController searchController;
  List<AllStaffDetail> searchedStaff = [];
  List<AllStaffDetail> staffList = [];

  bool isSearching = false;

  String? date;
  String? dateTime;
  String? workspaceName;

  @override
  void initState() {
    date = DateFormat.yMd().format(DateTime.now());
    dateTime = DateFormat('EEEE,').add_jm().format(DateTime.now());
    searchController = TextEditingController();
    searchController.addListener(searchStaffListener);
    super.initState();
  }


  void searchStaffListener() {
    if (searchController.text.trim().isNotEmpty) {
      String searchQuery = searchController.text.trim().toLowerCase();

      List<AllStaffDetail> tempList = [];

      for (int i = 0; i < staffList.length; i++) {
        final singleStaff = staffList[i];

        if (singleStaff.fullname!.toLowerCase().contains(searchQuery)) {
          tempList.add(singleStaff);
        }
      }
      setState(() {
        searchedStaff = tempList;
        isSearching = true;
      });
    } else {
      setState(() {
        isSearching = false;
      });
    }
  }
  @override
  void setState(VoidCallback fn) {
    date = DateFormat.yMd().format(DateTime.now());
    dateTime = DateFormat('EEEE,').add_jm().format(DateTime.now());
    super.setState(fn);
  
  }


  static final customCacheManager = CacheManager(Config('customCacheKey',
      stalePeriod: const Duration(days: 15), maxNrOfCacheObjects: 100));


  @override
  Widget build(BuildContext context) {
    log('screen rebuild count');
    workspaceName = ref.read(workspaceProvider);
    return Scaffold(
      backgroundColor: AppTheme.offWhite,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppTheme.mainBlue,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        title: Text(
          workspaceName ?? 'BlueTick',
          style: GoogleFonts.montserrat(
            fontSize: 23.97,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            color: AppTheme.white,
          ),
          textAlign: TextAlign.center,
        ),
        actions: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(
              context,
              AppRouter.personalProfile,
            ),
            child: Container(
              height: 45, //31.95,
              width: 45, //31.96,
              margin: EdgeInsets.only(right: 11),
              child: Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
                  AsyncValue<Either<ErrorModel, GetStaffResponse>> adminDp =
                      ref.watch(getStaffProvider);
                  return adminDp.when(
                    data: (Either<ErrorModel, GetStaffResponse> data) {
                      if (data.isRight) {
                        return CachedNetworkImage(
                          imageUrl: data.right.allStaffDetails![0].profileimg!,
                          cacheManager: customCacheManager,
                          key: UniqueKey(),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                          placeholder: (context, url) =>
                              CircularProgressIndicator(),
                          fit: BoxFit.contain,
                          imageBuilder: (context, imageProvider) {
                            return CircleAvatar(
                              backgroundImage: imageProvider,
                            );
                          },
                        );
                      } else {
                        return Icon(Icons.error);
                      }
                    },
                    error: (Object error, StackTrace? stackTrace) =>
                        Icon(Icons.error),
                    loading: () => CircularProgressIndicator(
                      strokeWidth: 2,
                      color: mainBlue,
                      valueColor:
                          AlwaysStoppedAnimation(mainBlue.withOpacity(0.8)),
                      backgroundColor: Colors.transparent,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
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
              const SizedBox(
                height: 20.17,
              ),
              checkInHeader(context),
              searchStaff(),
              Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
                  AsyncValue<Either<ErrorModel, GetStaffResponse>> listview =
                      ref.watch(getStaffProvider);
                  return listview.when(
                    data: (Either<ErrorModel, GetStaffResponse> data) {
                      if (data.isRight) {
                        staffList = data.right.allStaffDetails!;

                        return isSearching && searchedStaff.isEmpty
                            ? Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                                        margin: const EdgeInsets.only(top: 4),
                                        height: 51.97,
                                        color: AppTheme.mainBlue,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 4, horizontal: 16),
                                          child: ListTile(
                                            title: Text(
                                              searchedStaff[index].fullname!,
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
          ),
        ),
      ),
      drawer: const HomeDrawer(),
    );
  }

  Container searchStaff() {
    return Container(
      margin: const EdgeInsets.only(top: 24, bottom: 8),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 24),
      height: 42,
      color: AppTheme.mainBlue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 4.0),
            child: Text(
              'Search',
              style: GoogleFonts.montserrat(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
                color: AppTheme.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: TextField(
              keyboardType: TextInputType.name,
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Search for a staff',
                hintStyle: GoogleFonts.montserrat(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.blue2,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                fillColor: AppTheme.offWhite,
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(
                    color: AppTheme.mainBlue,
                    width: 2,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(
                    color: AppTheme.mainBlue,
                    width: 2,
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: Image.asset(
                'Assets/search_icon.png',
                width: 18.97,
                height: 18.97,
                color: AppTheme.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container checkInHeader(BuildContext context) {
    return Container(
      height: 164.97,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppTheme.mainBlue,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 8),
            spreadRadius: 0,
            blurRadius: 16,
            inset: false,
            color: Color.fromRGBO(22, 40, 80, 0.4),
          ),
          BoxShadow(
            offset: Offset(12, 12),
            spreadRadius: 0,
            blurRadius: 12,
            inset: true,
            color: Color.fromRGBO(9, 16, 32, 0.6),
          ),
          BoxShadow(
            offset: Offset(-12, -12),
            spreadRadius: 0,
            blurRadius: 12,
            inset: true,
            color: Color.fromRGBO(150, 167, 208, 0.6),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 22,
            decoration: BoxDecoration(
                border: Border(
              left: BorderSide(width: 3, color: AppTheme.white),
              right: BorderSide(width: 3, color: AppTheme.white),
            )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    date ?? '12/06/2022',
                    style: GoogleFonts.montserrat(
                        color: AppTheme.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Text(
                    dateTime ?? '09:15am',
                    style: GoogleFonts.montserrat(
                        color: AppTheme.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Staff Online',
                    style: GoogleFonts.montserrat(
                        color: AppTheme.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Container(
                    height: 45,
                    width: 64,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: AppTheme.offWhite),
                    child: Center(
                      child: Text('0',
                          style: GoogleFonts.montserrat(
                              color: AppTheme.mainBlue,
                              fontWeight: FontWeight.w600,
                              fontSize: 24)),
                    ),
                  )
                ],
              ),
              SizedBox(
                width: 24,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Total Staff',
                    style: GoogleFonts.montserrat(
                        color: AppTheme.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Container(
                    height: 45,
                    width: 64,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: AppTheme.offWhite),
                    child: Center(
                      child: Consumer(
                        builder: (BuildContext context, WidgetRef ref,
                            Widget? child) {
                          AsyncValue<Either<ErrorModel, GetStaffResponse>>
                              numStaff = ref.watch(getStaffProvider);
                          return numStaff.when(
                            data: (Either<ErrorModel, GetStaffResponse> data) {
                              if (data.isRight) {
                                return Text(data.right.staffNumber.toString(),
                                    style: GoogleFonts.montserrat(
                                        color: AppTheme.mainBlue,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 24));
                              } else {
                                return Text('0',
                                    style: GoogleFonts.montserrat(
                                        color: AppTheme.mainBlue,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 24));
                              }
                            },
                            error: (Object error, StackTrace? stackTrace) =>
                                Text(
                              'X',
                              style: GoogleFonts.montserrat(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 24),
                            ),
                            loading: () => CircularProgressIndicator(
                              strokeWidth: 2,
                              color: mainBlue,
                              valueColor: AlwaysStoppedAnimation(
                                  mainBlue.withOpacity(0.8)),
                              backgroundColor: Colors.transparent,
                            ),
                          );
                        },
                      ),
                    ),
                  )
                ],
              )
            ],
          )
        ],
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
            title: Text(
              data.right.allStaffDetails![index].fullname!,
              style: GoogleFonts.montserrat(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.normal,
                color: AppTheme.white,
              ),
              textAlign: TextAlign.center,
            ),
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
