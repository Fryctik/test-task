import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'achievements_state.dart';

class AchievementsCubit extends Cubit<int> {
  AchievementsCubit() : super(2);

  void updateAchievementIndex(int index) {
    emit(index);
  }
}
