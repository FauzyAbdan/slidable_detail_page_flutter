import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'list_alat_berat.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  static const routeName = '/login_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 234, 242, 239),
      body: Center(
        child: SingleChildScrollView(
          reverse: true,
          child: Container(
            // padding: EdgeInsets.only(top: 200),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 50),
                  width: 100,
                  height: 100,
                  child: Image.asset(
                    "assets/images/icon.png",
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: Center(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Silakan login untuk melanjutkan"),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10, bottom: 10, left: 30.0, right: 30),
                  child: Container(
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration:
                          InputDecoration(hintText: 'Masukkan email Anda'),
                      maxLines: 1,
                      maxLength: 40,
                      autofocus: true,
                      textInputAction: TextInputAction.next,
                      // The validator receives the text that the user has entered.
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10, bottom: 20, left: 30.0, right: 30),
                  child: Container(
                    child: TextFormField(
                      decoration:
                          InputDecoration(hintText: 'Masukkan password Anda'),
                      obscureText: true,
                      maxLines: 1,
                      maxLengthEnforcement: MaxLengthEnforcement.enforced,
                      textInputAction: TextInputAction.done,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 50),
                  child: Center(
                    child: ElevatedButton(
                      child: const Text('Login'),
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(200, 40),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12))),
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, ListPage.routeName);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
