import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            FlutterLogo(
              size: 200,
            ),
            Text('Login'.toUpperCase()),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                icon: Icon(Icons.email),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
                icon: Icon(Icons.lock),
              ),
              obscureText: true,
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
