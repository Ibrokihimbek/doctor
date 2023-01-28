part of 'user_bloc.dart';

class UserSingleState extends Equatable {
  final UserModel userModel;
  const UserSingleState({required this.userModel});

  UserSingleState copyWith({UserModel? userModel}) =>
      UserSingleState(userModel: userModel ?? this.userModel);

  @override
  List<Object?> get props => [
        userModel,
      ];

  
}