import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza_app/app.dart';
import 'package:pizza_app/simple_bloc_observer.dart';
import 'package:user_repository/user_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: FirebaseOptions(
    apiKey: "AIzaSyB58W5_m-pKhtuekQcbIrutKRBNMVC4Y2M",
    appId: "1:1037794245081:android:5ae143b722b7350ec1c1c8",
    messagingSenderId: "1037794245081",
    projectId: "pizza-delivery-20bac"
    ));
  // As the global observer of BLOCS
  Bloc.observer = SimpleBlocObserver();

  runApp(MyApp(FirebaseUserRepo()));
}