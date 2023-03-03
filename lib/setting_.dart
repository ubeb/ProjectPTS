import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingCubit extends Cubit<ThemeData> {
  SettingCubit() : super(ThemeData.light());

  void toogleTheme() {
    if (state == ThemeData.light()) {
      emit(ThemeData.dark());
    } else {
      emit(ThemeData.light());
    }
  }
}
