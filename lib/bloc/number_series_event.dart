import 'package:equatable/equatable.dart';

abstract class NumberSeriesEvent extends Equatable {
  const NumberSeriesEvent();
}

class GenerateSeries extends NumberSeriesEvent {
  final int N;
  final int type;

  const GenerateSeries(this.N, this.type);

  @override
  List<Object> get props => [N, type];
}
