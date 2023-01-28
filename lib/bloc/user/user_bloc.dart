import 'package:bloc/bloc.dart';
import 'package:doctor_app/data/models/users/user_model.dart';
import 'package:doctor_app/data/repositories/user_repository.dart';
import 'package:equatable/equatable.dart';

part 'user_state.dart';

class UserBloc extends Cubit<UserSingleState> {
  final UserRepository userRepository;

  UserBloc({required this.userRepository})
      : super(
          UserSingleState(
            userModel: UserModel(
              favorites: [],
              gender: '',
              address: '',
              birthDate: DateTime.now(),
              createdAt: DateTime.now(),
              imageUrl: '',
              fullName: '',
              phoneNumber: '',
              userId: '',
              fcmToken: '',
              email: '',
              password: '',
            ),
          ),
        ) {
    _fetchSingleUser();
  }

  UserModel? userModel;

  updateUserInfo(UserModel userModel) =>
      userRepository.updateUserInfo(userModel: userModel);

  _fetchSingleUser() async {
    userRepository.getSingleUser().listen(
      (users) {
        emit(
          state.copyWith(userModel: users.first),
        );
      },
    );
  }
}