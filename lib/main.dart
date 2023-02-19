import 'package:dicoding_flutter_app/screens/only_login_page.dart';

import 'screens/alat_berat_detail.dart';
import 'package:flutter/material.dart';
import 'models/model_data_alat_berat.dart';
import 'screens/list_alat_berat.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      // home: const ListPage(),
      initialRoute: LoginPage.routeName,
      routes: {
        LoginPage.routeName: (context) => const LoginPage(),
        ListPage.routeName: (context) => const ListPage(),
        AlatBeratDetail.routeName: (context) => AlatBeratDetail(
            alatBeratYangDitap:
                ModalRoute.of(context)?.settings.arguments as AlatBerat),
      },
    );
  }
}
