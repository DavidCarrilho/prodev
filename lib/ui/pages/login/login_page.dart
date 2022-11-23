import 'package:flutter/material.dart';
import 'package:prodev/ui/components/components.dart';

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
              showDialog(
                context: context,
                barrierDismissible: false,
                child: SimpleDialog(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                        const SizedBox(height: 10),
                        Text('Carregando', textAlign: TextAlign.center),
                      ],
                    ),
                  ],
                ),
              );
            } else if (Navigator.canPop(context)) {
              Navigator.of(context).pop();
            }
          });
          widget.presenter.mainErrorStream.listen((error) {
            if (error?.isNotEmpty == true) {
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text(error, textAlign: TextAlign.center),
                  backgroundColor: Colors.red,
                ),
              );
            }
          });
          return SingleChildScrollView(
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
                        StreamBuilder<String>(
                            stream: widget.presenter.emailErrorStream,
                            builder: (context, snapshot) {
                              return TextField(
                                decoration: InputDecoration(
                                  labelText: 'Email',
                                  icon:
                                      Icon(Icons.email, color: Theme.of(context).primaryColorLight),
                                  errorText: snapshot.data?.isEmpty == true ? null : snapshot.data,
                                ),
                                keyboardType: TextInputType.emailAddress,
                                onChanged: widget.presenter.validateEmail,
                              );
                            }),
                        const SizedBox(height: 8),
                        StreamBuilder<String>(
                            stream: widget.presenter.passwordErrorStream,
                            builder: (context, snapshot) {
                              return TextField(
                                decoration: InputDecoration(
                                  labelText: 'Senha',
                                  icon:
                                      Icon(Icons.lock, color: Theme.of(context).primaryColorLight),
                                  errorText: snapshot.data?.isEmpty == true ? null : snapshot.data,
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
