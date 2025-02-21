import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:screenpage_loginpage/components/login/custom_login_component.dart';
import 'package:screenpage_loginpage/controllers/login_controller.dart';
import 'package:screenpage_loginpage/widgets/custom_textfield_widgets.dart';

class LoginPage extends StatelessWidget {
  final LoginController _controller = LoginController();

  LoginPage({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.people,
              size: 98,
            ),
            CustomTextFieldWidgets(label: 'Login', onChanged: _controller.setLogin),
            CustomTextFieldWidgets(label: 'Pass', onChanged: _controller.setPass, obscureText: true),
            SizedBox(
              height: 15,
            ),
            CustomLoginButtonComponent(loginController: _controller,),
          ],
        ),
      ),
    );
  }
}
