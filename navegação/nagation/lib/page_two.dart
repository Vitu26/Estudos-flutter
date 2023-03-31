import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class TwoPage extends StatelessWidget {
  // final String args;
  const TwoPage({
    super.key,
    /*required this.args*/
  }); //todo objeto que não é anulável e tiver como parametro nomeado precisa ser requerido

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            if (Navigator.of(context).canPop()) {
              Navigator.of(context).pop();
            }
          },
          child: Text('Voltar para page anterior $args'),
        ),
      ),
    );
  }
}
