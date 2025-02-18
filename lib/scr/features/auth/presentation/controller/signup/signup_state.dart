part of 'signup_cubit.dart';

sealed class RegistrationState {}

final class Registrationitial extends RegistrationState {}

class RegistrationLoading extends RegistrationState {}

class RegistrationSuccess extends RegistrationState {
  final String token;

  RegistrationSuccess(this.token);
}

class RegistrationError extends RegistrationState {
  final String message;

  RegistrationError(this.message);
}
