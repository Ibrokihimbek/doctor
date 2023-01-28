import 'package:doctor_app/bloc/user/user_bloc.dart';
import 'package:doctor_app/data/models/users/user_model.dart';
import 'package:doctor_app/data/repositories/storage_repository.dart';
import 'package:doctor_app/ui/tab_box/profile/sub_screens/widgets/appbar.dart';
import 'package:doctor_app/ui/tab_box/profile/sub_screens/widgets/drop_down.dart';
import 'package:doctor_app/ui/tab_box/profile/sub_screens/widgets/rich_text.dart';
import 'package:doctor_app/ui/tab_box/profile/sub_screens/widgets/text_field.dart';
import 'package:doctor_app/ui/tab_box/profile/sub_screens/widgets/update_image.dart';
import 'package:doctor_app/ui/tab_box/profile/sub_screens/widgets/upload_image_view.dart';
import 'package:doctor_app/ui/widgets/widgets.dart';
import 'package:doctor_app/utils/constants.dart';
import 'package:doctor_app/utils/date_format.dart';
import 'package:doctor_app/utils/icons/notification/notification.dart';
import 'package:doctor_app/utils/my_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../data/service/image_uploader.dart';
import '../../../../utils/color.dart';
import '../../../../utils/icons/app_icons.dart';
import '../../../auth/widgets/text_field.dart';
import '../../../book_appointment/sub_screens/patient_details/booking_patient_details.dart';
import '../../../widgets/appbar_by_logo.dart';
import '../../../widgets/global_button.dart';

class ProfileEditScreen extends StatefulWidget {
  final UserModel userModel;

  ProfileEditScreen({Key? key, required this.userModel}) : super(key: key);

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  TextEditingController addressController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();
  String birthDate = '';
  DateTime? taskDay;
  final ImagePicker _picker = ImagePicker();
  XFile? _image;
  String imageUrl = '';
  bool isLoading = false;

  @override
  void initState() {
    emailController.text = widget.userModel.email;
    nameController.text = widget.userModel.fullName;
    addressController.text = widget.userModel.address;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserSingleState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppbarByLogoWidget(
            logo: AppIcons.logo,
            title: 'Profile',
            onAddTap: () {},
          ),
          body: Padding(
            padding: const EdgeInsets.all(24),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      state.userModel.imageUrl.isNotEmpty
                          ? UpdateImage(
                              onTap: () {
                                _showPicker(context);
                              },
                              userModel: state.userModel,
                              imageUrl: _image,
                            )
                          : UploadImage(
                              userModel: state.userModel,
                              imageUrl: _image,
                              onTap: () {
                                _showPicker(context);
                              },
                            ),
                      SizedBox(height: 17.0.h),
                      const Divider(thickness: 1),
                      EditProfileTextfield(
                        word: 'Full Name',
                        textController: nameController,
                      ),
                      SizedBox(height: 12.0.h),
                      EditProfileTextfield(
                        word: 'Email',
                        textController: emailController,
                      ),
                      SizedBox(height: 12.0.h),
                      const RichTextWidget(word: 'Gender'),
                      SizedBox(height: 12.0.h),
                      DropDown(value: (v) {

                      }),
                      SizedBox(height: 12.0.h),
                      const RichTextWidget(word: 'Date of birth'),
                      SizedBox(height: 12.0.h),
                      Container(
                        height: m_h(context) * 0.066,
                        width: m_w(context),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(-40, 40),
                              color: const Color(0xFF93b8EF).withOpacity(0.1),
                              spreadRadius: -40,
                              blurRadius: 40,
                            ),
                            BoxShadow(
                              offset: const Offset(40, 40),
                              color: const Color(0xFF93b8EF).withOpacity(0.1),
                              spreadRadius: -40,
                              blurRadius: 40,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(
                            m_h(context) * 0.1,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                taskDay == null
                                    ? 'Date of birth'
                                    : TimeUtils.birthDate(
                                        DateTime.parse(birthDate),
                                      ),
                              ),
                              InkWell(
                                onTap: () async {
                                  taskDay = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime(2300),
                                  );
                                  setState(
                                    () {
                                      birthDate = taskDay.toString();
                                    },
                                  );
                                },
                                child: SvgPicture.asset(
                                  NotificationIcons.eventNote,
                                  color: MyColors.neutral5,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 12.0.h),
                      EditProfileTextfield(
                        word: 'Addres',
                        textController: addressController,
                      ),
                      SizedBox(height: 15.0.h),
                      GlobalButton(
                        isActive: emailController.text.isNotEmpty &&
                                nameController.text.isNotEmpty &&
                                addressController.text.isNotEmpty &&
                                birthDate.isNotEmpty &&
                                dropdownValue != 'Gender'
                            ? true
                            : false,
                        buttonText: 'Confirm',
                        onTap: () async {
                          UserModel userModel = UserModel(
                            gender: dropdownValue,
                            address: addressController.text,
                            birthDate: taskDay ?? DateTime.now(),
                            createdAt: state.userModel.createdAt,
                            imageUrl: imageUrl.isEmpty
                                ? state.userModel.imageUrl
                                : imageUrl,
                            fullName: nameController.text,
                            phoneNumber: state.userModel.phoneNumber,
                            userId: await StorageRepository.getUserId(),
                            fcmToken: state.userModel.fcmToken,
                            email: emailController.text,
                            password: state.userModel.password,
                            favorites: state.userModel.favorites,
                          );
                          // ignore: use_build_context_synchronously
                          BlocProvider.of<UserBloc>(context)
                              .updateUserInfo(userModel);
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _showPicker(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(
                  Icons.filter,
                ),
                title: const Text("Galareya"),
                onTap: () {
                  _getFromGallery();
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.camera_alt,
                ),
                title: const Text('Kamera'),
                onTap: () {
                  _getFromCamera();
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  _getFromGallery() async {
    XFile? pickedFile = await _picker.pickImage(
      maxWidth: 1000,
      maxHeight: 1000,
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      if (!mounted) return;
      setState(() {
        isLoading = true;
        MyUtils.getMyToast(message: 'Rasm yuklanmoqda');
      });
      imageUrl = await FileUploader.imageUploader(pickedFile, 'userImage');
      setState(() {
        isLoading = false;
        _image = pickedFile;
      });
    }
  }

  _getFromCamera() async {
    XFile? pickedFile = await _picker.pickImage(
      maxWidth: 1920,
      maxHeight: 2000,
      source: ImageSource.camera,
    );
    if (pickedFile != null) {
      if (!mounted) return;
      setState(() {
        isLoading = true;
        MyUtils.getMyToast(message: 'Rasm yuklanmoqda');
      });
      imageUrl = await FileUploader.imageUploader(pickedFile, 'userImage');
      setState(() {
        isLoading = false;
        _image = pickedFile;
      });
    }
  }
}
