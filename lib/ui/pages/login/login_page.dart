import 'package:flutter/material.dart';
import 'package:prodev/ui/components/components.dart';
import 'package:provider/provider.dart';

import 'components/email_input.dart';
import 'login_presenter.dart';

class LoginPage extends StatefulWidget {
  final LoginPresenter presenter;

  const LoginPage({this.presenter});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void dispose() {
    super.dispose();
    widget.presenter.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          widget.presenter.isLoadingStream.listen((isLoading) {
            if (isLoading) {
              showLoading(context);
            } else {
              hideLoading(context);
            }
          });
          widget.presenter.mainErrorStream.listen((error) {
            if (error?.isNotEmpty == true) {
              showErrorMessage(context, message: error);
            }
          });
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LoginHeader(),
                const HeadLine4(text: 'Login'),
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Provider(
                    create: (_) => widget.presenter,
                    child: Form(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          EmailInput(),
                          const SizedBox(height: 8),
                          StreamBuilder<String>(
                              stream: widget.presenter.passwordErrorStream,
                              builder: (context, snapshot) {
                                return TextField(
                                  decoration: InputDecoration(
                                    labelText: 'Senha',
                                    icon: Icon(Icons.lock,
                                        color: Theme.of(context).primaryColorLight),
                                    errorText:
                                        snapshot.data?.isEmpty == true ? null : snapshot.data,
                                  ),
                                  obscureText: true,
                                  onChanged: widget.presenter.validatePassword,
                                );
                              }),
                          const SizedBox(height: 32),
                          StreamBuilder<bool>(
                              stream: widget.presenter.isFormValidStream,
                              builder: (context, snapshot) {
                                return RaisedButton(
                                  onPressed: snapshot.data == true ? widget.presenter.auth : null,
                                  child: Text('Entrar'.toUpperCase()),
                                );
                              }),
                          FlatButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.person),
                            label: Text('Criar conta'.toUpperCase()),
                          )
                        ],
                      ),
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
          );
        },
      ),
    );
  }
}
