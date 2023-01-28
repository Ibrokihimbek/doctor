import 'package:doctor_app/ui/book_appointment/sub_screens/patient_details/booking_patient_details.dart';
import 'package:doctor_app/utils/color.dart';
import 'package:doctor_app/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DropDown extends StatefulWidget {
  const DropDown({super.key, required this.value});

  final ValueChanged<String> value;

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      style: TextStyle(fontSize: 20),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black12, width: 1),
          borderRadius: BorderRadius.circular(100.r),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black12, width: 1),
          borderRadius: BorderRadius.circular(100.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black12, width: 1),
          borderRadius: BorderRadius.circular(100.r),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 1,horizontal: 16),
        filled: true,
        fillColor: MyColors.white,
      ),
      dropdownColor: Colors.white,
      value: dropdownValue,
      onChanged: (String? newValue) {
        widget.value.call(newValue!);
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: <String>[
        'Male',
        'Female',
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: MyTextStyle.sfProRegular.copyWith(
                color: dropdownValue == "Gender"
                    ? MyColors.neutral7
                    : MyColors.black,
                fontSize: 20.sp),
          ),
        );
      }).toList(),
    );
  }
}
