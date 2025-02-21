import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_deafault_state_manager/widgets/imc_gauge.dart';
import 'package:flutter_deafault_state_manager/widgets/imc_gauge_range.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:intl/intl.dart';

class ImcSteStatePage extends StatefulWidget {
  ImcSteStatePage({super.key});

  @override
  State<ImcSteStatePage> createState() => _ImcSteStatePageState();
}

class _ImcSteStatePageState extends State<ImcSteStatePage> {
  final TextEditingController alturaController = TextEditingController();
  final TextEditingController pesoController = TextEditingController();
  //criando a key para validar o form
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  var imc = 0.0;

  //calculando o peso
  void _calcularImc(double altura, double peso) {
    //método setState para mudança de estado
    setState(() {
      //imc = peso / (altura * altura);
      imc = peso /
          pow(altura,
              2); // usando o dart:math para elevar ao quadrado, pow que escolhe o valor e o expoente
    });
  }

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
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  ImcGauge(
                    imc: imc,
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Informe a altura';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Altura (m)',
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Informe o peso';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Peso(kg)',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      var formValide =
                          formKey.currentState?.validate() ?? false;
                      if (formValide) {
                        var formatter = NumberFormat.simpleCurrency(
                            locale: 'pt_BR', decimalDigits: 2,
                        );
                        //converter os valores usando o intl e criando o formatador
                        final altura = formatter.parse(alturaController.text)
                                .toDouble();
                        final peso = formatter.parse(pesoController.text)
                            .toDouble();
                        print('Altura: $altura, Peso: $peso');
                        _calcularImc(altura, peso);
                      }
                    },
                    child: Text('Calcular IMC'),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
