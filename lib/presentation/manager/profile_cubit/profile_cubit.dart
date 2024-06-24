import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:test/data/local/models/profile_model.dart';

class ProfileCubit extends Cubit<Profile> {
  ProfileCubit()
      : super(Profile(
    phoneNumber: '',
    name: '',
    dateOfBirth:'',
    email: '',
    city: '',
    gender: '',
  ));

  void changeName(String newName) {
    emit(state.copyWith(name: newName));
  }

  void changeEmail(String newEmail) {
    emit(state.copyWith(email: newEmail));
  }

  void changeGender(String newGender) {
    emit(state.copyWith(gender: newGender));
  }


  void updatePhoneNumber(String newNumber) {
    emit(state.copyWith(phoneNumber: newNumber));
  }

  void changeBirthday(String newBirthday) {
    emit(state.copyWith(dateOfBirth: newBirthday));
  }

  void changeCity(String newCity) {
    emit(state.copyWith(city: newCity));
  }

  String convertDate(String date) {
    // Parse the date string
    DateTime parsedDate = DateFormat('dd.MM.yyyy').parse(date);

    // Format the date to the desired format
    String formattedDate = DateFormat('d MMMM yyyy', 'ru_RU').format(parsedDate);

    return formattedDate;
  }

  }