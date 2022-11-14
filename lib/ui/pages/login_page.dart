import 'package:flutter/material.dart';
import 'package:prodev/ui/components/components.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            LoginHeader(),
            HeadLine1(text: 'Login'),
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
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 32),
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Password',
                          icon: Icon(Icons.lock, color: Theme.of(context).primaryColorLight),
                        ),
                        obscureText: true,
                      ),
                    ),
                    RaisedButton(
                      child: Text('Entrar'.toUpperCase()),
                      onPressed: () {},
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