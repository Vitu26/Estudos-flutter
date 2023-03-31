import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:nagation/page_two.dart';

class OnePage extends StatelessWidget {
  const OnePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigator.of(context).push(MaterialPageRoute(
            //   builder: (context) => const TwoPage(),
            // ),
            // );
            Navigator.of(context).pushNamed('/twopage', arguments: 'teste').then((value) => print(value));//usando a navegação com rotas nomeadas
            //Navigator.of(context).pushReplacementNamed('/twopage', arguments: 'teste').then((value) => print(value)); Dessa forma ele impede do appbar forma o item para voltar para a pagina, apagando a ultima
          },
          child: Text('Ir para segunda pagina'),
        ),
      ),
    );
  }
}
