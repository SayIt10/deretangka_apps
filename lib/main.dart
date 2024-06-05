import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/number_series_bloc.dart';
import 'bloc/number_series_event.dart';
import 'bloc/number_series_state.dart';
import 'number_series.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Deret Angka',
      home: BlocProvider(
        create: (context) => NumberSeriesBloc(NumberSeries()),
        child: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Deret Angka'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Masukkan nilai N',
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () => _generateSeries(context, 1),
                      child: Text('Deret 1->N'),
                    ),
                    ElevatedButton(
                      onPressed: () => _generateSeries(context, 2),
                      child: Text('Deret 1->N->1'),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () => _generateSeries(context, 3),
                      child: Text('Deret 10,21,..'),
                    ),
                    ElevatedButton(
                      onPressed: () => _generateSeries(context, 4),
                      child: Text('Deret 5=L, 7=T'),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            BlocBuilder<NumberSeriesBloc, NumberSeriesState>(
              builder: (context, state) {
                if (state is NumberSeriesInitial) {
                  return Text('Masukkan nilai N dan tekan tombol untuk menghasilkan deret.');
                } else if (state is NumberSeriesLoaded) {
                  return Text('Hasil: ${state.series.join(' ')}');
                } else {
                  return Container();
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  void _generateSeries(BuildContext context, int type) {
    final int N = int.tryParse(_controller.text) ?? 0;
    if (N > 0) {
      BlocProvider.of<NumberSeriesBloc>(context).add(GenerateSeries(N, type));
    }
  }
}
