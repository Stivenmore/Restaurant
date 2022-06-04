import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_place/google_place.dart';
import 'package:restaurant/view/secure/env.dart';

part 'city_state.dart';

class CityCubit extends Cubit<CityState> {
  CityCubit() : super(CityInitial());


  List<AutocompletePrediction> predictions= [];


  Future autoCompleteSearch(String value) async {
    GooglePlace googlePlace = GooglePlace(apiKey);
    emit(CityLoading());
    if (value.isNotEmpty) {
      var result = await googlePlace.autocomplete.get(value);
    if (result != null && result.predictions != null) {
      predictions = result.predictions!;
      emit(CityLoaded(predictions: predictions));
    }else{
      emit(CityError());
    }
    } else {
      emit(CityLoaded(predictions: const <AutocompletePrediction>[]));
    }
  }
  void clearState(){
    emit(CityInitial());
  }
}
