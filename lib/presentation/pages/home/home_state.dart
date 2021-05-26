part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  @override
  List<Object> get props => [];
}

class HomeStateLoading extends HomeState {}

class HomeStateLoaded extends HomeState {}

class HomeStateFailed extends HomeState {}
