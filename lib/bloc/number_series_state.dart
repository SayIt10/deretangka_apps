import 'package:equatable/equatable.dart';

abstract class NumberSeriesState extends Equatable {
  const NumberSeriesState();
}

class NumberSeriesInitial extends NumberSeriesState {
  @override
  List<Object> get props => [];
}

class NumberSeriesLoaded extends NumberSeriesState {
  final List<String> series;

  const NumberSeriesLoaded(this.series);

  @override
  List<Object> get props => [series];
}
