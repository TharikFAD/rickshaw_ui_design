import 'package:flutter/material.dart';
import 'package:meter_app/Pages/HomePage/home_page.dart';
import 'package:meter_app/Pages/LoginPage/LoginPageCont/otp_page.dart';
import 'package:meter_app/Pages/SplashScreenPage/splash_screen.dart';
import 'package:meter_app/Pages/loginPage/LoginPageCont/username_page.dart';
import 'package:meter_app/pages/bookingsPage/booking_page.dart';
import 'package:meter_app/pages/communityPage/communityPage.dart';
import 'package:meter_app/pages/communityPage/widgets/community_members.dart';
import 'package:meter_app/pages/complaintPage/compaintPage.dart';
import 'package:meter_app/pages/complaintPage/compaintPageCont/addComplaintPage.dart';
import 'package:meter_app/pages/createCommunityPage/create_community_page.dart';
import 'package:meter_app/pages/fareSettingsPage/addFarePage.dart';
import 'package:meter_app/pages/fareSettingsPage/editFarePage.dart';
import 'package:meter_app/pages/fareSettingsPage/fareSettingPage.dart';
import 'package:meter_app/pages/historyPage/history_page.dart';
import 'package:meter_app/pages/homePage/homePageCont/completeRide.dart';
import 'package:meter_app/pages/homePage/homePageCont/riderInfo.dart';
import 'package:meter_app/pages/verifyMobilePage/verify_mobile.dart';
import 'package:meter_app/pages/kycPage/kyc_page.dart';
import 'package:meter_app/pages/settingsPage/settingsPage.dart';
import 'package:meter_app/routes/route_name.dart';

import '../pages/LoginPage/login_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    final arg = routeSettings.arguments;
    return PageRouteBuilder(
      settings: routeSettings,
      transitionsBuilder: (_, animation, __, child) => FadeTransition(
        opacity: animation,
        child: child,
      ),
      transitionDuration: const Duration(milliseconds: 100),
      pageBuilder: (_, __, ___) {
        switch (routeSettings.name) {
          case splashScreenRoute:
            return const SplashScreen();
          case loginScreenRoute:
            return LoginPage();
          case enterOTPScreenRoute:
            return const OtpPage();
          case homeScreenRoute:
            return const HomePage();
          case enterUserNameScreenRoute:
            return const EnterUserNamePage();
          case historyScreenRoute:
            return const HistoryPage();
          case complaintScreenRoute:
            return const ComplaintPage();
          case fareSettingScreenRoute:
            return const FareSettingsPage();
          case settingScreenRoute:
            return const Settingspage();
          case communityScreenRoute:
            return const CommunityPage();
          case memberScreenRoute:
            return const CommunityMemberList();
          case completeRideScreenRoute:
            return const CompleteRidePage();
          case riderInfoScreenRoute:
            return const RiderInfoPage();
          case addFareScreenRoute:
            return const AddFarePage();
          case bookingScreenRoute:
            return const BookingsPage();
          case addCompaintScreenRoute:
            return const AddComplaintPage();
          case editFareScreenRoute:
            return const EditFarePage();
          case verifyMobileScreenRoute:
            return const JoinPage();
          case kycScreenRoute:
            return const KycPage();
          case createCommunityScreenRoute:
            return const CreateCommunity();

          default:
            return LoginPage();
        }
      },
    );
  }
}
