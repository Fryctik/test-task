
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/data/local/models/proccess_delivery_model.dart';
import 'package:test/data/local/models/order_address_model.dart';

part 'delivery_address_state.dart';

class DeliveryAddressCubit extends Cubit<DeliveryAddressState> {
DeliveryAddressCubit()
    : super(DeliveryAddressState(DeliveryAddress(
city: '',
name: '',
email: '',
number: '',
comment: '',
),
  OrderAddress(address: '',number: '',time: '', city: ''),''
));

void updateDeliveryAddress(String city,String name,String email,String number,String comment) {
emit(DeliveryAddressState(DeliveryAddress(
  city: city,
  name: name,
  email: email,
  number: number,
  comment:comment,
), state.orderAddress, state.comment));
}

void updateOrderAddress(String city,String address,String time,String number, String comment) {
  emit(DeliveryAddressState(state.deliveryAddress, OrderAddress(
    city: city,
    address: address,
    time: time,
    number: number,
  ), comment));
}
}

