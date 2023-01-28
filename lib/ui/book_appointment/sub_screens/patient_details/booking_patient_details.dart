import 'package:doctor_app/bloc/add_appointments_bloc/add_appointments_bloc.dart';
import 'package:doctor_app/bloc/add_appointments_bloc/add_appointments_event.dart';
import 'package:doctor_app/ui/book_appointment/sub_screens/patient_details/widgets/age_widget.dart';
import 'package:doctor_app/ui/book_appointment/sub_screens/patient_details/widgets/booking_patient_item.dart';
import 'package:doctor_app/ui/book_appointment/sub_screens/patient_details/widgets/problem_textfield.dart';
import 'package:doctor_app/ui/widgets/custom_appbar.dart';
import 'package:doctor_app/ui/widgets/global_button.dart';
import 'package:doctor_app/ui/widgets/text_field.dart';
import 'package:doctor_app/utils/color.dart';
import 'package:doctor_app/utils/icons/alert/alert.dart';
import 'package:doctor_app/utils/icons/app_icons.dart';
import 'package:doctor_app/utils/style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../payment/widgets/success_booking_dialog.dart';

class BookingPatientDetails extends StatefulWidget {
  const BookingPatientDetails({Key? key}) : super(key: key);

  @override
  State<BookingPatientDetails> createState() => _BookingPatientDetailsState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
int selectAge = 5;
final TextEditingController _fullNameController = TextEditingController();
final TextEditingController _phoneController = TextEditingController();
final TextEditingController _genderController = TextEditingController();
final TextEditingController _problemController = TextEditingController();
late MaskTextInputFormatter phoneMaskInputFormatter;
final FocusNode cardFocusNode = FocusNode();

String dropdownValue = 'Male';
String phoneNumber = '';

class _BookingPatientDetailsState extends State<BookingPatientDetails> {
  @override
  void initState() {
    phoneMaskInputFormatter = MaskTextInputFormatter(
      mask: '### ## ### ## ##',
      filter: {
        '#': RegExp(r'[0-9]'),
      },
    );
    _phoneController.text = phoneMaskInputFormatter.maskText('');
    super.initState();
  }

  @override
  void dispose() {
    cardFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List ages = [
      "10+",
      "20+",
      "30+",
      "40+",
      "50+",
    ];
    return Scaffold(
      appBar: CustomAppBar(
        title: "patient_details".tr(),
        widget: const SizedBox(),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Stack(
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: MyColors.white,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 24).r,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 14, left: 14).r,
                          child: MyTextField(
                            text: "full_name",
                            onChanged: ((val) {}),
                            controller: _fullNameController,
                            validator: ((val) {
                              return null;
                            }),
                            inputFormatters: const [],
                            isDone: false,
                            suffixIcon: SvgPicture.asset(
                              AlertIcons.add,
                              color: MyColors.white,
                            ),
                            textInputType: TextInputType.name,
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        fieldsName("select_your_age_range"),
                        SizedBox(
                          height: 60.h,
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                              itemCount: 5,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectAge = index;
                                      });
                                      debugPrint(
                                        ages[selectAge],
                                      );
                                    },
                                    child: AgeWidget(
                                      context: context,
                                      index: index,
                                      colorText: selectAge == index
                                          ? MyColors.white
                                          : MyColors.actionPrimaryDefault,
                                      colorContainer: selectAge == index
                                          ? MyColors.actionPrimaryDefault
                                          : MyColors.white,
                                    ));
                              }),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        PhoneInputComponent(
                          onChanged: (String v) {
                            phoneNumber =
                                "+998${v.removeWhitespace().removeTire()}";
                          },
                          initialValue: '',
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        fieldsName("Gender"),
                        MyDropDown(),
                        SizedBox(
                          height: 30.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 14, left: 14),
                          child: ProblemTextField(
                            text: "write_your_problem",
                            onChanged: ((val) {}),
                            controller: _problemController,
                            validator: ((val) {
                              return null;
                            }),
                            inputFormatters: const [],
                            isDone: false,
                            suffixIcon: SvgPicture.asset(
                              AlertIcons.add,
                              color: MyColors.white,
                            ),
                            textInputType: TextInputType.name,
                          ),
                        ),
                        SizedBox(
                          height: 90.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.8),
                GlobalButton(
                  buttonText: "next",
                  isActive: checkActive(),
                  onTap: (() {
                    if (checkActive()) {
                      BlocProvider.of<SingleAppointmentsBloc>(context).add(
                        UpdateBookingPatientDetailsScreen(
                          fullName: _fullNameController.text,
                          age: ages[selectAge],
                          phoneNumber: phoneNumber,
                          gender: dropdownValue,
                          problem: _problemController.text,
                          createdAd: DateTime.now().toString(),
                        ),
                      );
                      BlocProvider.of<SingleAppointmentsBloc>(context)
                          .add(AddAppointment());
                    }
                    SuccessDialog(
                        context: context,
                        imagePath: AppIcons.message,
                        desc: "Your appointment booking successfully  \n    "
                            "   completed. Dr. Jenny Wilson will    \n               "
                            "       Message you soon.");
                  }),
                  isSmall: false,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  SizedBox MyDropDown() {
    return SizedBox(
      height: 95.h,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: DropdownButtonFormField(
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyColors.neutral8, width: 1),
                borderRadius: BorderRadius.circular(30)),
            focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: MyColors.neutral8, width: 1),
                borderRadius: BorderRadius.circular(30)),
            filled: true,
            fillColor: MyColors.white,
          ),
          dropdownColor: MyColors.white,
          value: dropdownValue,
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue = newValue!;
            });
          },
          items: <String>[
            'Gender',
            'Male',
            'Female',
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: MyTextStyle.sfProSemiBold.copyWith(
                    color: dropdownValue == "Gender"
                        ? MyColors.neutral7
                        : MyColors.black,
                    fontSize: 16),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Row fieldsName(String text) {
    return Row(
      children: [
        SizedBox(
          width: 28.w,
        ),
        Text(
          tr('patient_details_screen.$text'),
          style: MyTextStyle.sfProSemiBold.copyWith(
              color: MyColors.neutral1.withOpacity(0.8), fontSize: 16.sp),
        ),
        Text(
          " *",
          style: MyTextStyle.sfProSemiBold
              .copyWith(color: MyColors.tertiary2, fontSize: 16.sp),
        ),
      ],
    );
  }

  checkActive() {
    if (selectAge < 5 &&
        _fullNameController.text.isNotEmpty &&
        phoneNumber.isNotEmpty &&
        _problemController.text.isNotEmpty &&
        dropdownValue != "Gender") {
      return true;
    }
    return false;
  }
}

extension StringExtensions on String {
  String removeWhitespace() {
    return replaceAll(' ', '');
  }

  String removeTire() {
    return replaceAll('-', '');
  }
}
