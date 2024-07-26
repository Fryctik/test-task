import 'package:bloc/bloc.dart';
import 'package:test/data/local/models/product_model.dart';
import 'package:test/generated/assets.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  Product selectedProduct = Product(
      title: 'Пакет 10 л',
      imagePath: Assets.imageImgPack1,
      price: '299',
      desc:
      """Наши фирменные пакеты для сортировки вторсырья из полиэтилен низкого давления
– Объем 10 л\n– Толщина 18 мм\n– Без ручек
Идеально подойдут под любой случай""");
  CartCubit() : super(const CartState());

  void changeSelectedProduct(Product product) {
    selectedProduct = product;
  }

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
