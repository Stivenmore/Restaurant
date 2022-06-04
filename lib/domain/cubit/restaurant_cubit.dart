import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_place/google_place.dart';
import 'package:restaurant/view/secure/env.dart';

part 'restaurant_state.dart';

class RestaurantCubit extends Cubit<RestaurantState> {
  RestaurantCubit() : super(RestaurantInitial());

  List<AutocompletePrediction> predictions = [];

  Future autoCompleteSearch(String value) async {
    GooglePlace googlePlace = GooglePlace(apiKey);
    emit(RestaurantLoading());
    if (value.isNotEmpty) {
      var result3 = await googlePlace.search.getTextSearch(value);
      var result = await googlePlace.autocomplete.get(value,
          types: "restaurant",
          location: result3 != null
              ? LatLon(result3.results![0].geometry!.location!.lat!,
                  result3.results![0].geometry!.location!.lng!)
              : null);
      if (result != null && result.predictions != null) {
        predictions = result.predictions!;
        emit(RestaurantLoaded(predictions: predictions));
      } else {
        emit(RestaurantError());
      }
    } else {
      emit(RestaurantLoaded(predictions: const <AutocompletePrediction>[]));
    }
  }

  void clearState() {
    emit(RestaurantInitial());
  }
}
