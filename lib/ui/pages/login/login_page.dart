import 'package:flutter/material.dart';
import 'package:prodev/ui/components/components.dart';
import 'package:provider/provider.dart';

import 'components/components.dart';
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

  void _hideKeyboard() {
    final currentFocus = FocusScope.of(context);
    if (currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
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
            if (error != null) {
              showErrorMessage(context, message: error);
            }
          });
          return SafeArea(
            child: GestureDetector(
              onTap: _hideKeyboard,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LoginHeader(),
                    const HeadLine4(text: 'Login'),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: Provider(
                          create: (_) => widget.presenter,
                          child: Form(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                EmailInput(),
                                const SizedBox(height: 8),
                                PasswordInput(),
                                const SizedBox(height: 32),
                                LoginButton(),
                                FlatButton.icon(
                                  onPressed: () {},
                                  icon: Icon(Icons.person),
                                  label: Text('Criar conta'.toUpperCase()),
                                )
                              ],
                            ),
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
              ),
            ),
          );
        },
      ),
    );
  }
}
