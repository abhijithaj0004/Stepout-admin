import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepoutadminapp/buisnesslogic/pickimagecubit/pick_image_cubit.dart';
import 'package:stepoutadminapp/buisnesslogic/productdropdowncubit/product_list_cubit.dart';
import 'package:stepoutadminapp/pages/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PickImageCubit(),
        ),
        BlocProvider(
          create: (context) => ProductListCubit(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.grey),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
