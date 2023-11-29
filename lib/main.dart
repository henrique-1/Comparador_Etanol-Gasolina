import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class GasolinaEtanol extends StatefulWidget {
  const GasolinaEtanol({super.key});

  @override
  _GasolinaEtanolPageState createState() => _GasolinaEtanolPageState();
}

class _GasolinaEtanolPageState extends State<GasolinaEtanol> {
  double _precoGasolina = 0.0;
  double _precoEtanol = 0.0;
  String _resultado = '';

  void evaluateBestOption() {
    double razao = _precoEtanol / _precoGasolina;
    if (razao < 0.7) {
      _resultado = 'Etanol.';
    } else {
      _resultado = 'Gasolina.';
    }
    showModalDialog();
  }

  void showModalDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Qual o melhor combustível?'),
          content: Text(_resultado),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comparação de combustível'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Preço Gasolina'),
              onChanged: (value) {
                _precoGasolina = double.tryParse(value) ?? 0.0;
              },
            ),
            const SizedBox(height: 16.0),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Preço Etanol'),
              onChanged: (value) {
                _precoEtanol = double.tryParse(value) ?? 0.0;
              },
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: evaluateBestOption,
              child: const Text('Calcular'),
            ),
          ],
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Comparação Combustível',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green.shade300),
        useMaterial3: true,
      ),
      home: const GasolinaEtanol(),
    );
  }
}
