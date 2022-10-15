import 'package:bluetick/screens/chatScreen/adminBroadcastScreen.dart';
import 'package:bluetick/screens/chatScreen/chatScreen.dart';
import 'package:bluetick/screens/groupchat/groupchatScreen.dart';
import 'package:bluetick/screens/home/about.dart';
import 'package:bluetick/screens/home/co_wokers/co_wokers_home_tab.dart';
import 'package:bluetick/screens/home/co_wokers/co_workers_call_screen.dart';
import 'package:bluetick/screens/home/home_exports.dart';
import 'package:bluetick/screens/home/invitation_screens/inivitation_sent.dart';
import 'package:bluetick/screens/home/invitation_screens/invitation_screen.dart';
import 'package:bluetick/screens/home/invitation_screens/invitationb1.dart';
import 'package:bluetick/screens/settings/ntf-settings.dart';
import 'package:bluetick/screens/sign_in/login.dart';
import 'package:bluetick/screens/sign_up/new_password.dart';
import 'package:bluetick/screens/sign_up/signup.dart';
import 'package:flutter/material.dart';

import '../../../screens/home/sub_home/subHome.dart';

class AppRouter {
  static const String adminBroadcastScreen = 'adminBroadcastScreen';
  static const String chatScreen = 'chatScreen';
  static const String groupChatScreen = 'groupChatScreen';

  ///co-workers section
  static const String coWorkersHomeTab = 'coWorkersHomeTab';
  static const String coWorkersAddToCall = 'coWorkersAddToCall';
  static const String coWorkerCreateGroup = 'coWorkerCreateGroup';
  static const String coWorkers = 'coWorkers';
  static const String coWorkersCallScreen = 'coWorkersCallScreen';
  static const String coWorkersDrawer = 'coWorkersDrawer';
  static const String coWorkersHome = 'coWorkersHome';
  static const String staffHomePage = 'staffHomePage';
  static const String coWorkersProfile = 'coWorkersProfile';

  ///ADMIN SECTION

  ///sub_home section
  static const String addAGroup = 'addAGroup';
  static const String createBroadCast = 'createBroadCast';
  static const String liveLocation = 'liveLocation';
  static const String messageList = 'messageList';
  static const String personalProfile = 'personalProfile';
  static const String staffProfileAdmin = 'staffProfileAdmin';

  ///Invitation section
  static const String invitationScreen = 'invitationScreen';
  static const String invitationB1 = 'invitationB1';
  static const String invitationSent = 'invitationSent';

  ///main home
  static const String broadCast = 'broadCast';
  //static const String callScreen = 'callScreen';
  static const String contactUsScreen = 'contactUsScreen';
  static const String groupCall = 'groupCall';
  static const String helpCenter = 'helpCenter';
  static const String home = 'home';
  static const String homeDrawer = 'homeDrawer';
  static const String homeTabs = 'homeTabs';
  static const String messages = 'messages';
  static const String notification = 'notification';
  static const String todoScreen = 'todoScreen';
  static const String about = 'about';
  static const String notificationSettings = 'notificationSettings';

  ///sign in
  static const String login = 'login';

  ///sign up

  static const String adminSignUp = 'adminSignUp';
  static const String emailVerification = 'emailVerification';
  static const String forgotPassword = 'forgotPassword';
  static const String invitationLink = 'invitationLink';
  static const String onBoardingAnimation = 'onBoardingAnimation';
  static const String splashScreen = 'splashScreen';
  static const String staffSignUp = 'staffSignUp';
  static const String resetPassword = 'resetPassword';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {

      ///ADMIN SECTION
      ///sign up
      case AppRouter.splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case AppRouter.staffSignUp:
        return MaterialPageRoute(builder: (context) => const StaffSignUp());
      case AppRouter.adminSignUp:
        return MaterialPageRoute(builder: (context) => AdminSignUp());
      case AppRouter.onBoardingAnimation:
        return MaterialPageRoute(
            builder: (context) => const OnBoardingScreenAnimation());
      case AppRouter.invitationLink:
        return MaterialPageRoute(builder: (context) => InvitationLink());
      case AppRouter.forgotPassword:
        return MaterialPageRoute(builder: (context) => ForgotPassword());
      case AppRouter.emailVerification:
        return MaterialPageRoute(builder: (context) => EmailVerification());
      case AppRouter.resetPassword:
        return MaterialPageRoute(builder: (context) => NewPassword());

      ///login
      case AppRouter.login:
        return MaterialPageRoute(builder: (context) => LoginScreen());

      ///main home
      case AppRouter.broadCast:
        return MaterialPageRoute(builder: (context) => const BroadcastScreen());
      case AppRouter.contactUsScreen:
        return MaterialPageRoute(builder: (context) => const ContactUs());
      case AppRouter.groupChatScreen:
        return MaterialPageRoute(builder: (context) => const GroupChatScreen());
      case AppRouter.helpCenter:
        return MaterialPageRoute(builder: (context) => const HelpCenter());
      case AppRouter.home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case AppRouter.homeDrawer:
        return MaterialPageRoute(builder: (context) => const HomeDrawer());
      case AppRouter.homeTabs:
        return MaterialPageRoute(builder: (context) => const HomeTab());
      case AppRouter.messages:
        return MaterialPageRoute(builder: (context) => const Messages());
      case AppRouter.notification:
        return MaterialPageRoute(builder: (context) => const Notifications());
      case AppRouter.todoScreen:
        return MaterialPageRoute(builder: (context) => const TodoScreen());
      case AppRouter.groupCall:
        return MaterialPageRoute(builder: (context) => const GroupCallScreen());
      case AppRouter.about:
        return MaterialPageRoute(builder: (context) => const About());
      case AppRouter.notificationSettings:
        return MaterialPageRoute(
            builder: (context) => const NotificationSettingsStaff());

      ///Invitation screens
      case AppRouter.invitationScreen:
        return MaterialPageRoute(
            builder: (context) => const InvitationScreen());
      case AppRouter.invitationB1:
        return MaterialPageRoute(builder: (context) => const InvitationB1());
      case AppRouter.invitationSent:
        return MaterialPageRoute(builder: (context) => const InvitationSent());

      ///Co workers
      case AppRouter.coWorkersHomeTab:
        return MaterialPageRoute(builder: (context) => const CoWorkerHomeTab());
      case AppRouter.coWorkersAddToCall:
        return MaterialPageRoute(builder: (context) => const GroupCallScreen());
      case AppRouter.coWorkerCreateGroup:
        return MaterialPageRoute(builder: (context) => const HelpCenter());
      case AppRouter.coWorkersProfile:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case AppRouter.coWorkers:
        return MaterialPageRoute(builder: (context) => const HomeDrawer());
      case AppRouter.coWorkersCallScreen:
        return MaterialPageRoute(builder: (context) => const HomeTab());
      case AppRouter.coWorkersDrawer:
        return MaterialPageRoute(builder: (context) => const Messages());
      case AppRouter.coWorkersHome:
        return MaterialPageRoute(builder: (context) => const Notifications());
      case AppRouter.staffHomePage:
        return MaterialPageRoute(builder: (context) => const TodoScreen());

      ///GroupChats
      case AppRouter.chatScreen:
        return MaterialPageRoute(builder: (context) => const Chatscreen());

      case AppRouter.adminBroadcastScreen:
        return MaterialPageRoute(
            builder: (context) => const AdminBroadcastScreen());

      ///sub_home section

      case AppRouter.addAGroup:
        return MaterialPageRoute(builder: (context) => const AddGroup());
      case AppRouter.createBroadCast:
        return MaterialPageRoute(builder: (context) => const CreateBroadcast());
      case AppRouter.liveLocation:
        return MaterialPageRoute(builder: (context) => const liveLocationMap());
      case AppRouter.messageList:
        return MaterialPageRoute(builder: (context) => const MessageList());
      case AppRouter.personalProfile:
        return MaterialPageRoute(builder: (context) => const PersonalProfile());
      case AppRouter.staffProfileAdmin:
        return MaterialPageRoute(builder: (context) => StaffProfileAdmin());

      default:
        return MaterialPageRoute(
          builder: (context) => SizedBox(
            child: Text('Invalid Routes'),
          ),
        );
    }
  }

  static Map<String, Widget Function(BuildContext)> routes = {
    ///Sign up

    AppRouter.splashScreen: (context) => const SplashScreen(),
    AppRouter.staffSignUp: (context) => const StaffSignUp(),
    AppRouter.adminSignUp: (context) => AdminSignUp(),
    AppRouter.onBoardingAnimation: (context) =>
        const OnBoardingScreenAnimation(),
    AppRouter.invitationLink: (context) => InvitationLink(),
    AppRouter.forgotPassword: (context) => ForgotPassword(),
    AppRouter.emailVerification: (context) => EmailVerification(),
    AppRouter.resetPassword: (context) => NewPassword(),

    ///login
    AppRouter.login: (context) => LoginScreen(),

    ///main home
    AppRouter.broadCast: (context) => const BroadcastScreen(),

    AppRouter.contactUsScreen: (context) => const ContactUs(),
    AppRouter.groupChatScreen: (context) => const GroupChatScreen(),
    AppRouter.helpCenter: (context) => const HelpCenter(),
    AppRouter.home: (context) => const HomeScreen(),
    AppRouter.homeDrawer: (context) => const HomeDrawer(),
    AppRouter.homeTabs: (context) => const HomeTab(),
    AppRouter.messages: (context) => const Messages(),
    AppRouter.notification: (context) => const Notifications(),
    AppRouter.todoScreen: (context) => const TodoScreen(),
    AppRouter.about: (context) => const About(),
    AppRouter.notificationSettings: (context) =>
        const NotificationSettingsStaff(),

    ///Invitation screens
    AppRouter.invitationScreen: (context) => const InvitationScreen(),
    AppRouter.invitationB1: (context) => const InvitationB1(),
    AppRouter.invitationSent: (context) => const InvitationSent(),

    ///Co workers
    AppRouter.coWorkersHomeTab: (context) => const CoWorkerHomeTab(),
    AppRouter.coWorkersAddToCall: (context) => const GroupCallScreen(),
    AppRouter.coWorkerCreateGroup: (context) => const HelpCenter(),
    AppRouter.coWorkersProfile: (context) => const HomeScreen(),
    AppRouter.coWorkers: (context) => const HomeDrawer(),
    AppRouter.coWorkersCallScreen: (context) => const CoWorkersCallScreen(),
    AppRouter.coWorkersDrawer: (context) => const Messages(),
    AppRouter.coWorkersHome: (context) => const Notifications(),
    AppRouter.staffHomePage: (context) => const TodoScreen(),

    ///GroupChats
    AppRouter.chatScreen: (context) => const Chatscreen(),
    AppRouter.adminBroadcastScreen: (context) => const AdminBroadcastScreen(),

    AppRouter.addAGroup: (context) => const AddGroup(),
    AppRouter.createBroadCast: (context) => const CreateBroadcast(),
    AppRouter.liveLocation: (context) => const liveLocationMap(),
    AppRouter.messageList: (context) => const MessageList(),
    AppRouter.personalProfile: (context) => const PersonalProfile(),
    AppRouter.staffProfileAdmin: (context) => StaffProfileAdmin(),
  };
}
