import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:test/config/contstants/app_colors.dart';
import 'package:test/config/contstants/app_text_styles.dart';
import 'package:test/data/local/models/product_model.dart';
import 'package:test/generated/assets.dart';
import 'package:test/presentation/pages/main/manager/cart/cart_cubit.dart';
import 'package:test/presentation/pages/main/manager/cart/cart_state.dart';
import 'package:test/presentation/pages/main/view/market/more_market_detail_view.dart';
import 'package:test/presentation/widgets/cart_badge.dart';
import 'package:test/presentation/widgets/custom_back_button.dart';

class CustomMarketView extends StatefulWidget {
  const CustomMarketView({super.key});

  @override
  State<CustomMarketView> createState() => _CustomMarketViewState();
}

class _CustomMarketViewState extends State<CustomMarketView> {
  final List<Product> products = [
    Product(
        title: 'Пакет 10 л',
        imagePath: Assets.imageImgPack1,
        price: '299',
        desc:
            """Наши фирменные пакеты для сортировки вторсырья из полиэтилен низкого давления
– Объем 10 л\n– Толщина 18 мм\n– Без ручек
Идеально подойдут под любой случай"""),
    Product(
        title: 'Пакет 20 л',
        imagePath: Assets.imageImgPack2,
        price: '299',
        desc:
            """Наши фирменные пакеты для сортировки вторсырья из полиэтилен низкого давления
– Объем 10 л\n– Толщина 18 мм\n– Без ручек
Идеально подойдут под любой случай"""),
    Product(
        title: 'Футболка с принтом',
        imagePath: Assets.imageImgShirt,
        price: '1399',
        size: "L",
        color: AppColors.white,
        desc: "Сумка-шоппер тканевая из хлопка, двунитка плотности 240г/м.кв"),
    Product(
        title: 'Шоппер',
        imagePath: Assets.imageImgBackpack1,
        price: '1299',
        size: "M",
        color: AppColors.black,
        desc: "Сумка-шоппер тканевая из хлопка, двунитка плотности 240г/м.кв"),
    Product(
        title: 'Пакет 10 л',
        imagePath: Assets.imageImgBackpack2,
        price: '299',
        size: "L",
        color: AppColors.black,
        desc: "Сумка-шоппер тканевая из хлопка, двунитка плотности 240г/м.кв"),
    Product(
        title: 'Пакет 10 л',
        imagePath: Assets.imageImgBackpack3,
        price: '299',
        size: "XL",
        color: AppColors.black,
        desc: "Сумка-шоппер тканевая из хлопка, двунитка плотности 240г/м.кв"),
    Product(
        title: 'Пакет 10 л',
        imagePath: Assets.imageImgPack1,
        price: '299',
        desc:
            """Наши фирменные пакеты для сортировки вторсырья из полиэтилен низкого давления
– Объем 10 л\n– Толщина 18 мм\n– Без ручек
Идеально подойдут под любой случай"""),
    Product(
        title: 'Пакет 10 л',
        imagePath: Assets.imageImgPack1,
        price: '299',
        desc:
            """Наши фирменные пакеты для сортировки вторсырья из полиэтилен низкого давления
– Объем 10 л\n– Толщина 18 мм\n– Без ручек
Идеально подойдут под любой случай"""),
    Product(
        title: 'Пакет 20 л',
        imagePath: Assets.imageImgPack2,
        price: '299',
        desc:
            """Наши фирменные пакеты для сортировки вторсырья из полиэтилен низкого давления
– Объем 10 л\n– Толщина 18 мм\n– Без ручек
Идеально подойдут под любой случай"""),
    Product(
        title: 'Футболка с принтом',
        imagePath: Assets.imageImgShirt,
        price: '1399',
        size: "M",
        color: AppColors.white,
        desc: "Сумка-шоппер тканевая из хлопка, двунитка плотности 240г/м.кв"),
    Product(
        title: 'Шоппер',
        imagePath: Assets.imageImgBackpack1,
        price: '1299',
        desc: "Сумка-шоппер тканевая из хлопка, двунитка плотности 240г/м.кв"),
    Product(
        title: 'Пакет 10 л',
        imagePath: Assets.imageImgBackpack2,
        price: '299',
        size: "XL",
        color: AppColors.black,
        desc: "Сумка-шоппер тканевая из хлопка, двунитка плотности 240г/м.кв"),
    Product(
        title: 'Пакет 10 л',
        imagePath: Assets.imageImgBackpack3,
        price: '299',
        size: "L",
        color: AppColors.black,
        desc: "Сумка-шоппер тканевая из хлопка, двунитка плотности 240г/м.кв"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width,
              color: AppColors.white,
              padding: EdgeInsets.only(left: 20, right: 20, top: MediaQuery.of(context).viewPadding.top <= 52 ? 20.h : 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomBackButton(onBack: () {
                    context.pop();
                  }),
                  Padding(
                    padding: const EdgeInsets.only(right: 40),
                    child: Text(
                      "МАРКЕТ",
                      style: AppTextStyles.body16UnboundedMedium,
                    ),
                  ),
                  GestureDetector(onTap: () {
                    context.pushNamed("cart_view");
                  }, child: BlocBuilder<CartCubit, CartState>(
                    builder: (context, cart) {
                      return CartBadge(itemCount: cart.products.length);
                    },
                  )),
                ],
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: 225,
                        crossAxisCount: 2, // Number of columns
                        crossAxisSpacing: 12, // Horizontal space between items
                        mainAxisSpacing: 19, // Vertical space between items
                      ),
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MoreMarketDetailView(
                                          product: products[index])));
                            },
                            child: ProductCard(product: products[index]));
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 238.h,
      width: 173,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 173,
            width: 173,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColors.shade1),
            child: Image.asset(
              product.imagePath,
              height: 160,
              width: 160,
            ),
          ),
          // SizedBox(height: 5),
          Text(
            product.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.body16GeologicaSemiBold,
          ),
          // SizedBox(height: 5),
          Text(
            "${product.price}₽",
            style: AppTextStyles.body16GeologicaLight
                .copyWith(color: AppColors.shade3),
          ),
        ],
      ),
    );
  }
}
