import 'package:easy_go/screens/maps/applicationBloc.dart';

import 'package:easy_go/screens/wrapper.dart';
import 'package:easy_go/services/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'models/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Account>.value(
      initialData: null,
      value: AuthService().user,
      child: ChangeNotifierProvider(
        create: (context) => ApplicationBloc(),
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: Wrapper(),
        ),
      ),
    );
  }
}
