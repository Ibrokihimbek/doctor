import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:doctor_app/cubits/connectivity/connectivity_cubit.dart';
import 'package:doctor_app/cubits/tab/tab_cubit.dart';
import 'package:doctor_app/ui/tab_box/appointment/appointment_screen.dart';
import 'package:doctor_app/ui/tab_box/history/history_screen.dart';
import 'package:doctor_app/ui/tab_box/home/home_screen.dart';
import 'package:doctor_app/ui/tab_box/profile/profile_screen.dart';
import 'package:doctor_app/utils/color.dart';
import 'package:doctor_app/utils/constants.dart';
import 'package:doctor_app/utils/custom_packages/bottom_navy_bar.dart';
import 'package:doctor_app/utils/icons/action/action.dart';
import 'package:doctor_app/utils/icons/editor/editor.dart';
import 'package:doctor_app/utils/icons/notification/notification.dart';
import 'package:doctor_app/utils/icons/social/social.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class TabBox extends StatefulWidget {
  TabBox({Key? key}) : super(key: key);

  @override
  State<TabBox> createState() => _TabBoxState();
}

class _TabBoxState extends State<TabBox> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  List<Widget> screens = [];

  @override
  void initState() {
    screens = [
      const HomeScreen(),
      const AppointmentScreen(),
      const OpenDataScreen(),
      ProfileScreen()
    ];
    super.initState();
  }

  _init() async {
    print("INTERNET TURNED ON CALL ANY API");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      //drawer: const CustomDrawer(),
      body: BlocBuilder<TabCubit, TabsState>(
        builder: (cubit, state) {
          return Scaffold(
            body: screens[state.currentPage],
            bottomNavigationBar: BottomNavigationBar(
                currentIndex: state.currentPage,
                selectedItemColor: const Color(0xff2972FE),
                unselectedItemColor: Colors.grey.withOpacity(0.6),
                onTap: (value) =>
                    context.read<TabCubit>().changeTabState(value),
                selectedLabelStyle: const TextStyle(color: Colors.grey),
                unselectedLabelStyle: const TextStyle(color: Colors.grey),
                items: [
                  const BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home,
                      size: 34,
                    ),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        ActionIcons.meeting,
                        width: 30,
                        height: 30,
                        color: state.currentPage == 1
                            ? Color(0xff2972FE)
                            : Colors.grey,
                      ),
                      label: 'Appointment'),
                  const BottomNavigationBarItem(
                      icon: Icon(
                        Icons.info,
                        size: 34,
                      ),
                      label: "Info"),
                  const BottomNavigationBarItem(
                      icon: Icon(
                        Icons.person,
                        size: 34,
                      ),
                      label: "Profile"),
                ]),
          );
        },
      ),
    );
  }
}
