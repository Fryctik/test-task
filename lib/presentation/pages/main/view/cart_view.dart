import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:test/config/contstants/app_colors.dart';
import 'package:test/config/contstants/app_text_styles.dart';
import 'package:test/generated/assets.dart';

import 'package:test/presentation/pages/main/manager/cart/cart_cubit.dart';
import 'package:test/presentation/pages/main/manager/cart/cart_state.dart';
import 'package:test/presentation/widgets/custom_back_button.dart';
import 'package:test/presentation/widgets/custom_common_button.dart';


class CartView extends StatelessWidget {
  const CartView({super.key,});

  @override
  Widget build(BuildContext context) {
    final cartCubit = context.read<CartCubit>();

    return Scaffold(
      backgroundColor: AppColors.white,

      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state.products.isEmpty) {
            return Center(child: Text("Пока что вы не добавили товары в корзину"));
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,top: 60),
                child: CustomBackButton(onBack: (){
                  context.pop();
                },),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: RichText(text: TextSpan(
                    text: "Корзина\nна ",
                    style: AppTextStyles.body32UnboundedSemiBold,
                    children: [
                      TextSpan(
                          text: "${context.read<CartCubit>().state.totalCost.toInt()}₽",
                        style: AppTextStyles.body32UnboundedSemiBold.copyWith(color: AppColors.main),
                      )
                    ]
                )),
              ),
              Expanded(
                child: ListView(

                  children: [

                    ...List.generate(state.products.length, (index){
                  final product = state.products.keys.elementAt(index);
                  final quantity = state.products[product];
                  return  Container(



          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 20),
          margin: EdgeInsets.only(bottom: 16),
          child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Container(
          height: 89,
          width: 89,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
          color: AppColors.shade1,
          borderRadius: BorderRadius.circular(24)
          ),
          child: Image.asset(product.imagePath)),
          Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          SizedBox(
          width:115,
          child: Text(product.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.body16GeologicaSemiBold,),
          ),
          SizedBox(height: 2,),
          Row(
          children: [
          product.size !=null? Text(product.size ?? "" ,style: AppTextStyles.body14GeologicaLight.copyWith(color: AppColors.shade3),) : SizedBox.shrink(),
          SizedBox(width: 5,),
          Text(product.color == AppColors.black ? "черный" : "белый",style: AppTextStyles.body14GeologicaLight.copyWith(color: AppColors.shade3),),
          ],
          ),
          SizedBox(height: 5,),

          Text("${int.tryParse(product.price)! * quantity!}₽",style:AppTextStyles.body16GeologicaSemiBold),
          ],
          ),
          Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
          Row(
          children: [
          GestureDetector(
          onTap: () {
          context.read<CartCubit>().decrementProduct(product);
          },
          child: Container(
          height:28,
          width: 28,
          padding: const EdgeInsets.all(9.0),
          decoration: BoxDecoration(
          color: AppColors.shade1,
          borderRadius: BorderRadius.circular(10)
          ),
          child: SvgPicture.asset(Assets.iconsMinus16x16,height:2,width: 7.5,fit: BoxFit.fitWidth,),
          ),
          ),
          SizedBox(width: 10,),
          Text('$quantity'),
          SizedBox(width: 10,),

          GestureDetector(
          onTap: () {
          context.read<CartCubit>().addProduct(product);
          },
          child: Container(
          height:28,
          width: 28,
          padding: const EdgeInsets.all(9.0),

          decoration: BoxDecoration(
          color: AppColors.shade1,
          borderRadius: BorderRadius.circular(10)
          ),
          child: SvgPicture.asset(Assets.iconsPlus16x16,height:2,width: 7.5,fit: BoxFit.fitWidth,),
          ),
          ),

          ],
          ),
          SizedBox(height: 20,),
          GestureDetector(

          child: SvgPicture.asset(Assets.iconsDisabledTrash),
          onTap: () {
          context.read<CartCubit>().deleteProduct(product);
          },
          ),

          ],
          ),

          ],
          ),
          );
          }
               ),

                  ],

                ),
              ),
              CommonWidgetButton(
                  colorButton: AppColors.main,
                  textColor: AppColors.white,
                  text: "ПЕРЕЙТИ К ОФОРМЛЕНИЮ", openPath: (){
                    context.pushNamed("process_delivery");
              }),
              SizedBox(height: 15,)

            ],
          );
        },
      ),

    );
  }
}






