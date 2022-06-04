import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:restaurant/domain/models/user_model.dart';

part 'autenticate_state.dart';

class AutenticateCubit extends Cubit<AutenticateState> {
  AutenticateCubit() : super(AutenticateInitial());

  List<UserModel> userModel = <UserModel>[];

  Future mockUserNotApiLogin(UserModel user) async {
    emit(AutenticateLoading());
    await Future.delayed(const Duration(seconds: 2));
    for (var i = 0; i < userModel.length; i++) {
      if (userModel[i].email == user.email &&
          userModel[i].password == user.password) {
        userModel.remove(userModel[i]);
        userModel.add(user);
      }
    }
    bool validate = userModel.contains(user);
    if (validate) {
      emit(AutenticateLoaded(userModel: user));
    } else {
      emit(const AutenticateError(errorMessage: "Usuario no registrado"));
    }
  }

  Future mockUserNotApiRegister(UserModel user) async {
    emit(AutenticateLoading());
    await Future.delayed(const Duration(seconds: 2));
    bool validate = userModel.contains(user);
    if (validate) {
      emit(const AutenticateError(
          errorMessage: "Este usuario ya fue registrado"));
    } else {
      userModel.add(user);
      emit(AutenticateLoaded(userModel: user));
    }
  }

  void initialState() {
    emit(AutenticateInitial());
  }

  void logOut(UserModel user) {
    for (var i = 0; i < userModel.length; i++) {
      if (userModel[i] == user) {
        userModel.remove(user);
        userModel.add(UserModel(
            password: user.password, email: user.email, autenticate: false));
      }
    }
  }
}
