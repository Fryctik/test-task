import 'package:test/data/local/models/product_model.dart';

class CartState   {
  final Map<Product, int> products;

  const CartState({this.products = const {}});

  CartState copyWith({Map<Product, int>? products}) {
    return CartState(products: products ?? this.products);
  }

  int get totalQuantity {
    return products.values.fold(0, (sum, quantity) => sum + quantity);
  }

  double get totalCost {
    return products.entries.fold(0, (sum, entry) {
      final price = double.tryParse(entry.key.price) ?? 0.0;
      return sum + price * entry.value;
    });
  }

  @override
  List<Object?> get props => [products];
}
