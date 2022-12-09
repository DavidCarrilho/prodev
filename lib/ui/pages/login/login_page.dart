import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prodev/ui/components/components.dart';
import 'package:provider/provider.dart';

import 'components/components.dart';
import 'login_presenter.dart';

class LoginPage extends StatelessWidget {
  final LoginPresenter presenter;

  const LoginPage({this.presenter});

  @override
  Widget build(BuildContext context) {
    void _hideKeyboard() {
      final currentFocus = FocusScope.of(context);
      if (currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
      }
    }

    return Scaffold(
      body: Builder(
        builder: (context) {
          presenter.isLoadingStream.listen((isLoading) {
            if (isLoading) {
              showLoading(context);
            } else {
              hideLoading(context);
            }
          });
          presenter.mainErrorStream.listen((error) {
            if (error?.isNotEmpty == true) {
              showErrorMessage(context, message: error);
            }
          });
          presenter.navigateToStream.listen((page) {
            if (page?.isNotEmpty == true) {
              Get.offAllNamed(page);
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
                          create: (_) => presenter,
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
