import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../controllers/login_controller.dart';

class CustomLoginButtonComponent extends StatelessWidget {
  final LoginController loginController;

  const CustomLoginButtonComponent({super.key, required this.loginController});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: loginController.inLoader,
      builder: (_, inLoader, __) => inLoader
          ? CircularProgressIndicator()
          : ElevatedButton(
              onPressed: () {
                loginController.auth().then((result) {
                  if (result) {
                    Navigator.of(context).pushReplacementNamed('/home');
                    // } else if( _pass == '' || _login == ''){
                    //   ScaffoldMessenger.of(context)
                    //       .showSnackBar(SnackBar(
                    //         content: const Text('Login ou senha vazios, preencha!'),
                    //         duration: const Duration(seconds: 3),
                    //         ));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: const Text('Login ou senha inválidos!'),
                      duration: const Duration(seconds: 3),
                    ));
                  }
                });
              },
              child: Text('Login'),
            ),
    );
  }
}
