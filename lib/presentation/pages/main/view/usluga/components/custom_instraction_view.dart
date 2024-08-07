import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:test/config/contstants/app_colors.dart';
import 'package:test/config/contstants/app_text_styles.dart';
import 'package:test/config/contstants/strings.dart';
import 'package:test/generated/assets.dart';
import 'package:test/presentation/widgets/custom_instraction.dart';

class CustomTabBarInstractionView extends StatefulWidget {
  const CustomTabBarInstractionView({super.key, });

  @override
  State<CustomTabBarInstractionView> createState() =>
      _CustomTabBarInstractionViewState();
}

class _CustomTabBarInstractionViewState
    extends State<CustomTabBarInstractionView>
    with SingleTickerProviderStateMixin {
  List<String> instructionText = [
    'ПЛАСТИК',
    'СТЕКЛО',
    'МЕТАЛЛ',
    "МАКУЛАТУРА",
    "ОДЕЖДА",
    "ДОПОЛНИТЕЛЬНО"
  ];

  void _instructionButton(int index) {
    setState(() {
      _tabController.index = index;
    });
  }

  @override
  void dispose() {
    scrollControllers[0].dispose();
    scrollControllers[1].dispose();
    scrollControllers[2].dispose();
    scrollControllers[3].dispose();
    scrollControllers[4].dispose();
    scrollControllers[5].dispose();
    super.dispose();
  }

  bool isStretched = false;

  ScrollController scrollControllers1 = ScrollController();
  ScrollController scrollControllers2 = ScrollController();
  ScrollController scrollControllers3 = ScrollController();
  ScrollController scrollControllers4 = ScrollController();
  ScrollController scrollControllers5 = ScrollController();
  ScrollController scrollControllers6 = ScrollController();

  List<ScrollController> scrollControllers = [];

  void _scrollToTop(int i) async {
    if (scrollControllers[i].position.pixels ==
        scrollControllers[i].position.minScrollExtent) {
    } else {
      scrollControllers[i].animateTo(
        scrollControllers[i].position.minScrollExtent,
        duration: Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  late TabController _tabController;

  @override
  void initState() {
    scrollControllers.add(scrollControllers1);
    scrollControllers.add(scrollControllers2);
    scrollControllers.add(scrollControllers3);
    scrollControllers.add(scrollControllers4);
    scrollControllers.add(scrollControllers5);
    scrollControllers.add(scrollControllers6);
    _tabController = TabController(length: 6, vsync: this);
    super.initState();
  }

  final ScrollController _scrollController = ScrollController();
  void _scrollToIndex(int index) {
    double itemWidth = 100;
    double screenWidth = MediaQuery.of(context).size.width;

    double targetPos;
    if (index == 0 || index == 1) {
      targetPos = 0;
    } else if (index == 5) {
    targetPos = MediaQuery.sizeOf(context).width;
    } else {
      targetPos = index * itemWidth - (screenWidth - itemWidth) / 2;
    }

    if(targetPos == MediaQuery.sizeOf(context).width){

      _scrollController.animateTo(
        targetPos,
        duration: Duration(milliseconds: 400),
       curve: Curves.linear,
      );
return;
    }
    _scrollController.animateTo(
      targetPos,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                stretch: isStretched,
                backgroundColor: Colors.transparent,
                automaticallyImplyLeading: false,
                toolbarHeight: 0,
                // pinned: true,
                elevation: 0,
                scrolledUnderElevation: 0,
                titleSpacing: 0,
                collapsedHeight: 0,
                expandedHeight: 390.w,
                stretchTriggerOffset: 1,
                flexibleSpace: FlexibleSpaceBar(
                  titlePadding: EdgeInsets.zero,
                  expandedTitleScale: 1,
                  background: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "ЧТО МЫ ПРИНИМАЕМ И КАК ПОДГОТОВИТЬ ВТОРСЫРЬЕ\nК СДАЧЕ?",
                          style: AppTextStyles.body16UnboundedMedium,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                            """Чтобы отходы не были отправлены на мусорный полигон или не испортили чистую партию сырья, а получили вторую жизнь после переработки в новые материалы, пожалуйста, во время сортировки, обращайте внимание на маркировку. Она поможет определить, из какого материала состоит предмет.""",
                            style: AppTextStyles.body16GeologicaExtraLight),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                            "Также, мы просим вас ознакомиться с инструкцией по подготовке вторсырья к сдаче на переработку.",
                            style: AppTextStyles.body16GeologicaExtraLight),
                        const SizedBox(
                          height: 12,
                        ),
                        const Divider(
                          height: 1,
                          color: AppColors.shade1,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ];
          },
          body: Column(
            children: [
              Container(
                color: AppColors.white,
                // width: MediaQuery.of(context).size.width,
                height: 40,
                child: Center(
                  child: ListView.builder(
                    controller: _scrollController,
                    scrollDirection: Axis.horizontal,
                    itemCount: instructionText.length,
                    itemBuilder: (_, index) {
                      return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: GestureDetector(
                            onTap: () {

                              _scrollToIndex(index);

                              print('doing');
                              _instructionButton(index);
                              print('doing1');

                              Future.delayed(Duration(milliseconds: 500), () {
                                print('doing2');
                                _scrollToTop(index);
                                print('doing3');
                              });
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(instructionText[index],
                                  style: AppTextStyles.body16GeologicaSemiBold
                                      .copyWith(
                                          color: _tabController.index == index
                                              ? AppColors.black
                                              : AppColors.shade3)),
                            ),
                          ));
                    },
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: _tabController,
                  children: <Widget>[
                    ///plastik
                    ListView.builder(
                      key: PageStorageKey<String>("1"),
                      controller: scrollControllers[0],
                      padding: EdgeInsets.only(top: 0),
                      itemCount: 1,
                      itemBuilder: (__, _) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset(Assets.iconsAccept,height: 24,width: 24, color: AppColors.accent, fit: BoxFit.cover,),
                                      SizedBox(width: 5,),
                                      Text(
                                        "ПЛАСТИК, КОТОРЫЙ МЫ\nПРИНИМАЕМ:",
                                        maxLines: 2,
                                        style: AppTextStyles.body16UnboundedMedium,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        Assets.instructionCaution1,
                                        height: 43,
                                        width: 43,
                                        fit: BoxFit.cover,
                                      ),
                                      const SizedBox(width: 8.0),
                                      Expanded(
                                        child: Text(
                                          '1 ПЭТ ПЭТФ | PET-полиэтилентерефталат или лавсан',
                                          style: AppTextStyles
                                              .body16GeologicaLight,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 12.0),
                                  Text(
                                    'Существует два вида ПЭТ:',
                                    style: AppTextStyles.body16GeologicaLight,
                                  ),
                                  const SizedBox(height: 8.0),
                                  RichText(
                                      text: TextSpan(
                                          text: "1. Бутылочный ",
                                          style: AppTextStyles
                                              .body16GeologicaSemiBold,
                                          children: [
                                        TextSpan(
                                          text:
                                              "(бутылки от напитков, моющих средств, шампуней, гелей для душа, средств для умывания и тд.);",
                                          style: AppTextStyles
                                              .body16GeologicaLight,
                                        )
                                      ])),
                                  RichText(
                                      text: TextSpan(
                                          text: "2. НЕбутылочный ",
                                          style: AppTextStyles
                                              .body16GeologicaSemiBold,
                                          children: [
                                        TextSpan(
                                          text:
                                              "(баночки от таблеток, пивные кеги, одноразовые контейнеры, ёмкости от косметических средств, стаканчики, подложки для конфет, упаковка из-под зубных щёток, батареек, игрушек и тд.).",
                                          style: AppTextStyles
                                              .body16GeologicaLight,
                                        )
                                      ])),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Divider(
                                    height: 1,
                                    color: AppColors.shade1,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                            const CustomInstraction(
                              desc:
                                  'Такой полужесткий упаковочный пластик высокой плотности необходим для изготовления бутылок, банок, ящиков, канистр, пакетов, контейнеров, труб, крышек от бутылок для напитков и упаковок тетрапак, ёмкостей для бытовой химии, варочных пакетиков для круп, вёдер, стаканчиков для йогурта, упаковки для линз и тд.',
                              title:
                                  '2 ПНД | PE-HD- полиэтилен высокой плотности низкого давления',
                              img: Assets.instructionCaution2,
                            ),
                            const CustomInstraction(
                                title:
                                    "4 ПЭВД | PE-LD - полиэтилен высокого давления",
                                desc:
                                    "Это неплотный пластик, который используется для разного вида пленок, пакетов, мешков, брезента, упаковки из-под бытовой техники, порошка, подгузников, туалетной бумаги, ватных дисков и палочек",
                                img: Assets.instructionCaution4),
                            const CustomInstraction(
                                title: "5 ПП | PP- полипропилен.",
                                desc:
                                    "Чаще всего применяется в изготовлении мебели, садовых и автомобильных принадлежностей, труб, упаковки еды, игрушек, шуршащих пакетов, детских сосок, шприцов, трубочек для напитков, множество хозяйственных предметов, таких как тазы, лейки, вёдра, горшки для цветов, пакеты для сахара, хлеба",
                                img: Assets.instructionCaution5),
                            const CustomInstraction(
                                title: "6 ПС | PS- полистирол",
                                desc:
                                    "Из данного вида пластика производят одноразовую посуду, канцелярскую продукцию, коробки для хранения, лотки для овощей и фруктов, вспененные упаковки для яиц, крышки от одноразовых стаканчиков, упаковку для компакт-дисков, пенопласт",
                                img: Assets.instructionCaution6),
                            SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                children: [
                                  SvgPicture.asset(Assets.iconsNotAccept,height: 24,width: 24,fit: BoxFit.cover,),
                                  SizedBox(width: 5,),
                                  Text(
                                    "ПЛАСТИК, КОТОРЫЙ МЫ НЕ\nПРИНИМАЕМ:",
                                    style: AppTextStyles.body16UnboundedMedium,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            const CustomInstraction(
                                title: "3 ПВХ | PVC– поливинилхлорид",
                                desc:
                                    "ПВХ – материал для изготовления мебели, труб, строительных товаров, термоусадочной плёнки, некоторой пищевой плёнки, плавательных принадлежностей, блистерной упаковки, ПВХ-окон, упаковки для тортов, клеенки, шторок для душа, а иногда и для новогодних ёлок",
                                img: Assets.instructionCaution3),
                            const CustomInstraction(
                                title: "7 Other | Другое",
                                desc:
                                    "Смесь пластиков и полимеров, не указанных выше (вакуумные упаковки колбасных изделий, сыров, рыбы, упаковки корма для животных, кофе, материал для больших бутылок, теплиц, мебели, плафонов, прозрачных изделий и многого другого",
                                img: Assets.instructionCaution7),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        Assets.instructionCaution9,
                                        height: 43,
                                        width: 43,
                                        fit: BoxFit.cover,
                                      ),
                                      const SizedBox(width: 8.0),
                                      Expanded(
                                        child: Text(
                                          "9 АБС | ABS",
                                          style: AppTextStyles
                                              .body16GeologicaLight,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8.0),
                                  Text(
                                    "Акрилонитрил, бутадиен, стирол (корпуса телевизоров, телефонов, компьютеров, распечатанные на 3D-принтере компоненты, не являющиеся биопластиками, такими как PLA.",
                                    style: AppTextStyles.body16GeologicaLight,
                                  ),
                                  const SizedBox(height: 8.0),
                                  BulletPoint(
                                      text:
                                          'Упаковка с кодом С/PP (для заморозки овощей);'),
                                  BulletPoint(
                                      text:
                                          'Пакеты из биоразлагаемого материала;'),
                                  BulletPoint(
                                      text:
                                          'Конфетные фантики и любую мягкая упаковКУ с фольгированным слоем со знаком PP;'),
                                  BulletPoint(
                                      text:
                                          'Плетёные мешки из - под сахара, картошки, строительного мусора и плетёные сетки от овощей и фруктов;'),
                                  BulletPoint(text: 'Грязные лотки для мяса;'),
                                  BulletPoint(text: 'Сырьё без маркировки.'),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                "КАК ПОДГОТОВИТЬ ПЛАСТИК К СДАЧЕ?",
                                style: AppTextStyles.body16UnboundedMedium,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                "Твердый пластик",
                                style: AppTextStyles.body16GeologicaSemiBold,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            InstructionItem(
                              number: 1,
                              text:
                                  'Весь твердый пластик необходимо очистить от пищевых отходов и других загрязнений.',
                            ),
                            InstructionItem(
                              number: 2,
                              text:
                                  'Удалить бумажные и металлические элементы, наклейки, этикетки, скотч и термоусадочную пленку.',
                            ),
                            InstructionItem(
                              number: 3,
                              text:
                                  'Снять крышки. Их можно сдать отдельно.',
                            ),
                            InstructionItem(
                              number: 4,
                              text:
                                  'Вымыть и высушить пластиковые тары. Не заполняйте бутылки другими изделиями из пластика.',
                            ),
                            InstructionItem(
                              number: 5,
                              text:
                                  'Разделить по разным пакетам бутылочный ПЭТ и НЕбутылочный, так как смешивать эти 2 вида нельзя. В противном случае, сырьё не будет обладать нужными свойствами.',
                            ),
                            InstructionItem(
                              number: 6,
                              text:
                                  'Каждый вид сложить отдельно друг от друга.',
                            ),
                            InstructionItem(
                              number: 7,
                              text:
                                  'При возможности, спрессовать сырье, перевязать веревкой, компактно сложить в пакет или коробку, чтобы оно занимало меньше места.',
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Divider(
                              height: 1,
                              color: AppColors.shade1,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                "Мягкий пластик",
                                style: AppTextStyles.body16GeologicaSemiBold,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            InstructionItem(
                              number: 1,
                              text:
                                  'Весь мягкий пластик необходимо очистить от пищевых отходов и других загрязнений.',
                            ),
                            InstructionItem(
                              number: 2,
                              text:
                                  'Удалить бумажные и металлические элементы, наклейки, этикетки, скотч и тд.',
                            ),
                            InstructionItem(
                              number: 3,
                              text: 'Вымыть и высушить пластиковые отходы.',
                            ),
                            InstructionItem(
                              number: 4,
                              text:
                                  'Разделите мягкий пластик на прозрачный и цветной (с изображениями или надписями).',
                            ),
                            InstructionItem(
                              number: 5,
                              text:
                                  'Каждый вид сложить отдельно друг от друга.',
                            ),
                            InstructionItem(
                              number: 6,
                              text:
                                  'При возможности, спрессовать сырье, перевязать веревкой и компактно сложить в пакет или коробку, чтобы оно занимало меньше места.',
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                          ],
                        );
                      },
                    ),

                    ///steklo
                    ListView.builder(
                        controller: scrollControllers[1],
                        key: PageStorageKey<String>("2"),
                        itemCount: 1,
                        padding: EdgeInsets.zero,
                        itemBuilder: (__, _) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(Assets.iconsAccept, color: AppColors.accent, height: 24,width: 24,fit: BoxFit.cover,),
                                    SizedBox(width: 5,),
                                    Text(
                                      "СТЕКЛО, КОТОРОЕ МЫ\nПРИНИМАЕМ:",
                                      style: AppTextStyles.body16UnboundedMedium,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              const CustomInstraction(
                                  title: "70 GL — прозрачное стекло.",
                                  desc: '',
                                  img: AppStrings.steklo70),
                              const CustomInstraction(
                                  title: "71 GL — зеленое стекло.",
                                  desc: '',
                                  img: AppStrings.steklo71),
                              const CustomInstraction(
                                  title: "72 GL — коричневое стекло.",
                                  desc: '',
                                  img: AppStrings.steklo72),
                              const CustomInstraction(
                                  title:
                                      "73 GLS — темно-коричневое бутылочное стекло.",
                                  desc: '',
                                  img: AppStrings.steklo73),
                              const CustomInstraction(
                                  title:
                                      "74 GLS — светло-коричневое бутылочное стекло.",
                                  desc: '',
                                  img: AppStrings.steklo74),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(Assets.iconsNotAccept,height: 24,width: 24,fit: BoxFit.cover,),
                                    SizedBox(width: 5,),
                                    Text(
                                      "СТЕКЛО, КОТОРОЕ МЫ НЕ\nПРИНИМАЕМ:",
                                      style: AppTextStyles.body16UnboundedMedium,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  children: [
                                    BulletPoint(
                                        text:
                                            'Банки и бутылки нестандартных форм;'),
                                    BulletPoint(
                                        text:
                                            'Хрустальную и керамическую посуда;'),
                                    BulletPoint(text: 'Лампочки;'),
                                    BulletPoint(text: 'Зеркала;'),
                                    BulletPoint(text: 'Экраны;'),
                                    BulletPoint(
                                        text: 'Оконные и оптические стекла;'),
                                    BulletPoint(text: 'Сырьё без маркировки.'),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  "КАК ПОДГОТОВИТЬ СТЕКЛО К СДАЧЕ?",
                                  style: AppTextStyles.body16UnboundedMedium,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              InstructionItem(
                                number: 1,
                                text:
                                    'Стекло необходимо очистить от пищевых отходов и других загрязнений.',
                              ),
                              InstructionItem(
                                number: 2,
                                text:
                                    'Удалить бумажные и металлические элементы, наклейки, этикетки, скотч, крышки, пробки, дозаторы и тд.',
                              ),
                              InstructionItem(
                                number: 3,
                                text: 'Вымыть и высушить стеклянные тары.',
                              ),
                              InstructionItem(
                                number: 4,
                                text:
                                    'Каждый вид сложить отдельно друг от друга.',
                              ),
                              InstructionItem(
                                number: 5,
                                text:
                                    'При возможности, спрессуйте сырье, перевяжите веревкой и компактно упаковать в пакет или коробку, чтобы оно занимало меньше места.',
                              ),
                              SizedBox(height: 16,)
                            ],
                          );
                        }),

                    ///metall

                    ListView.builder(
                        controller: scrollControllers[2],
                        key: PageStorageKey<String>("3"),
                        padding: EdgeInsets.zero,
                        itemCount: 1,
                        itemBuilder: (__, _) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(Assets.iconsAccept, color: AppColors.accent, height: 24,width: 24,fit: BoxFit.cover,),
                                    SizedBox(width: 5,),
                                    Text(
                                      "МЕТАЛЛ, КОТОРЫЙ МЫ\nПРИНИМАЕМ:",
                                      style: AppTextStyles.body16UnboundedMedium,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              const CustomInstraction(
                                  title: "40 FE – сталь.",
                                  desc:
                                      "Чаще всего встречается в производстве консервных банок, аэрозольных баллончиков.",
                                  img: AppStrings.metal40),
                              const CustomInstraction(
                                  title: "41 ALU – алюминий.",
                                  desc:
                                      "Из алюминия делают тюбики для крема, банки для напитков.",
                                  img: AppStrings.metal41),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(Assets.iconsNotAccept,height: 24,width: 24,fit: BoxFit.cover,),
                                    SizedBox(width: 5,),
                                    Text(
                                      "МЕТАЛ, КОТОРЫЙ МЫ НЕ\nПРИНИМАЕМ:",
                                      style: AppTextStyles.body16UnboundedMedium,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  children: [
                                    BulletPoint(
                                        text: 'Фольгу, фольгированную пленку;'),
                                    BulletPoint(text: 'Газовые баллончики;'),
                                    BulletPoint(text: 'Сырьё без маркировки.'),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  "КАК ПОДГОТОВИТЬ МЕТАЛ К СДАЧЕ?",
                                  style: AppTextStyles.body16UnboundedMedium,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              InstructionItem(
                                number: 1,
                                text:
                                    'Тару необходимо очистить от пищевых отходов и других загрязнений.',
                              ),
                              InstructionItem(
                                number: 2,
                                text: 'Вымыть и высушить.',
                              ),
                              InstructionItem(
                                number: 3,
                                text:
                                    'Баллончики полностью опустошить от содержимого и проткнуть.',
                              ),
                              InstructionItem(
                                number: 4,
                                text:
                                    'Каждый вид сложить отдельно друг от друга.',
                              ),
                              InstructionItem(
                                number: 5,
                                text:
                                    'При возможности, спрессовать сырье, перевязать веревкой и компактно сложить в пакет или коробку, чтобы оно занимало меньше места.',
                              ),
                              SizedBox(height: 16,)
                            ],
                          );
                        }),

                    ///makalatura
                    ListView.builder(
                        key: PageStorageKey<String>("4"),
                        controller: scrollControllers[3],
                        padding: EdgeInsets.zero,
                        itemCount: 1,
                        itemBuilder: (__, _) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(Assets.iconsAccept, color: AppColors.accent, height: 24,width: 24,fit: BoxFit.cover,),
                                    SizedBox(width: 5,),
                                    Text(
                                      "МАКУЛАТУРА, КОТОРУЮ МЫ\nПРИНИМАЕМ:",
                                      style: AppTextStyles.body16UnboundedMedium,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20),
                              const CustomInstraction(
                                  title: "20 PAP – гофрированный картон.",
                                  desc:
                                      "Из гофрокартона делают коробки для техники, посылок, продуктов, косметики, ящики, гофрокоробы и т.д.",
                                  img: AppStrings.makalatura20),
                              const CustomInstraction(
                                  title: "21 PAP – картон.",
                                  desc:
                                      "В него входят книжные обложки, открытки, упаковки для лекарств и БАДов, подарочные коробки, бумажные стаканчики без слоя пластика и др.",
                                  img: AppStrings.makalatura21),
                              const CustomInstraction(
                                  title: "22 PAP – бумага. ",
                                  desc:
                                      "Это газеты, журналы, бумажные пакеты, бумага для печати, мешки, оберточный материал.",
                                  img: AppStrings.makalatura22),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(Assets.iconsAccept, color: AppColors.accent, height: 24,width: 24,fit: BoxFit.cover,),
                                    SizedBox(width: 5,),
                                    Text(
                                      "МАКУЛАТУРА, КОТОРУЮ МЫ\nНЕ ПРИНИМАЕМ:",
                                      style: AppTextStyles.body16UnboundedMedium,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          AppStrings.makalatura23,
                                          height: 43,
                                          width: 43,
                                          fit: BoxFit.cover,
                                        ),
                                        const SizedBox(width: 8.0),
                                        Expanded(
                                          child: Text(
                                            "23 PAP - вощеная бумага.\nУпаковку для посылок и декора букетов);",
                                            style: AppTextStyles
                                                .body16GeologicaLight,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8.0),
                                    BulletPoint(
                                        text:
                                            'Бумага/картон, покрытая лаками, красками и синтетическими материалами;'),
                                    BulletPoint(
                                        text:
                                            'Бумага/картон, пропитанная синтетическими смолами или мазутом;'),
                                    BulletPoint(
                                        text:
                                            'Бумага/картон, пропитанная жирами или маслами;'),
                                    BulletPoint(text: 'Обои;'),
                                    BulletPoint(text: 'Чеки;'),
                                    BulletPoint(text: 'Бумагу для факса;'),
                                    BulletPoint(text: 'Папиросная бумага;'),
                                    BulletPoint(
                                        text:
                                            'Прелую, гнилую и горелую бумагу (картон);'),
                                    BulletPoint(
                                        text:
                                            'Ламинированную бумагу (надорвите край и проверьте, есть ли пленка на месте разрыва);'),
                                    BulletPoint(
                                        text:
                                            'Бумажные салфетки, полотенца, туалетную бумагу;'),
                                    BulletPoint(
                                        text: 'Бумагу с восковой пропиткой;'),
                                    BulletPoint(
                                        text:
                                            'Кальку, копировальную бумагу, бумагу для выпечки;'),
                                    BulletPoint(
                                        text:
                                            'Многослойную бумагу с тканью (например, марлей);'),
                                    BulletPoint(text: 'Сырьё без маркировки.'),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  "КАК ПОДГОТОВИТЬ МАКУЛАТУРУ К СДАЧЕ?",
                                  style: AppTextStyles.body16UnboundedMedium,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              InstructionItem(
                                number: 1,
                                text:
                                    'Макулатуру необходимо очистить от пищевых отходов и других загрязнений.',
                              ),
                              InstructionItem(
                                number: 2,
                                text:
                                    'Удалить металлические пружины, скрепки, пластиковые вставки, кнопки, следы клея, этикеток, наклеек, закладок и тд.',
                              ),
                              InstructionItem(
                                number: 3,
                                text:
                                    'Каждый вид сложить отдельно друг от друга.',
                              ),
                              InstructionItem(
                                number: 4,
                                text:
                                    'При возможности, спрессовать сырье, перевязать веревкой и компактно сложить в пакет или коробку, чтобы оно занимало меньше места.',
                              ),
                              SizedBox(height: 16,)
                            ],
                          );
                        }),

                    ///odejda
                    ListView.builder(
                        controller: scrollControllers[4],
                        key: PageStorageKey<String>("5"),
                        padding: EdgeInsets.zero,
                        itemCount: 1,
                        itemBuilder: (__, _) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(Assets.iconsAccept, color: AppColors.accent, height: 24,width: 24,fit: BoxFit.cover,),
                                    SizedBox(width: 5,),
                                    Text(
                                      "ОДЕЖДА, КОТОРУЮ МЫ\nПРИНИМАЕМ:",
                                      style: AppTextStyles.body16UnboundedMedium,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  """ТОЛЬКО ту одежду, которую можно передать в благотворительный фонд для нуждающихся, с возможностью дальнейшей носки (новую или в хорошем состоянии).
А именно, чистую, постиранную и глаженную одежду, без запахов и дефектов (катышек, дырок, пятен).
Головные уборы зимние и летние (чистые, без заломов и следов носки).
Новое и обязательно с бирками нижнее белье, колготки, купальники, носки.
Сумки (с рабочей молнией, фурнитурой, не потертыми ручками и с чистой подкладкой).
Обувь (без потертостей, заломов, с рабочей молнией и фурнитурой).""",

                                  style: AppTextStyles.body16GeologicaLight,
                                ),
                              ),

                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: const Divider(
                                  height: 1,
                                  color: AppColors.shade1,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(Assets.iconsNotAccept,height: 24,width: 24,fit: BoxFit.cover,),
                                    SizedBox(width: 5,),
                                    Text(
                                      "ОДЕЖДА, КОТОРУЮ МЫ НЕ\nПРИНИМАЕМ:",
                                      style: AppTextStyles.body16UnboundedMedium,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  children: [
                                    BulletPoint(
                                        text:
                                            'Грязную, рваную и непригодную для носки одежду;'),
                                    BulletPoint(
                                        text:
                                            'Старое и ношеное нижнее белье, колготки, купальники, носки;'),
                                    BulletPoint(
                                        text:
                                            'Влажную и заплесневевшую одежду.'),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  "КАК ПОДГОТОВИТЬ ОДЕЖДУ К СДАЧЕ?",
                                  style: AppTextStyles.body16UnboundedMedium,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              InstructionItem(
                                number: 1,
                                text:
                                    'Постирать и хорошо высушить ту одежду, которую хотите сдать',
                              ),
                              InstructionItem(
                                number: 2,
                                text: 'Погладить либо отпарьте ее.',
                              ),
                              InstructionItem(
                                number: 3,
                                text:
                                    'Разложить в разные пакеты одежду, обувь и сумки.',
                              ),
                              InstructionItem(
                                number: 4,
                                text:
                                    'Проверить карманы на наличие личных вещей.',
                              ),
                              SizedBox(height: 16,)
                            ],
                          );
                        }),

                    ///dopolnitelno
                    ListView.builder(
                        key: PageStorageKey<String>("6"),
                        controller: scrollControllers[5],
                        padding: EdgeInsets.zero,
                        itemCount: 1,
                        itemBuilder: (__, _) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(Assets.iconsAccept, color: AppColors.accent, height: 24,width: 24,fit: BoxFit.cover,),
                                    SizedBox(width: 5,),
                                    Text(
                                      "ДОПОЛНИТЕЛЬНО МЫ\nПРИНИМАЕМ:",
                                      style: AppTextStyles.body16UnboundedMedium,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  children: [
                                    BulletPoint(
                                        text:
                                            'Tetra pack  и его аналоги (PurePak, EloPak, SIG Combibloc);'),
                                    BulletPoint(
                                        text:
                                            'Крышки от бутылок (в соответствии с маркировкой);'),
                                    BulletPoint(text: 'Батарейки.'),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  "КАК ПОДГОТОВИТЬ TETRA PACK К СДАЧЕ?",
                                  style: AppTextStyles.body16UnboundedMedium,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              InstructionItem(
                                number: 1,
                                text:
                                    'Tetra pack необходимо очистить от пищевых отходов и других загрязнений.',
                              ),
                              InstructionItem(
                                number: 2,
                                text: 'Снять крышки. Их можно сдать отдельно.',
                              ),
                              InstructionItem(
                                number: 3,
                                text:
                                    'Вымыть и высушить упаковки (для более эффективного очищения разрежьте и отогните все уголки).',
                              ),
                              InstructionItem(
                                number: 4,
                                text:
                                    'Каждый вид сложите отдельно друг от друга.',
                              ),
                              InstructionItem(
                                number: 5,
                                text:
                                    'При возможности, спрессуйте сырье, перевяжите веревкой и компактно сложите в пакет или коробку, чтобы оно занимало меньше места.',
                              ),
                              SizedBox(height: 16,)
                            ],
                          );
                        })
                  ],
                ),
              ),
            ],
          ),
        ))
      ],
    );
  }
}

class BulletPoint extends StatelessWidget {
  final String text;

  BulletPoint({required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '• ',
          style: AppTextStyles.body16UnboundedBold,
        ),
        Expanded(
          child: Text(
            text,
            style: AppTextStyles.body16GeologicaLight,
          ),
        ),
      ],
    );
  }
}

class InstructionItem extends StatelessWidget {
  final int number;
  final String text;

  InstructionItem({required this.number, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$number. ',
            style: AppTextStyles.body16GeologicaLight,
          ),
          Expanded(
            child: Text(
              text,
              style: AppTextStyles.body16GeologicaLight,
            ),
          ),
        ],
      ),
    );
  }
}
