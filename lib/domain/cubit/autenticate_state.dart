part of 'autenticate_cubit.dart';

abstract class AutenticateState extends Equatable {
  const AutenticateState();

  @override
  List<Object> get props => [];
}

class AutenticateInitial extends AutenticateState {}

class AutenticateLoading extends AutenticateState {}

class AutenticateLoaded extends AutenticateState {
  final UserModel userModel;
  const AutenticateLoaded({required this.userModel});
  @override
  List<Object> get props => [userModel];
}

class AutenticateError extends AutenticateState {
  final String errorMessage;
  const AutenticateError({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
