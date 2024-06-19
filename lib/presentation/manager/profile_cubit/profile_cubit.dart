import 'package:flutter_bloc/flutter_bloc.dart';
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

  }