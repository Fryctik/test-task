import 'package:bloc/bloc.dart';
import 'package:test/data/local/models/product_model.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(const CartState());

  void addProduct(Product product) {
    final products = Map<Product, int>.from(state.products);
    if (products.containsKey(product)) {
      products[product] = products[product]! + 1;
    } else {
      products[product] = 1;
    }
    emit(state.copyWith(products: products));
  }

  void deleteProduct(Product product) {
    final products = Map<Product, int>.from(state.products);
    if (products.containsKey(product)) {
      products.remove(product);
    }
    emit(state.copyWith(products: products));
  }

  void decrementProduct(Product product) {
    final products = Map<Product, int>.from(state.products);
    if (products.containsKey(product)) {
      if (products[product]! > 1) {
        products[product] = products[product]! - 1;
      } else {
        products.remove(product);
      }
    }
    emit(state.copyWith(products: products));
  }

  void clearCart() {
    emit(state.copyWith(products: {}));
  }
}
