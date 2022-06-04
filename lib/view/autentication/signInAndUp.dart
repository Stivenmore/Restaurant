// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant/domain/cubit/autenticate_cubit.dart';
import 'package:restaurant/domain/models/user_model.dart';
import 'package:restaurant/view/home/restaurant/restaurant.dart';
import 'package:restaurant/view/style.dart';
import 'package:restaurant/view/utils/Streamvalidation.dart';
import 'package:restaurant/view/widgets/customtext.dart';
import 'package:restaurant/view/widgets/responsive.dart';

class SignInAndUp extends StatefulWidget {
  final String metod;
  const SignInAndUp({Key? key, required this.metod}) : super(key: key);

  @override
  State<SignInAndUp> createState() => _SignInAndUpState();
}

class _SignInAndUpState extends State<SignInAndUp> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final validate = RegisterValidate();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kColorPurple,
          title: CustomText(
            text: widget.metod == "SignIn" ? "INICIAR SESION" : "REGISTRATE",
            textStyle: GoogleFonts.montserrat(color: kColorWhite),
          ),
          leading: IconButton(
              onPressed: () {
                _controller.clear();
                _controller2.clear();
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: kColorWhite,
              )),
        ),
        body: BlocConsumer<AutenticateCubit, AutenticateState>(
          listener: (context, state) {
            if (state.runtimeType == AutenticateLoading) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: CustomText(
                text: "Procesando...",
                color: kColorWhite,
              )));
            } else if (state.runtimeType == AutenticateLoaded) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Restaurant(
                    user:  state.props[0] as UserModel,
                  )));
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: CustomText(
                text: "Proceso exitoso",
                color: kColorWhite,
              )));
            } else if (state.runtimeType == AutenticateError) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: CustomText(
                text: state.props[0].toString(),
                color: kColorWhite,
              )));
            }
            Future.delayed(const Duration(seconds: 2), () {
              context.read<AutenticateCubit>().initialState();
            });
          },
          builder: (context, state) {
            switch (state.runtimeType) {
              case AutenticateInitial:
                return SizedBox(
                  height: responsive.height,
                  width: responsive.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: StreamBuilder(
                            stream: validate.emailStream,
                            builder: (context, snapshot) {
                              return TextFormField(
                                controller: _controller,
                                cursorColor: kColorPurple,
                                onChanged: validate.changeEmail,
                                decoration: InputDecoration(
                                  errorMaxLines: 2,
                                  errorText: snapshot.error as String?,
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.only(bottom: 8),
                                    child: Icon(
                                      Icons.search,
                                      color: kColorPurple,
                                    ),
                                  ),
                                  hintText: 'Correo...',
                                  border: borderTextInput1,
                                  enabledBorder: borderTextInput1,
                                  focusedBorder: borderTextInput1,
                                ),
                                validator: (String? v) =>
                                    v!.isEmpty ? "Error" : null,
                              );
                            },
                          )),
                      Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: StreamBuilder(
                            stream: validate.passwordStream,
                            builder: ((context, snapshot) {
                              return TextFormField(
                                controller: _controller2,
                                cursorColor: kColorPurple,
                                onChanged: validate.changePassword,
                                decoration: InputDecoration(
                                  errorMaxLines: 2,
                                  errorText: snapshot.error as String?,
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.only(bottom: 8),
                                    child: Icon(
                                      Icons.search,
                                      color: kColorPurple,
                                    ),
                                  ),
                                  hintText: 'Contraseña...',
                                  border: borderTextInput1,
                                  enabledBorder: borderTextInput1,
                                  focusedBorder: borderTextInput1,
                                ),
                                validator: (String? v) => v!.isEmpty
                                    ? "Error en la contraseña"
                                    : null,
                              );
                            }),
                          )),
                      StreamBuilder(
                          stream: validate.formValidStream,
                          builder: (context, snapshot) {
                            return GestureDetector(
                              onTap: () {
                                if (snapshot.hasData) {
                                  if (widget.metod == "SignIn") {
                                    context
                                        .read<AutenticateCubit>()
                                        .mockUserNotApiLogin(UserModel(
                                            password: _controller2.text,
                                            email: _controller.text,
                                            autenticate: true));
                                  } else {
                                    context
                                        .read<AutenticateCubit>()
                                        .mockUserNotApiRegister(UserModel(
                                            password: _controller2.text,
                                            email: _controller.text,
                                            autenticate: true));
                                  }
                                }
                              },
                              child: Container(
                                height: 50,
                                width: 120,
                                decoration: BoxDecoration(
                                    color: snapshot.hasData
                                        ? kColorPurple
                                        : kColorPurple.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(16)),
                                child: Center(
                                    child: CustomText(
                                  text: widget.metod == "SignIn"
                                      ? "Iniciar sesion"
                                      : "Registrar",
                                  color: kColorWhite,
                                )),
                              ),
                            );
                          })
                    ],
                  ),
                );
              case AutenticateLoaded:
                return CustomText(text: "Proceso exitoso");
              case AutenticateLoading:
                return Center(
                  child: CircularProgressIndicator(
                    color: kColorPurple,
                    backgroundColor: kColorWhite,
                  ),
                );
              default:
                return Center(
                  child: CircularProgressIndicator(
                    color: kColorPurple,
                    backgroundColor: kColorWhite,
                  ),
                );
            }
          },
        ));
  }
}
