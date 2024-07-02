import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'only_nav_bar_state.dart';

class OnlyNavBarCubit extends Cubit<OnlyNavBarState> {

  final GlobalKey<ScaffoldState> scaffoldGlobalKey = GlobalKey<ScaffoldState>();

  OnlyNavBarCubit() : super(OnlyNavBarInitial());
}
