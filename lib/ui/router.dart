import 'package:doctor_app/ui/add_review/add_review_screen.dart';
import 'package:doctor_app/ui/appointment_area/sub_screen/call_appointment/call_end_screen.dart';
import 'package:doctor_app/ui/appointment_area/sub_screen/message_appointment/message_appointment_screen.dart';
import 'package:doctor_app/ui/doctors_search/doctors_search_screen.dart';
import 'package:doctor_app/ui/favourites/favourites_screen.dart';
import 'package:doctor_app/ui/my_appointment_detail/my_appointment_detail_screen.dart';
import 'package:doctor_app/ui/no_internet/no_internet_screen.dart';
import 'package:doctor_app/ui/on_boarding/signin_or_signup_page.dart';
import 'package:doctor_app/ui/reviews/reviews_screen.dart';
import 'package:doctor_app/ui/specialist_deatil_doctor/specialist_detail_screen.dart';
import 'package:doctor_app/ui/splash/splash_screen.dart';
import 'package:doctor_app/ui/tab_box/history/history_screen.dart';
import 'package:doctor_app/ui/tab_box/profile/profile_screen.dart';
import 'package:doctor_app/ui/tab_box/profile/sub_screens/language/langeage_screen.dart';
import 'package:doctor_app/ui/tab_box/profile/sub_screens/notification/notification_settings_screen.dart';
import 'package:doctor_app/ui/tab_box/profile/sub_screens/profile_edit_screen.dart';
import 'package:doctor_app/ui/tab_box/profile/sub_screens/security/security_settings_screen.dart';
import 'package:doctor_app/ui/tab_box/tab_box.dart';
import 'package:doctor_app/ui/top_doctors/top_doctors_screen.dart';
import 'package:flutter/material.dart';
import '../data/models/doctor/doctor_model.dart';
import 'book_appointment/book_appointment_screen.dart';
import 'book_appointment/sub_screens/patient_details/booking_patient_details.dart';
import 'doctor_details/doctor_detail_screen.dart';

import 'tab_box/history/sub_screen/calls_history_screen.dart';
import 'tab_box/history/sub_screen/messages_history_screen.dart';
import 'package:doctor_app/ui/notification/notification_screen.dart';
import 'package:doctor_app/ui/specialists/specialists_screen.dart';
import 'package:doctor_app/utils/constants.dart';
import 'package:doctor_app/ui/auth/login/login_page.dart';

import 'on_boarding/on_boarding_screen.dart';
import 'tab_box/profile/sub_screens/appearance/appearance_settings_screen.dart';
import 'auth/sign_up/signup_page.dart';
import 'tab_box/profile/sub_screens/help/help_screen.dart';

class MyRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case onBoarding:
        return navigateTo(OnBoardingScreen());
      case specialDoctor:
        final args = settings.arguments as Map<String, dynamic>;
        return navigateTo(SpecialistDetailScreen(specialistId: args['specialistId'],specialName: args ['specialName'],));
      case noInternetRoute:
        return navigateTo(
            NoInternetScreen(voidCallback: settings.arguments as VoidCallback));
      case tabBox:
        return navigateTo(TabBox());
      case splashPage:
        return navigateTo(SplashScreen());
      case signInOrSignUp:
        return navigateTo(SignInOrSignUpScreen());
      case loginPage:
        return navigateTo(SignInPage());
      case signUpPage:
        return navigateTo(SignUpPage());
      // case onLastRoute:
      //   return navigateTo(OnLastScreen());
      case notificationRoute:
        return navigateTo(NotificationsPage());
      case languageRoute:
        return navigateTo(LanguageScreen());
      case favouritesRoute:
        return navigateTo(FavouritesScreen());
      case topDoctorsRoute:
        return navigateTo(TopDoctorsScreen());
      case doctorsSearchRoute:
        return navigateTo(DoctorsSearchScreen());
      case specialistsRoute:
        return navigateTo(SpecialistsScreen());
      case topDoctorsRoute:
        return navigateTo(SpecialistsScreen());
      case doctorDetailRoute:
        return navigateTo(DoctorDetailScreen(
          doctorModel: settings.arguments as DoctorModel,
        ));
      case reviewsRoute:
        final args = settings.arguments as Map<String, dynamic>;
        return navigateTo(ReviewsScreen(reviews: args["reviews"]));
      // case bookAppointmentRoute:
      //   return navigateTo(BookAppointmentScreen(
      //     doctorModel: settings.arguments as DoctorModel,
      //     weekDay: settings.arguments as String,
      //   ));
      case bookAppointmentRoute:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => BookAppointmentScreen(
            selected: args["selected"],
            workday: args["workday"],
          ),
        );

      case bookPatientDetailsRoute:
        return navigateTo(BookingPatientDetails());
      // case bookPaymentRoute:
      //   return navigateTo(BookingPaymentScreen());
      case profileEditRoute:
        final args = settings.arguments as Map<String, dynamic>;
        return navigateTo(
          ProfileEditScreen(
            userModel: args['userModel'],
          ),
        );
      case profiletRoute:
        return navigateTo(ProfileScreen());
      case myAppointmentDetailRoute:
        final args = settings.arguments as Map<String, dynamic>;

        return MaterialPageRoute(
          builder: (_) => MyAppointmentDetailScreen(
            appointmentModel: args['doctorInfo'],
          ),
        );
      case messageAppointmentRoute:
        final args = settings.arguments as Map<String, dynamic>;
        return navigateTo(MessageAppointmentScreen(
          model: args['info'],
        ));
      //   case callAppointmentRoute:
      // final args = settings.arguments as Map<String, dynamic>;

      //     return navigateTo(CallAppointmentScreen(
      //       appointmentModel: args["appointmentModel"],
      //     ));
      case callEndRoute:
        final args = settings.arguments as Map<String, dynamic>;

        return MaterialPageRoute(
            builder: (_) => CallEndScreen(
                  model: args['info'],
                ));
      // case videoCallAppointmentRoute:
      //   return navigateTo(VideoCallAppointmentScreen());
      case addReviewRoute:
        final args = settings.arguments as Map<String, dynamic>;

        return MaterialPageRoute(
            builder: (_) => AddReviewScreen(
                  model: args['info'],
                ));

      case helpRoute:
        return navigateTo(HelpScreen());
      // case faqRoute:
      //   return navigateTo(FAQScreen());
      // case contactUsRoute:
      //   return navigateTo(ContactUs());
      // case privacyPolicyRoute:
      //   return navigateTo(PrivacyPolicyScreen());
      // case termsOfConditionsRoute:
      //   return navigateTo(TermsOfConditions());
      case settingsNotif:
        return navigateTo(NotificationSettingsScreen());
      case settingsSecure:
        return navigateTo(SecuritySettingsScreen());
      case settingsAppear:
        return navigateTo(AppearanceSettingsScreen());
      // case appearanceRoute:
      //   return navigateTo(AppearanceScreen());
      case historyMessageDetailRoute:
        return navigateTo(MessagesHistoryDetailScreen());
      case historyRoute:
        return navigateTo(OpenDataScreen());
      case historyCallDetailRoute:
        return navigateTo(CallHistoryDetailScreen());
      default:
        return navigateTo(
          Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}

MaterialPageRoute navigateTo(Widget widget) => MaterialPageRoute(
      builder: (context) => widget,
    );
