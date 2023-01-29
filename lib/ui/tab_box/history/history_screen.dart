// import 'package:doctor_app/bloc/appointments_history/appointments_history_cubit.dart';
// import 'package:doctor_app/data/models/appointment/appointment_model.dart';
// import 'package:doctor_app/ui/tab_box/history/widgets/call_history_item.dart';
// import 'package:doctor_app/ui/tab_box/history/widgets/chat_history_item.dart';
// import 'package:doctor_app/ui/widgets/appbar_by_logo.dart';
// import 'package:doctor_app/ui/widgets/custom_icon_button.dart';
// import 'package:doctor_app/ui/widgets/search_button.dart';
// import 'package:doctor_app/utils/color.dart';
// import 'package:doctor_app/utils/constants.dart';
// import 'package:doctor_app/utils/icons/app_icons.dart';
// import 'package:doctor_app/utils/icons/content/content.dart';
// import 'package:doctor_app/utils/icons/image/image.dart';
// import 'package:doctor_app/utils/style.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:keyboard_dismisser/keyboard_dismisser.dart';
//
// class HistoryPage extends StatefulWidget {
//   const HistoryPage({super.key});
//
//   @override
//   State<HistoryPage> createState() => _HistoryPageState();
// }
//
// class _HistoryPageState extends State<HistoryPage> {
//   int pageIndex = 0;
//   List<String> listItem = [
//     "messaging",
//     "voice_call",
//   ];
//   String isChanged = '';
//   String isChangedVoicecall = '';
//   List<AppointmentModel> messaging = [];
//   List<AppointmentModel> voiceCall = [];
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<AppointmentsHistoryCubit, AppointmentsHistoryState>(
//       builder: (context, state) {
//         if (state is LoadHistoryInSuccess) {
//           return KeyboardDismisser(
//             child: Scaffold(
//               backgroundColor: MyColors.white,
//               appBar: AppbarByLogo(
//                 logo: AppIcons.logo,
//                 title: 'history'.tr(),
//                 onAddTap: () {
//                   Navigator.pushNamed(context, topDoctorsRoute);
//                 },
//                 rightLogo: ImageIcons.controlPoint,
//               ),
//               body: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 24).r,
//                 child: Column(
//                   children: [
//                     SizedBox(
//                       width: double.infinity,
//                       height: 55.h,
//                       child: ListView.builder(
//                         scrollDirection: Axis.horizontal,
//                         physics: const BouncingScrollPhysics(),
//                         itemCount: listItem.length,
//                         shrinkWrap: true,
//                         itemBuilder: ((context, index) {
//                           return Padding(
//                             padding: EdgeInsets.only(top: 12.h, left: 12.w).r,
//                             child: InkWell(
//                               borderRadius: BorderRadius.circular(24.r),
//                               onTap: () {
//                                 FocusManager.instance.primaryFocus?.unfocus();
//                                 setState(() {
//                                   pageIndex = index;
//                                 });
//                               },
//                               child: Container(
//                                 width: 119.w,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(24.r),
//                                   color: pageIndex == index
//                                       ? MyColors.primary
//                                       : MyColors.white,
//                                   border: Border.all(
//                                     color: MyColors.primary,
//                                     width: 2.r,
//                                   ),
//                                 ),
//                                 child: Center(
//                                   child: Text(
//                                     listItem[index].tr(),
//                                     style: MyTextStyle.sfProRegular.copyWith(
//                                       fontSize: 18.sp,
//                                       color: pageIndex == index
//                                           ? MyColors.white
//                                           : MyColors.primary,
//                                     ),
//                                     textAlign: TextAlign.center,
//                                   ),
//
//                                 ),
//                               ),
//                             ),
//                           );
//                         }),
//                       ),
//                     ),
//                     SizedBox(height: 24.h),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         SearchTextField(
//                           valueChange: (value) {
//                             if (pageIndex == 0) {
//                               isChanged = value;
//                               messaging = state.appointments
//                                   .where(
//                                     (element) => element.doctorName
//                                         .toLowerCase()
//                                         .startsWith(
//                                           value.toString().toLowerCase(),
//                                         ),
//                                   )
//                                   .toList();
//                               setState(
//                                 () {
//                                   messaging = messaging
//                                       .where((element) =>
//                                           element.type == 'messaging')
//                                       .toList();
//                                 },
//                               );
//                             } else {
//                               isChangedVoicecall = value;
//                               voiceCall = state.appointments
//                                   .where(
//                                     (element) => element.doctorName
//                                         .toLowerCase()
//                                         .startsWith(
//                                           value.toString().toLowerCase(),
//                                         ),
//                                   )
//                                   .toList();
//                               setState(
//                                 () {
//                                   voiceCall = voiceCall
//                                       .where((element) =>
//                                           element.type == 'voice_call')
//                                       .toList();
//                                 },
//                               );
//                             }
//                           },
//                         ),
//                         CustomIconButton(
//                           iconPath: ContentIcons.filterList,
//                           onTap: () {},
//                         )
//                       ],
//                     ),
//                     Expanded(
//                       child: pageIndex == 0
//                           ? HistoryMessagingItem(
//                               appointments: isChanged.isNotEmpty
//                                   ? messaging
//                                   : state.appointments
//                                       .where((element) =>
//                                           element.type == 'messaging')
//                                       .toList(),
//                             )
//                           : VoiceCallItem(
//                               appointments: isChangedVoicecall.isNotEmpty
//                                   ? voiceCall
//                                   : state.appointments
//                                       .where((element) =>
//                                           element.type == 'voice_call')
//                                       .toList(),
//                             ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         }
//         return const SizedBox();
//       },
//     );
//   }
// }
import 'package:doctor_app/ui/tab_box/history/cubit/open_data_cubit.dart';
import 'package:doctor_app/ui/tab_box/history/cubit/open_data_state.dart';
import 'package:doctor_app/ui/tab_box/home/widgets/home_appbar.dart';
import 'package:doctor_app/utils/icons/file/file.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OpenDataScreen extends StatelessWidget {
  const OpenDataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: HomeAppbar(
        logo: FileIcons.logo,
        title: "Open Data Ma'lumotlari",
        onNotificationTap: () {
          // Navigator.pushNamed(context, notificationRoute);
        },
      ),
      body: BlocBuilder<OpenDataCubit,OpenDataCubitState>(builder: (context,state){

        if(state is LoadInProgress){
          return Center(child: CircularProgressIndicator(),);
        }else if (state is LoadInSuccess){
          return
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
              children: [
                ...List.generate(state.infoOpenData.result!.data!.length, (index) {
                  var item = state.infoOpenData.result!.data![index];

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      height: 110.h,
                      decoration: BoxDecoration(
                          color:  Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xff121212).withOpacity(0.12),
                              blurRadius: 6,
                            )
                          ],
                          borderRadius: BorderRadius.circular(16.r)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 10.h,),
                          Center(child: Text( item.hududlar.toString(),style: TextStyle(color: Color(0xff121212),fontSize: 22.sp,fontWeight: FontWeight.w600,),)),
                          SizedBox(height: 10.h,),
                          Text( item.i2020Yil.toString(),style: TextStyle(color: Color(0xff121212).withOpacity(0.4),fontSize: 16.sp,fontWeight: FontWeight.w400,),),

                        ],
                      ),
                    ),
                  );
                }),
              ],
          ),
            ) ;
        }else if (state is LoadInFailure){
          return Center(child: Text(state.error,style: TextStyle(color: Colors.red,fontSize: 24),),);
        }

        return const SizedBox();
      }),
    );
  }
}
