part of 'sign_in_cubit.dart';

abstract class SignInState extends Equatable {

  @override
  List<Object> get props => [];
}

class SignInInitial extends SignInState {}

class SignInSuccess extends SignInState {
  final User user;

  SignInSuccess(this.user);


  @override
  List<Object> get props => [];
}

class SignInError extends SignInState {
  final String message;

  SignInError(this.message);

  @override
  List<Object> get props => [message];
}