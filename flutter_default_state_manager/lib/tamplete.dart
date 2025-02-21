import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deafault_state_manager/widgets/imc_gauge.dart';

class Tamplete extends StatefulWidget {
  const Tamplete({super.key});

  @override
  State<Tamplete> createState() => _TampleteState();
}

class _TampleteState extends State<Tamplete> {
  final TextEditingController alturaController = TextEditingController();
  final TextEditingController pesoController = TextEditingController();

  @override
  void dispose() {
    alturaController.dispose();
    pesoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('IMC SetState'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                ImcGauge(
                  imc: 0,
                ),
                SizedBox(height: 26),
                TextFormField(
                  controller: alturaController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    CurrencyTextInputFormatter.currency(
                      decimalDigits: 2,
                      locale: 'pt_BR',
                      symbol: '',
                      turnOffGrouping: true,
                    ),
                  ],
                  decoration: InputDecoration(
                    labelText: 'Altura (cm)',
                    border: OutlineInputBorder(),
                  ),
                ),
                TextFormField(
                  controller: pesoController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    CurrencyTextInputFormatter.currency(
                      decimalDigits: 2,
                      locale: 'pt_BR',
                      symbol: '',
                      turnOffGrouping: true,
                    ),
                  ],
                  decoration: InputDecoration(
                    labelText: 'Altura (cm)',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(onPressed: () {}, child: Text('Calcular IMC')),
              ],
            ),
          ),
        ));
  }
}
