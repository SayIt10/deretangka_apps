import 'package:flutter_bloc/flutter_bloc.dart';
import 'number_series_event.dart';
import 'number_series_state.dart';
import '../number_series.dart';

class NumberSeriesBloc extends Bloc<NumberSeriesEvent, NumberSeriesState> {
  final NumberSeries numberSeries;

  NumberSeriesBloc(this.numberSeries) : super(NumberSeriesInitial()) {
    on<GenerateSeries>(_onGenerateSeries);
  }

  void _onGenerateSeries(GenerateSeries event, Emitter<NumberSeriesState> emit) {
    List<String> series;
    switch (event.type) {
      case 1:
        series = numberSeries.generateSeries(event.N).map((e) => e.toString()).toList();
        break;
      case 2:
        series = numberSeries.generateSeriesReverse(event.N).map((e) => e.toString()).toList();
        break;
      case 3:
        series = numberSeries.generateSeriesPlus(event.N).map((e) => e.toString()).toList();
        break;
      case 4:
        series = numberSeries.generateSeriesWithWords(event.N);
        break;
      default:
        series = [];
    }
    emit(NumberSeriesLoaded(series));
  }
}
