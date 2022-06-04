import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant/domain/cubit/autenticate_cubit.dart';
import 'package:restaurant/view/autentication/signInAndUp.dart';
import 'package:restaurant/view/widgets/customtext.dart';
import 'package:restaurant/view/widgets/responsive.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    return Scaffold(
      body: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Bienvenido, esta es una prueba tecnica que prueba el nivel de analisis y desarrollo",
              style: GoogleFonts.montserrat(),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 100,
            ),
            Column(
              children: [
                TextButton(
                  onPressed: () {
                    context.read<AutenticateCubit>().initialState();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const SignInAndUp(
                                  metod: 'SignIn',
                                )));
                  },
                  child: const CustomText(
                    text: "Iniciar sesión",
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("¿Aun no tienes una cuenta?"),
                    TextButton(
                        onPressed: () {
                          context.read<AutenticateCubit>().initialState();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const SignInAndUp(
                                        metod: 'SignUp',
                                      )));
                        },
                        child: const CustomText(
                          text: "Create una cuenta",
                        ))
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
