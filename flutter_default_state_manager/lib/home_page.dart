import 'package:flutter/material.dart';
import 'package:flutter_deafault_state_manager/setState/imc_steState_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _goToPage(BuildContext context, Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _goToPage(context, ImcSteStatePage()),
              child: Text('SetState'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('CValueNotifier'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('ChangeNotifier'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Bloc Pattern(Streams)'),
            ),
          ],
        ),
      ),
    );
  }
}
