import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/domain/cubit/autenticate_cubit.dart';
import 'package:restaurant/domain/cubit/city_cubit.dart';
import 'package:restaurant/domain/cubit/restaurant_cubit.dart';
import 'package:restaurant/view/autentication/welcome.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AutenticateCubit(),
        ),
        BlocProvider(
          create: (context) => CityCubit(),
        ),
        BlocProvider(
          create: (context) => RestaurantCubit(),
        ),
      ],
      child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Prueba tecnica',
          home: Welcome()),
    );
  }
}
