import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:test/config/contstants/app_colors.dart';
import 'package:test/config/contstants/app_text_styles.dart';
import 'package:test/config/contstants/strings.dart';
import 'package:test/generated/assets.dart';
import 'package:test/presentation/pages/main/components/custom_instraction_view.dart';
import 'package:test/presentation/pages/main/components/custom_tariff_view.dart';
import 'package:test/presentation/pages/main/manager/cart/cart_cubit.dart';
import 'package:test/presentation/pages/main/manager/cart/cart_state.dart';
import 'package:test/presentation/pages/only_nav_bar/manager/only_nav_bar_cubit.dart';
import 'package:test/presentation/widgets/cart_badge.dart';
import 'package:test/presentation/pages/only_nav_bar/view/scaffold_with_navbar.dart';

import 'package:test/presentation/widgets/custom_post_news.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> text = ['Новости', 'Тарифы', 'Инструкция'];

  int _selectedIndex = 0;

  final PageController _pageController = PageController();

  void _onButtonPressed(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    double maxScroll = _scrollController.position.maxScrollExtent;
    double currentScroll = _scrollController.position.pixels;
    double delta = maxScroll * 0.10;

    if (currentScroll >= delta) {
      if (!_showButton) {
        setState(() {
          _showButton = true;
        });
      }
    } else {
      if (_showButton) {
        setState(() {
          _showButton = false;
        });
      }
    }
  }

  final ScrollController _scrollController = ScrollController();
  bool _showButton = false;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              top:
              MediaQuery.of(context).viewPadding.top <= 52 ? 27.h : 0,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Builder(builder: (_) {
                        return GestureDetector(
                            onTap: () {
                              context.read<OnlyNavBarCubit>().scaffoldGlobalKey.currentState!.openDrawer();
                            },
                            child: SvgPicture.asset(
                              Assets.iconsMenu,
                              height: 24,
                              width: 24,
                              fit: BoxFit.cover,
                            ));
                      }),
                      Text(
                        "ГЛАВНАЯ",
                        style: AppTextStyles.body16UnboundedMedium,
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
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ...List.generate(text.length, (index) {
                        return GestureDetector(
                          onTap: () => _onButtonPressed(index),
                          child: Column(
                            children: [
                              Text(text[index],
                                  style: AppTextStyles.body16GeologicaSemiBold
                                      .copyWith(
                                          color: _selectedIndex == index
                                              ? AppColors.black
                                              : AppColors.shade3)),
                              SizedBox(
                                height: 6,
                              ),
                              _selectedIndex == index
                                  ? Container(
                                      height: 4,
                                      width: 105,
                                      decoration: BoxDecoration(
                                          color: AppColors.main,
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(100),
                                              topLeft: Radius.circular(100))),
                                    )
                                  : Container(
                                      height: 4,
                                      width: 105,
                                      decoration: const BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(100),
                                              topLeft: Radius.circular(100))),
                                    ),
                            ],
                          ),
                        );
                      }),
                    ],
                  ),
                ),
                Expanded(
                  child: PageView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                    children: [
                      ///Post News
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: ListView.builder(
                          padding: EdgeInsets.only(top: 10, bottom: 30),
                          controller: _scrollController,
                          itemCount: 6,
                          itemBuilder: (__, _) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: CustomPostNews(
                                  text:
                                      "Lorem Ipsum - это текст-, часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной  для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронн"),
                            );
                          },
                        ),
                      ),

                      ///Tariff
                      CustomTariffView(),

                      ///Instruction
                      CustomTabBarInstractionView(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: _selectedIndex == 0
            ? _showButton
                ? SizedBox(
                    height: 40,
                    width: 121,
                    child: FloatingActionButton(
                      backgroundColor: AppColors.main,
                      onPressed: () {
                        _scrollController.animateTo(
                          0.0,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              Assets.assetsIconsArrowUp,
                              height: 24,
                              width: 24,
                              colorFilter: const ColorFilter.mode(
                                  AppColors.white, BlendMode.srcIn),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Наверх",
                              style: AppTextStyles.body16GeologicaLight
                                  .copyWith(color: AppColors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                : null
            : null);
  }
}
