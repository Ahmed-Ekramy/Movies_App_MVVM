import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';
import 'core/bloc_observsr.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp( const Movies());
}

