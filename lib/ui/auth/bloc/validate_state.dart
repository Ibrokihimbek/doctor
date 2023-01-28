
part of 'validate_bloc.dart';


class ValidatingStatusState extends Equatable {
  final bool emailValidated;
  final bool passwordValidated;

  const ValidatingStatusState({
    required this.passwordValidated,
    required this.emailValidated,
  });

  ValidatingStatusState copyWith({
    bool? passwordValidated,
    bool? emailValidated,
  }) =>
      ValidatingStatusState(
        passwordValidated: passwordValidated ?? this.passwordValidated,
        emailValidated: emailValidated ?? this.emailValidated,
      );

  @override
  List<Object?> get props => [
        emailValidated,
        passwordValidated,
      ];
}
