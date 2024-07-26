import 'package:bloc/bloc.dart';


part 'service_state.dart';

class ServiceCubit extends Cubit<ServiceState> {
String? city;
  ServiceCubit() : super(ServiceState(0 ,));

  void updateIndex(int index) {
    emit(ServiceState(index ,));
  }

}
