import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:test/config/contstants/app_colors.dart';
import 'package:test/config/contstants/app_text_styles.dart';
import 'package:test/data/local/models/product_model.dart';
import 'package:test/generated/assets.dart';
import 'package:test/presentation/pages/main/manager/cart/cart_cubit.dart';
import 'package:test/presentation/pages/main/view/cart_view.dart';
import 'package:test/presentation/widgets/custom_back_button.dart';
import 'package:test/presentation/widgets/custom_common_button.dart';

class MoreMarketDetailView extends StatefulWidget {
  const MoreMarketDetailView({super.key, required this.product});
  final Product product;

  @override
  State<MoreMarketDetailView> createState() => _MoreMarketDetailViewState();
}

class _MoreMarketDetailViewState extends State<MoreMarketDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(children: [
        if (widget.product.size != null || widget.product.color != null)
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(top: 100),
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 350,
                    width: 350,
                    margin: EdgeInsets.only(left: 20, right: 20),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: AppColors.shade1),
                    child: Image.asset(
                      widget.product.imagePath,
                      height: 160,
                      width: 160,
                    ),
                  ),
                  SizedBox(height: 16),
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        widget.product.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.body32UnboundedSemiBold,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                      "${widget.product.price}₽",
                      style: AppTextStyles.body32UnboundedSemiBold
                          .copyWith(color: AppColors.accent),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Цвет",
                      style: AppTextStyles.body16GeologicaSemiBold,
                    ),
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  ColorButton(),
                  SizedBox(
                    height: 17,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Размер",
                      style: AppTextStyles.body16GeologicaSemiBold,
                    ),
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  SizeButton(),
                  SizedBox(
                    height: 24,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                      widget.product.desc,
                      style: AppTextStyles.body16GeologicaLight,
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  CommonWidgetButton(
                      colorButton: AppColors.main,
                      textColor: AppColors.white,
                      text: "В КОРЗИНУ",
                      openPath: () {
                        context.read<CartCubit>().addProduct(widget.product);
                        context.pushNamed("cart_view");
                      }),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          )
        else
          SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Container(
                    height: 350,
                    width: 350,
                    margin: EdgeInsets.only(left: 20, right: 20),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: AppColors.shade1),
                    child: Image.asset(
                      widget.product.imagePath,
                      height: 160,
                      width: 160,
                    ),
                  ),
                  SizedBox(height: 16),
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        widget.product.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.body32UnboundedSemiBold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                      "${widget.product.price}₽",
                      style: AppTextStyles.body32UnboundedSemiBold
                          .copyWith(color: AppColors.accent),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                      widget.product.desc,
                      style: AppTextStyles.body16GeologicaLight,
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  CommonWidgetButton(
                      colorButton: AppColors.main,
                      textColor: AppColors.white,
                      text: "В КОРЗИНУ",
                      openPath: () {
                        context.read<CartCubit>().addProduct(widget.product);
                        context.pushNamed("cart_view");
                      }),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ),
        Container(
          width: MediaQuery.sizeOf(context).width,
          color: AppColors.white,
          padding: const EdgeInsets.only(left: 20, right: 20, top: 59),
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
              SvgPicture.asset(
                Assets.iconsActiveCart,
                height: 24,
                width: 24,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

class ColorButton extends StatefulWidget {
  @override
  _ColorButtonState createState() => _ColorButtonState();
}

class _ColorButtonState extends State<ColorButton> {
  int _selectedContainerIndex = 0;

  void _onContainerTap(int index) {
    setState(() {
      _selectedContainerIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: List.generate(3, (index) {
          return GestureDetector(
            onTap: () => _onContainerTap(index),
            child: Container(
              margin: EdgeInsets.only(right: 16),
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: index == 0
                    ? AppColors.black
                    : index == 1
                        ? Color(0xffDDC6A5)
                        : Color(0xffC8C8C8),
                border: Border.all(
                  color: _selectedContainerIndex == index
                      ? AppColors.main
                      : Colors.transparent,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class SizeButton extends StatefulWidget {
  @override
  _SizeButtonState createState() => _SizeButtonState();
}

class _SizeButtonState extends State<SizeButton> {
  int _selectedSizeIndex = 0;
  final List<String> _sizes = ['S', 'M', 'L', 'XL'];

  void _onContainerTap(int index) {
    setState(() {
      _selectedSizeIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Align(
        child: Row(
          children: List.generate(_sizes.length, (index) {
            return GestureDetector(
              onTap: () => _onContainerTap(index),
              child: Container(
                margin: EdgeInsets.only(right: 16),
                width: 46,
                height: 42,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.shade1,
                  border: Border.all(
                    color: _selectedSizeIndex == index
                        ? AppColors.main
                        : Colors.transparent,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Text(_sizes[index],
                    style: AppTextStyles.body16UnboundedMedium),
              ),
            );
          }),
        ),
      ),
    );
  }
}
