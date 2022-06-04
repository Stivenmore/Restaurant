part of 'city_cubit.dart';

abstract class CityState extends Equatable {
  const CityState();

  @override
  List<Object> get props => [];
}

class CityInitial extends CityState {}

class CityLoaded extends CityState {
  final List<AutocompletePrediction> predictions;
  CityLoaded({required this.predictions});
  @override
  List<Object> get props => [predictions];
}

class CityError extends CityState {}

class CityLoading extends CityState {}
