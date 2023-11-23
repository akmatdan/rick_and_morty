import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_rick_and_morty/bloc_observable.dart';
import 'app.dart';

void main() {
  Bloc.observer = CharacterBlocObservable();
  runApp(const App());
}
