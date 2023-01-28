import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_app/bloc/add_appointments_bloc/add_appointments_bloc.dart';
import 'package:doctor_app/bloc/appointments_history/appointments_history_cubit.dart';
import 'package:doctor_app/bloc/auth/auth_bloc.dart';
import 'package:doctor_app/bloc/doctors/doctors_bloc.dart';
import 'package:doctor_app/bloc/get_appointements_cubit/get_appointments_bloc.dart';
import 'package:doctor_app/bloc/reviews/reviews_bloc.dart';
import 'package:doctor_app/bloc/user/user_bloc.dart';
import 'package:doctor_app/cubits/connectivity/connectivity_cubit.dart';
import 'package:doctor_app/cubits/speciality/speciality_cubit.dart';
import 'package:doctor_app/cubits/tab/tab_cubit.dart';
import 'package:doctor_app/data/repositories/appointment_repository.dart';
import 'package:doctor_app/data/repositories/auth_repository.dart';
import 'package:doctor_app/data/repositories/search_doctors_repository.dart';
import 'package:doctor_app/data/repositories/user_repository.dart';
import 'package:doctor_app/ui/auth/bloc/validate_bloc.dart';
import 'package:doctor_app/data/repositories/doctors_repository.dart';
import 'package:doctor_app/data/repositories/speciality_repository.dart';
import 'package:doctor_app/ui/doctors_search/cubit/doctors_search_cubit.dart';
import 'package:doctor_app/data/repositories/review_repository.dart';
import 'package:doctor_app/ui/add_review/bloc/add_review_bloc.dart';
import 'package:doctor_app/ui/router.dart';
import 'package:doctor_app/ui/tab_box/profile/sub_screens/appearance/bloc/theme_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/constants.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
            create: (context) =>
                UserRepository(firebaseFirestore: FirebaseFirestore.instance),
          ),
          RepositoryProvider(
            create: (context) => AppointmentsRepository(
                firebaseFirestore: FirebaseFirestore.instance),
          ),
          RepositoryProvider(
              create: (context) =>
                  SpecialityRepository(firestore: FirebaseFirestore.instance)),
          RepositoryProvider(
              create: (context) => DoctorRepository(
                  firebaseFirestore: FirebaseFirestore.instance)),
          RepositoryProvider(
            create: (context) => AuthRepository(
                firebaseAuth: FirebaseAuth.instance,
                firebaseFireStore: FirebaseFirestore.instance),
          ),
          RepositoryProvider(
            create: (context) => DoctorSearchRepository(
                firebaseFirestore: FirebaseFirestore.instance),
          ),
          RepositoryProvider(
            create: (context) =>
                ReviewRepository(firebaseFirestore: FirebaseFirestore.instance),
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (context) => GetAppointmentsCubit(
                      context.read<AppointmentsRepository>(),
                    )),
            BlocProvider(
                create: (context) => SpecialityCubit(
                    specialityRepository:
                        context.read<SpecialityRepository>())),
            BlocProvider(
                create: (context) => SingleAppointmentsBloc(
                    appointmentsRepository:
                        context.read<AppointmentsRepository>())),
            BlocProvider(create: (context) => TabCubit()),
            BlocProvider(create: (context) => ConnectivityCubit()),
            BlocProvider(
              create: (context) => AuthBloc(context.read<AuthRepository>()),
            ),
            BlocProvider(
              create: (context) => ValidateBloc(),
            ),
            BlocProvider(
                create: (context) =>
                    DoctorsBloc(context.read<DoctorRepository>())),
            BlocProvider(
                create: (context) =>
                    ReviewsBloc(context.read<ReviewRepository>())),
            BlocProvider(
                create: (context) =>
                    UserBloc(userRepository: context.read<UserRepository>())),
            BlocProvider(
              create: (context) => AddReviewBloc(
                context.read<ReviewRepository>(),
              ),
            ),
            BlocProvider(
              create: (context) => AppointmentsHistoryCubit(
                context.read<AppointmentsRepository>(),
              ),
            ),
            BlocProvider(
              create: (context) => DoctorsSearchCubit(
                context.read<DoctorSearchRepository>(),
              ),
            ),
            BlocProvider(create: (context) => ThemeCubit()),
          ],
          child: MyApp(),
        ));
  }
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
        builder: (light, dark) => MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          title: 'Doctor Uz',
          debugShowCheckedModeBanner: false,
          initialRoute: splashPage,
          onGenerateRoute: MyRouter.generateRoute,
        ),

    );
  }
}
