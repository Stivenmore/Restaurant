part of 'restaurant_cubit.dart';

abstract class RestaurantState extends Equatable {
  const RestaurantState();

  @override
  List<Object> get props => [];
}

class RestaurantInitial extends RestaurantState {}

class RestaurantLoaded extends RestaurantState {
  final List<AutocompletePrediction> predictions;
  RestaurantLoaded({required this.predictions});
  @override
  List<Object> get props => [predictions];
}

class RestaurantError extends RestaurantState {}

class RestaurantLoading extends RestaurantState {}
