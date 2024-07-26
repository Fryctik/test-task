

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/data/local/models/order_model.dart';
import 'package:test/data/local/models/package.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  TextEditingController commentController = TextEditingController();
  OrderCubit()
      : super(OrderState(Order( city: '',
      address: '',
      doorway: '',
      floor: '',
      apartment: '',
      code: ''),Package(package1: '', package2: '', package3: '', package4: ''),'', DateTime.now() ,
  ),);

  void updateOrder(String city, String address, String floor, String code,
      String doorway, apartment ,) {
    emit(OrderState(
        Order(
            city: city,
            address: address,
            floor: floor,
            code: code,
            doorway: doorway,
            apartment: apartment),
        state.package,state.data,state.dateTime));
  }

  void updatePackage(String package1, String package2, String package3, String package4,String data,DateTime dateTime ,) {
    emit(OrderState(state.order,
        Package(package1: package1, package2: package2, package3: package3, package4:package4
            ) ,data , dateTime ,
        ));
  }

}
