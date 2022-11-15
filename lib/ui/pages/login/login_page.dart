import 'package:flutter/material.dart';
import 'package:prodev/ui/components/components.dart';

import 'login_presenter.dart';

class LoginPage extends StatelessWidget {
  final LoginPresenter presenter;

  const LoginPage({
    Key key,
    this.presenter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            LoginHeader(),
            HeadLine4(text: 'Login'),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        icon: Icon(Icons.email, color: Theme.of(context).primaryColorLight),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      onChanged: presenter.validateEmail,
                    ),
                    SizedBox(height: 8),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Senha',
                        icon: Icon(Icons.lock, color: Theme.of(context).primaryColorLight),
                      ),
                      obscureText: true,
                      onChanged: presenter.validatePassword,
                    ),
                    SizedBox(height: 32),
                    RaisedButton(
                      child: Text('Entrar'.toUpperCase()),
                      onPressed: null,
                    ),
                    FlatButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.person),
                      label: Text('Criar conta'.toUpperCase()),
                    )
                  ],
                ),
              ),
            )
            // ElevatedButton(
            //   onPressed: () {},
            //   child: Text('Login'),
            // ),
            // TextButton(
            //   onPressed: () {},
            //   child: Text('Criar Conta'),
            // ),
          ],
        ),
      ),
    );
  }
}
