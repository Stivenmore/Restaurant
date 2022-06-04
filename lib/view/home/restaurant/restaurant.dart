import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_place/google_place.dart';
import 'package:restaurant/domain/cubit/autenticate_cubit.dart';
import 'package:restaurant/domain/cubit/city_cubit.dart';
import 'package:restaurant/domain/cubit/restaurant_cubit.dart';
import 'package:restaurant/domain/models/user_model.dart';
import 'package:restaurant/view/autentication/welcome.dart';
import 'package:restaurant/view/style.dart';

class Restaurant extends StatefulWidget {
  final UserModel user;
  Restaurant({Key? key, required this.user}) : super(key: key);

  @override
  State<Restaurant> createState() => _RestaurantState();
}

class _RestaurantState extends State<Restaurant> {
  TextEditingController controller = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
              backgroundColor: kColorPurple,
              leading: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.align_vertical_bottom_sharp,
                    color: kColorWhite,
                  )),
              actions: [
                IconButton(
                    onPressed: () {
                      context.read<AutenticateCubit>().logOut(widget.user);
                      Navigator.pushAndRemoveUntil(
                          context, MaterialPageRoute(builder: (context) => Welcome()), (route) => false);
                    },
                    icon: Icon(
                      Icons.exit_to_app,
                      color: kColorWhite,
                    )),
              ]),
          body: Container(
            margin: const EdgeInsets.only(right: 20, left: 20, top: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: controller,
                  cursorColor: kColorPurple,
                  decoration: InputDecoration(
                      labelText: "Buscar",
                      labelStyle: TextStyle(color: kColorPurple),
                      focusedBorder: borderTextInput1,
                      enabledBorder: borderTextInput1),
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      context.read<RestaurantCubit>().clearState();
                      context.read<CityCubit>().autoCompleteSearch(value);
                      setState(() {});
                    }
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                BlocBuilder<CityCubit, CityState>(
                  builder: (context, state) {
                    switch (state.runtimeType) {
                      case CityInitial:
                        return Container();
                      case CityLoading:
                        return SizedBox(
                            height: 30,
                            child: LinearProgressIndicator(
                              color: kColorPurple,
                              backgroundColor: kColorWhite,
                            ));
                      case CityLoaded:
                        List<AutocompletePrediction> list =
                            state.props[0] as List<AutocompletePrediction>;
                        if (list.isNotEmpty) {
                          return Expanded(
                            child: ListView.builder(
                              itemCount: list.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor: kColorPurple,
                                    child: const Icon(
                                      Icons.pin_drop,
                                      color: Colors.white,
                                    ),
                                  ),
                                  title: Text(list[index].description ?? ""),
                                  onTap: () {
                                    context.read<CityCubit>().clearState();
                                    context
                                        .read<RestaurantCubit>()
                                        .autoCompleteSearch(
                                            list[index].description!);
                                  },
                                );
                              },
                            ),
                          );
                        } else {
                          return Container();
                        }
                      default:
                        return SizedBox(
                            height: 30,
                            child: LinearProgressIndicator(
                              color: kColorPurple,
                              backgroundColor: kColorWhite,
                            ));
                    }
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                BlocBuilder<RestaurantCubit, RestaurantState>(
                  builder: (context, state) {
                    switch (state.runtimeType) {
                      case RestaurantLoading:
                        return SizedBox(
                            height: 30,
                            child: LinearProgressIndicator(
                              color: kColorPurple,
                              backgroundColor: kColorWhite,
                            ));
                      case RestaurantInitial:
                        return Container();
                      case RestaurantLoaded:
                        List<AutocompletePrediction> list =
                            state.props[0] as List<AutocompletePrediction>;
                        if (list.isNotEmpty) {
                          return Expanded(
                            child: ListView.builder(
                              itemCount: list.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor: kColorPurple,
                                    child: const Icon(
                                      Icons.pin_drop,
                                      color: Colors.white,
                                    ),
                                  ),
                                  title: Text(list[index].description ?? ""),
                                  onTap: () {
                                    debugPrint(context
                                        .read<CityCubit>()
                                        .predictions[index]
                                        .placeId);
                                  },
                                );
                              },
                            ),
                          );
                        } else {
                          return Container();
                        }

                      default:
                        return SizedBox(
                            height: 30,
                            child: LinearProgressIndicator(
                              color: kColorPurple,
                              backgroundColor: kColorWhite,
                            ));
                    }
                  },
                ),
              ],
            ),
          )),
    );
  }
}
