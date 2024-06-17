import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test/config/contstants/app_colors.dart';
import 'package:test/config/contstants/app_text_styles.dart';
import 'package:test/generated/assets.dart';
import 'package:test/presentation/widgets/custom_instraction.dart';

class CustomTabBarInstractionView extends StatefulWidget {
  const CustomTabBarInstractionView({super.key});

  @override
  State<CustomTabBarInstractionView> createState() =>
      _CustomTabBarInstractionViewState();
}

class _CustomTabBarInstractionViewState
    extends State<CustomTabBarInstractionView> with SingleTickerProviderStateMixin {
  List<String> instructionText = [
    'ПЛАСТИК',
    'СТЕКЛО',
    'МЕТАЛЛ',
    "МАКАЛАТУРА",
    "ДОПОЛНИТЕЛЬНО"
  ];

  void _instructionButton(int index) {
    setState(() {
      _tabController.index = index;
    });
  }

  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child:   NestedScrollView(
              // controller: _scrollController,
              headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    backgroundColor: AppColors.white,
                    automaticallyImplyLeading: false,
                    toolbarHeight: 10.h,
                    pinned: true,
                    elevation: 0,
                    scrolledUnderElevation: 0,
                    titleSpacing: 0,
                    collapsedHeight: 10.h,
                    expandedHeight: 370,
                    stretchTriggerOffset: 1,
                    flexibleSpace: Transform.translate(
                      offset: Offset(0, -2),
                      child: FlexibleSpaceBar(
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
                                  "ЧТО МЫ ПРИНИМАЕМ И КАК ПОДГОТОВИТЬ ВТОРСЫЬЯ\nК СДАЧЕ?",
                                  style: AppTextStyles.body16UnboundedMedium,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  """Чтобы отходы не были отправлены на мусорный полигон или не испортили чистую партию сырья, а получили вторую жизнь после переработки в новые материалы, пожалуйста, во время сортировки, обращайте внимание на маркировку. Она поможет определить, из какого материала состоит предмет.
                          Также, мы просим вас ознакомиться с инструкцией по подготовке вторсырья к сдаче на переработку.""",
                                  style: AppTextStyles.body16GeologicaExtraLight,
                                ),
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
                          title: Container(
                            color: AppColors.white,
                            width: MediaQuery.of(context).size.width,
                            height: 40,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    ...List.generate(instructionText.length, (index) {
                                      return GestureDetector(
                                        onTap: () => _instructionButton(index),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Text(instructionText[index],
                                              style: AppTextStyles
                                                  .body16GeologicaSemiBold
                                                  .copyWith(
                                                  color:
                                                  _tabController.index == index
                                                      ? AppColors.black
                                                      : AppColors.shade3)),
                                        ),
                                      );
                                    }),
                                  ],
                                ),
                              ),
                            ),
                          )
                      ),
                    ),
                  ),

                ];
              },
              body: TabBarView(
                controller: _tabController,
                children: <Widget>[
                  ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: 1,
                    itemBuilder: (__,_){
                      return     Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      Assets.instructionCaution1,
                                      height: 43,
                                      width: 43,
                                      fit: BoxFit.cover,
                                    ),
                                    const SizedBox(width: 8.0),
                                    Expanded(
                                      child: Text(
                                        '1 ПЭТ ПЭТФ | PET-полиэтилентерефталат или лавсан',
                                        style: AppTextStyles.body16GeologicaLight,
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
                                        text: "1.бутылочный ",
                                        style: AppTextStyles.body16GeologicaSemiBold,
                                        children: [
                                          TextSpan(
                                            text:
                                            "(бутылки от напитков, моющих средств, шампуней, гелей для душа, средств для умывания и тд.);",
                                            style: AppTextStyles.body16GeologicaLight,
                                          )
                                        ])),
                                RichText(
                                    text: TextSpan(
                                        text: "2.небутылочный ",
                                        style: AppTextStyles.body16GeologicaSemiBold,
                                        children: [
                                          TextSpan(
                                            text:
                                            "(баночки от таблеток, пивные кеги, одноразовые контейнеры, ёмкости от косметических средств, стаканчики, подложки для конфет, упаковка из-под зубных щёток, батареек, игрушек и тд.).",
                                            style: AppTextStyles.body16GeologicaLight,
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
                            'Такой полужесткий упаковочный пластик высокой плотности необходим для изготовления бутылок, банок, ящиков, канистр, пакетов, контейнеров, труб, крышки от бутылок для напитков и упаковок тетрапак, ёмкостей для бытовой химии, варочных пакетиков для круп, вёдер, стаканчиков для йогурта, упаковки для линз и тд.',
                            title:
                            '2 ПНД | PE-HD- полиэтилен высокой плотности низкого давления',
                            img: Assets.instructionCaution2,
                          ),
                          const CustomInstraction(
                              title: "4 ПЭВД | PE-LD - полиэтилен высокого давления",
                              desc:
                              "Это неплотный пластик, который используется для разного вида пленок, пакетов, мешков, брезента, упаковка из-под бытовой техники, порошка, подгузников, туалетной бумаги, ватных дисков и палочек",
                              img: Assets.instructionCaution4),
                          const CustomInstraction(
                              title: "5 ПП | PP- полипропилен.",
                              desc:
                              "Чаще всего применяется в изготовлении мебели, садовых и автомобильных принадлежностей, труб, упаковки еды, игрушек, шуршащих пакетов, детских сосок, шприцов, трубочки для напитков, множество хозяйственных предметов, таких как тазы, лейки, вёдра, горшки для цветов, пакеты из-под круп, сахара, хлеба",
                              img: Assets.instructionCaution5),
                          const CustomInstraction(
                              title: "6 ПС | PS- полистирол",
                              desc:
                              "Из данного вида пластика производят одноразовую посуду, канцелярскую продукцию, коробки для хранения, лотки для овощей и фруктов, вспененные упаковки для яиц, крышки от одноразовых стаканчиков, упаковка для компакт-дисков, пенопласт",
                              img: Assets.instructionCaution6),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              "ПЛАСТИК,КОТОРЫЙ МЫ НЕ ПРИНЕМАЕМ",
                              style: AppTextStyles.body16UnboundedMedium,
                            ),
                          ),
                          const SizedBox(height: 20),
                          const CustomInstraction(
                              title: "3 ПВХ | PVC– поливинилхлорид",
                              desc:
                              "ПВХ – материал для изготовления мебели, труб, строительных товаров, термоусадочной плёнки, некоторой пищевой плёнки, плавательных принадлежностей, блистерной упаковки, ПВХ-окон, упаковки для тортов, клеенки, шторки для душа, а иногда и для новогодних ёлок",
                              img: Assets.instructionCaution3),
                          const CustomInstraction(
                              title: "7 Other | Другое",
                              desc:
                              "Смесь пластиков и полимеров, не указанных выше (вакуумные упаковки колбасных изделий, сыров, рыбы, упаковки корма для животных, кофе, материал для больших бутылок, теплиц, мебели, плафонов, прозрачных изделий и многого другого",
                              img: Assets.instructionCaution7),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      Assets.instructionCaution9,
                                      height: 43,
                                      width: 43,
                                      fit: BoxFit.cover,
                                    ),
                                    const SizedBox(width: 8.0),
                                    Expanded(
                                      child: Text(
                                        "9 АБС | ABS",
                                        style: AppTextStyles.body16GeologicaLight,
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
                                    'упаковка с кодом С/PP (обычно для замороженных овощей);'),
                                BulletPoint(
                                    text: 'пакеты из биоразлагаемого материала;'),
                                BulletPoint(
                                    text:
                                    'конфетные фантики и любая мягкая упаковка с фольгированным слоем со знаком PP;'),
                                BulletPoint(
                                    text:
                                    'плетёные мешки из - под сахара, картошки, строительного мусора и плетёные сетки от овощей и фруктов;'),
                                BulletPoint(text: 'грязные лотки для мяса;'),
                                BulletPoint(text: 'сырьё без маркировки.'),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              "КАК ПОДГОТОВИТЬ ПЛАСТИК К СДАЧЕ?",
                              style: AppTextStyles.body16UnboundedMedium,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
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
                            'Снять крышки и колечки с бутылок. Их можно сдать отдельно.',
                          ),
                          InstructionItem(
                            number: 4,
                            text:
                            'Вымыть и высушить пластиковые тары. Не заполняйте бутылки другими изделиями из пластика.',
                          ),
                          InstructionItem(
                            number: 5,
                            text:
                            'Разделите по разным пакетам бутылочный ПЭТ и НЕбутылочный, так как смешивать эти 2 вида нельзя. В противном случае, сырьё не будет обладать нужными свойствами.',
                          ),
                          InstructionItem(
                            number: 6,
                            text: 'Каждый вид сложите отдельно друг от друга.',
                          ),
                          InstructionItem(
                            number: 7,
                            text:
                            'При возможности, спрессуйте сырье, перевяжите веревкой и компактно сложите в пакет или коробку, чтобы оно занимало меньше места.',
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
                            padding: const EdgeInsets.symmetric(horizontal: 20),
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
                            text: 'Каждый вид сложите отдельно друг от друга.',
                          ),
                          InstructionItem(
                            number: 6,
                            text:
                            'При возможности, спрессуйте сырье, перевяжите веревкой и компактно сложите в пакет или коробку, чтобы оно занимало меньше места.',
                          ),
                          const SizedBox(
                            height: 30,
                          ),

                        ],
                      );
                    },

                  ),
    ListView.builder(
    padding: EdgeInsets.zero,
    itemCount: 1,
    itemBuilder: (__,_){
      return const CustomInstraction(
          title: "3 ПВХ | PVC– поливинилхлорид",
          desc:
          "ПВХ – материал для изготовления мебели, труб, строительных товаров, термоусадочной плёнки, некоторой пищевой плёнки, плавательных принадлежностей, блистерной упаковки, ПВХ-окон, упаковки для тортов, клеенки, шторки для душа, а иногда и для новогодних ёлок",
          img: Assets.instructionCaution3);
    }),  ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: 1,
                      itemBuilder: (__,_){
                        return const CustomInstraction(
                            title: "3 ПВХ | PVC– поливинилхлорид",
                            desc:
                            "ПВХ – материал для изготовления мебели, труб, строительных товаров, термоусадочной плёнки, некоторой пищевой плёнки, плавательных принадлежностей, блистерной упаковки, ПВХ-окон, упаковки для тортов, клеенки, шторки для душа, а иногда и для новогодних ёлок",
                            img: Assets.instructionCaution3);
                      }),  ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: 1,
                      itemBuilder: (__,_){
                        return const CustomInstraction(
                            title: "3 ПВХ | PVC– поливинилхлорид",
                            desc:
                            "ПВХ – материал для изготовления мебели, труб, строительных товаров, термоусадочной плёнки, некоторой пищевой плёнки, плавательных принадлежностей, блистерной упаковки, ПВХ-окон, упаковки для тортов, клеенки, шторки для душа, а иногда и для новогодних ёлок",
                            img: Assets.instructionCaution3);
                      }),  ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: 1,
                      itemBuilder: (__,_){
                        return const CustomInstraction(
                            title: "3 ПВХ | PVC– поливинилхлорид",
                            desc:
                            "ПВХ – материал для изготовления мебели, труб, строительных товаров, термоусадочной плёнки, некоторой пищевой плёнки, плавательных принадлежностей, блистерной упаковки, ПВХ-окон, упаковки для тортов, клеенки, шторки для душа, а иногда и для новогодних ёлок",
                            img: Assets.instructionCaution3);
                      })

                ],
              ),
            )

    )

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



//
// CustomScrollView(
// slivers: [
// SliverAppBar(
// backgroundColor: AppColors.white,
// toolbarHeight: 10,
// elevation: 0,
// automaticallyImplyLeading: false,
// pinned: true,
// expandedHeight: 342,
// flexibleSpace: FlexibleSpaceBar(
// titlePadding: EdgeInsets.zero,
// expandedTitleScale: 1,
// background: Padding(
// padding: const EdgeInsets.only(left: 20, right: 20),
// child: Column(
// children: [
// const SizedBox(
// height: 20,
// ),
// Text(
// "ЧТО МЫ ПРИНИМАЕМ И КАК ПОДГОТОВИТЬ ВТОРСЫЬЯ\nК СДАЧЕ?",
// style: AppTextStyles.body16UnboundedMedium,
// ),
// const SizedBox(
// height: 5,
// ),
// Text(
// """Чтобы отходы не были отправлены на мусорный полигон или не испортили чистую партию сырья, а получили вторую жизнь после переработки в новые материалы, пожалуйста, во время сортировки, обращайте внимание на маркировку. Она поможет определить, из какого материала состоит предмет.
// Также, мы просим вас ознакомиться с инструкцией по подготовке вторсырья к сдаче на переработку.""",
// style: AppTextStyles.body16GeologicaExtraLight,
// ),
// const SizedBox(
// height: 12,
// ),
// const Divider(
// height: 1,
// color: AppColors.shade1,
// ),
// ],
// ),
// ),
// title: Container(
// color: AppColors.white,
// width: MediaQuery.of(context).size.width,
// height: 40,
// child: SingleChildScrollView(
// scrollDirection: Axis.horizontal,
// child: Padding(
// padding: const EdgeInsets.symmetric(vertical: 10),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// ...List.generate(instructionText.length, (index) {
// return GestureDetector(
// onTap: () => _instructionButton(index),
// child: Padding(
// padding: const EdgeInsets.symmetric(
// horizontal: 10),
// child: Text(instructionText[index],
// style: AppTextStyles
//     .body16GeologicaSemiBold
//     .copyWith(
// color:
// _selectedInstruction == index
// ? AppColors.black
//     : AppColors.shade3)),
// ),
// );
// }),
// ],
// ),
// ),
// ),
// ),
//
//
// ),
// ),
// if (_selectedInstruction == 0) ...[
//
//
// SliverList(
// delegate: SliverChildListDelegate([
// Padding(
// padding: const EdgeInsets.symmetric(horizontal: 20),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Row(
// mainAxisAlignment: MainAxisAlignment.start,
// crossAxisAlignment: CrossAxisAlignment.center,
// children: [
// Image.asset(
// Assets.instructionCaution1,
// height: 43,
// width: 43,
// fit: BoxFit.cover,
// ),
// const SizedBox(width: 8.0),
// Expanded(
// child: Text(
// '1 ПЭТ ПЭТФ | PET-полиэтилентерефталат или лавсан',
// style: AppTextStyles.body16GeologicaLight,
// ),
// ),
// ],
// ),
// const SizedBox(height: 12.0),
// Text(
// 'Существует два вида ПЭТ:',
// style: AppTextStyles.body16GeologicaLight,
// ),
// const SizedBox(height: 8.0),
// RichText(
// text: TextSpan(
// text: "1.бутылочный ",
// style: AppTextStyles.body16GeologicaSemiBold,
// children: [
// TextSpan(
// text:
// "(бутылки от напитков, моющих средств, шампуней, гелей для душа, средств для умывания и тд.);",
// style: AppTextStyles.body16GeologicaLight,
// )
// ])),
// RichText(
// text: TextSpan(
// text: "2.небутылочный ",
// style: AppTextStyles.body16GeologicaSemiBold,
// children: [
// TextSpan(
// text:
// "(баночки от таблеток, пивные кеги, одноразовые контейнеры, ёмкости от косметических средств, стаканчики, подложки для конфет, упаковка из-под зубных щёток, батареек, игрушек и тд.).",
// style: AppTextStyles.body16GeologicaLight,
// )
// ])),
// const SizedBox(
// height: 10,
// ),
// const Divider(
// height: 1,
// color: AppColors.shade1,
// ),
// const SizedBox(
// height: 10,
// ),
// ],
// ),
// ),
// const CustomInstraction(
// desc:
// 'Такой полужесткий упаковочный пластик высокой плотности необходим для изготовления бутылок, банок, ящиков, канистр, пакетов, контейнеров, труб, крышки от бутылок для напитков и упаковок тетрапак, ёмкостей для бытовой химии, варочных пакетиков для круп, вёдер, стаканчиков для йогурта, упаковки для линз и тд.',
// title:
// '2 ПНД | PE-HD- полиэтилен высокой плотности низкого давления',
// img: Assets.instructionCaution2,
// ),
// const CustomInstraction(
// title: "4 ПЭВД | PE-LD - полиэтилен высокого давления",
// desc:
// "Это неплотный пластик, который используется для разного вида пленок, пакетов, мешков, брезента, упаковка из-под бытовой техники, порошка, подгузников, туалетной бумаги, ватных дисков и палочек",
// img: Assets.instructionCaution4),
// const CustomInstraction(
// title: "5 ПП | PP- полипропилен.",
// desc:
// "Чаще всего применяется в изготовлении мебели, садовых и автомобильных принадлежностей, труб, упаковки еды, игрушек, шуршащих пакетов, детских сосок, шприцов, трубочки для напитков, множество хозяйственных предметов, таких как тазы, лейки, вёдра, горшки для цветов, пакеты из-под круп, сахара, хлеба",
// img: Assets.instructionCaution5),
// const CustomInstraction(
// title: "6 ПС | PS- полистирол",
// desc:
// "Из данного вида пластика производят одноразовую посуду, канцелярскую продукцию, коробки для хранения, лотки для овощей и фруктов, вспененные упаковки для яиц, крышки от одноразовых стаканчиков, упаковка для компакт-дисков, пенопласт",
// img: Assets.instructionCaution6),
// Padding(
// padding: const EdgeInsets.symmetric(horizontal: 20),
// child: Text(
// "ПЛАСТИК,КОТОРЫЙ МЫ НЕ ПРИНЕМАЕМ",
// style: AppTextStyles.body16UnboundedMedium,
// ),
// ),
// const SizedBox(height: 20),
// const CustomInstraction(
// title: "3 ПВХ | PVC– поливинилхлорид",
// desc:
// "ПВХ – материал для изготовления мебели, труб, строительных товаров, термоусадочной плёнки, некоторой пищевой плёнки, плавательных принадлежностей, блистерной упаковки, ПВХ-окон, упаковки для тортов, клеенки, шторки для душа, а иногда и для новогодних ёлок",
// img: Assets.instructionCaution3),
// const CustomInstraction(
// title: "7 Other | Другое",
// desc:
// "Смесь пластиков и полимеров, не указанных выше (вакуумные упаковки колбасных изделий, сыров, рыбы, упаковки корма для животных, кофе, материал для больших бутылок, теплиц, мебели, плафонов, прозрачных изделий и многого другого",
// img: Assets.instructionCaution7),
// Padding(
// padding: const EdgeInsets.symmetric(horizontal: 20),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Row(
// mainAxisAlignment: MainAxisAlignment.start,
// crossAxisAlignment: CrossAxisAlignment.center,
// children: [
// Image.asset(
// Assets.instructionCaution9,
// height: 43,
// width: 43,
// fit: BoxFit.cover,
// ),
// const SizedBox(width: 8.0),
// Expanded(
// child: Text(
// "9 АБС | ABS",
// style: AppTextStyles.body16GeologicaLight,
// ),
// ),
// ],
// ),
// const SizedBox(height: 8.0),
// Text(
// "Акрилонитрил, бутадиен, стирол (корпуса телевизоров, телефонов, компьютеров, распечатанные на 3D-принтере компоненты, не являющиеся биопластиками, такими как PLA.",
// style: AppTextStyles.body16GeologicaLight,
// ),
// const SizedBox(height: 8.0),
// BulletPoint(
// text:
// 'упаковка с кодом С/PP (обычно для замороженных овощей);'),
// BulletPoint(
// text: 'пакеты из биоразлагаемого материала;'),
// BulletPoint(
// text:
// 'конфетные фантики и любая мягкая упаковка с фольгированным слоем со знаком PP;'),
// BulletPoint(
// text:
// 'плетёные мешки из - под сахара, картошки, строительного мусора и плетёные сетки от овощей и фруктов;'),
// BulletPoint(text: 'грязные лотки для мяса;'),
// BulletPoint(text: 'сырьё без маркировки.'),
// ],
// ),
// ),
// const SizedBox(
// height: 20,
// ),
// Padding(
// padding: const EdgeInsets.symmetric(horizontal: 20),
// child: Text(
// "КАК ПОДГОТОВИТЬ ПЛАСТИК К СДАЧЕ?",
// style: AppTextStyles.body16UnboundedMedium,
// ),
// ),
// const SizedBox(
// height: 20,
// ),
// Padding(
// padding: const EdgeInsets.symmetric(horizontal: 20),
// child: Text(
// "Твердый пластик",
// style: AppTextStyles.body16GeologicaSemiBold,
// ),
// ),
// const SizedBox(
// height: 8,
// ),
// InstructionItem(
// number: 1,
// text:
// 'Весь твердый пластик необходимо очистить от пищевых отходов и других загрязнений.',
// ),
// InstructionItem(
// number: 2,
// text:
// 'Удалить бумажные и металлические элементы, наклейки, этикетки, скотч и термоусадочную пленку.',
// ),
// InstructionItem(
// number: 3,
// text:
// 'Снять крышки и колечки с бутылок. Их можно сдать отдельно.',
// ),
// InstructionItem(
// number: 4,
// text:
// 'Вымыть и высушить пластиковые тары. Не заполняйте бутылки другими изделиями из пластика.',
// ),
// InstructionItem(
// number: 5,
// text:
// 'Разделите по разным пакетам бутылочный ПЭТ и НЕбутылочный, так как смешивать эти 2 вида нельзя. В противном случае, сырьё не будет обладать нужными свойствами.',
// ),
// InstructionItem(
// number: 6,
// text: 'Каждый вид сложите отдельно друг от друга.',
// ),
// InstructionItem(
// number: 7,
// text:
// 'При возможности, спрессуйте сырье, перевяжите веревкой и компактно сложите в пакет или коробку, чтобы оно занимало меньше места.',
// ),
// const SizedBox(
// height: 10,
// ),
// const Divider(
// height: 1,
// color: AppColors.shade1,
// ),
// const SizedBox(
// height: 10,
// ),
// Padding(
// padding: const EdgeInsets.symmetric(horizontal: 20),
// child: Text(
// "Мягкий пластик",
// style: AppTextStyles.body16GeologicaSemiBold,
// ),
// ),
// const SizedBox(
// height: 8,
// ),
// InstructionItem(
// number: 1,
// text:
// 'Весь мягкий пластик необходимо очистить от пищевых отходов и других загрязнений.',
// ),
// InstructionItem(
// number: 2,
// text:
// 'Удалить бумажные и металлические элементы, наклейки, этикетки, скотч и тд.',
// ),
// InstructionItem(
// number: 3,
// text: 'Вымыть и высушить пластиковые отходы.',
// ),
// InstructionItem(
// number: 4,
// text:
// 'Разделите мягкий пластик на прозрачный и цветной (с изображениями или надписями).',
// ),
// InstructionItem(
// number: 5,
// text: 'Каждый вид сложите отдельно друг от друга.',
// ),
// InstructionItem(
// number: 6,
// text:
// 'При возможности, спрессуйте сырье, перевяжите веревкой и компактно сложите в пакет или коробку, чтобы оно занимало меньше места.',
// ),
// const SizedBox(
// height: 30,
// ),
// ]))
// ],
// if (_selectedInstruction == 1) ...[
// SliverList(
// delegate: SliverChildListDelegate([
// const CustomInstraction(
// title: "7 Other | Другое",
// desc:
// "Смесь пластиков и полимеров, не указанных выше (вакуумные упаковки колбасных изделий, сыров, рыбы, упаковки корма для животных, кофе, материал для больших бутылок, теплиц, мебели, плафонов, прозрачных изделий и многого другого",
// img: Assets.instructionCaution7),
// ]))
// ],
// if (_selectedInstruction == 2) ...[
// SliverList(
// delegate: SliverChildListDelegate([
// const CustomInstraction(
// title: "7 Other | Другое",
// desc:
// "Смесь пластиков и полимеров, не указанных выше (вакуумные упаковки колбасных изделий, сыров, рыбы, упаковки корма для животных, кофе, материал для больших бутылок, теплиц, мебели, плафонов, прозрачных изделий и многого другого",
// img: Assets.instructionCaution7),
// ]))
// ],
// if (_selectedInstruction == 3) ...[
// SliverList(
// delegate: SliverChildListDelegate([
// const CustomInstraction(
// title: "7 Other | Другое",
// desc:
// "Смесь пластиков и полимеров, не указанных выше (вакуумные упаковки колбасных изделий, сыров, рыбы, упаковки корма для животных, кофе, материал для больших бутылок, теплиц, мебели, плафонов, прозрачных изделий и многого другого",
// img: Assets.instructionCaution7),
// ]))
// ] else ...[
// SliverList(
// delegate: SliverChildListDelegate([
// const CustomInstraction(
// title: "7 Other | Другое",
// desc:
// "Смесь пластиков и полимеров, не указанных выше (вакуумные упаковки колбасных изделий, сыров, рыбы, упаковки корма для животных, кофе, материал для больших бутылок, теплиц, мебели, плафонов, прозрачных изделий и многого другого",
// img: Assets.instructionCaution7),
// ]))
// ],
// ],
// ),
//
//
//




/// need to change NESTEDSCROLLVIEW
// NestedScrollView(
// headerSliverBuilder:
// (BuildContext context, bool innerBoxIsScrolled) {
// return [
// SliverAppBar(
// scrolledUnderElevation:null,
// elevation: null,
// titleSpacing: null,
// collapsedHeight:null,
// backgroundColor: AppColors.white,
//
// automaticallyImplyLeading: false,
// pinned: true,
// expandedHeight: 320,
// toolbarHeight: 0,
// // titleSpacing: 0,
// // scrolledUnderElevation: 0,
// // collapsedHeight: 0,
// bottom: PreferredSize(preferredSize: Size(300, 22),child: TabBar(
// controller: _tabController,
// tabs: [
// Transform.translate(offset: Offset(0, -20),child: Tab(text: '1', height: 20,)),
// Tab(text: '1', height: 20,),
// Tab(text: '1', height: 20,),
// Tab(text: '1', height: 20,),
// Tab(text: '1', height: 20,),
// ],
// ),),
// flexibleSpace: FlexibleSpaceBar(
//
// background: Padding(
// padding: const EdgeInsets.only(left: 20, right: 20),
// child: Column(
// children: [
// const SizedBox(
// height: 20,
// ),
// Text(
// "ЧТО МЫ ПРИНИМАЕМ И КАК ПОДГОТОВИТЬ ВТОРСЫЬЯ\nК СДАЧЕ?",
// style: AppTextStyles.body16UnboundedMedium,
// ),
// const SizedBox(
// height: 5,
// ),
// Text(
// """Чтобы отходы не были отправлены на мусорный полигон или не испортили чистую партию сырья, а получили вторую жизнь после переработки в новые материалы, пожалуйста, во время сортировки, обращайте внимание на маркировку. Она поможет определить, из какого материала состоит предмет.
// Также, мы просим вас ознакомиться с инструкцией по подготовке вторсырья к сдаче на переработку.""",
// style: AppTextStyles.body16GeologicaExtraLight,
// ),
// const SizedBox(
// height: 12,
// ),
// const Divider(
// height: 1,
// color: AppColors.shade1,
// ),
// ],
// ),
// ),
// ),
// // TabBar(
// //
// //    isScrollable: true,
// //    // padding: ,
// //   controller: _tabController,
// //   onTap: (index) {
// //      setState(() {});
// //    },
// //    tabs: [
// //      ...List.generate(instructionText.length, (index) {
// //        return Text(instructionText[index],
// //           style: AppTextStyles.body16GeologicaSemiBold
// //                .copyWith(
// //                    color: _tabController.index == index
// //                        ? AppColors.black
// //                        : AppColors.shade3));
// //      }),
// //   ],
// // ),
// ),
//
// ];
// },
// body: TabBarView(
// controller: _tabController,
// children: [
// SingleChildScrollView(
// scrollDirection: Axis.vertical,
// child: Column(
// children: [
// SizedBox(height: 15,),
// Padding(
// padding: const EdgeInsets.symmetric(horizontal: 20),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Row(
// mainAxisAlignment: MainAxisAlignment.start,
// crossAxisAlignment: CrossAxisAlignment.center,
// children: [
// Image.asset(
// Assets.instructionCaution1,
// height: 43,
// width: 43,
// fit: BoxFit.cover,
// ),
// const SizedBox(width: 8.0),
// Expanded(
// child: Text(
// '1 ПЭТ ПЭТФ | PET-полиэтилентерефталат или лавсан',
// style: AppTextStyles.body16GeologicaLight,
// ),
// ),
// ],
// ),
// const SizedBox(height: 12.0),
// Text(
// 'Существует два вида ПЭТ:',
// style: AppTextStyles.body16GeologicaLight,
// ),
// const SizedBox(height: 8.0),
// RichText(
// text: TextSpan(
// text: "1.бутылочный ",
// style:
// AppTextStyles.body16GeologicaSemiBold,
// children: [
// TextSpan(
// text:
// "(бутылки от напитков, моющих средств, шампуней, гелей для душа, средств для умывания и тд.);",
// style: AppTextStyles.body16GeologicaLight,
// )
// ])),
// RichText(
// text: TextSpan(
// text: "2.небутылочный ",
// style:
// AppTextStyles.body16GeologicaSemiBold,
// children: [
// TextSpan(
// text:
// "(баночки от таблеток, пивные кеги, одноразовые контейнеры, ёмкости от косметических средств, стаканчики, подложки для конфет, упаковка из-под зубных щёток, батареек, игрушек и тд.).",
// style: AppTextStyles.body16GeologicaLight,
// )
// ])),
// const SizedBox(
// height: 10,
// ),
// const Divider(
// height: 1,
// color: AppColors.shade1,
// ),
// const SizedBox(
// height: 10,
// ),
// ],
// ),
// ),
// const CustomInstraction(
// desc:
// 'Такой полужесткий упаковочный пластик высокой плотности необходим для изготовления бутылок, банок, ящиков, канистр, пакетов, контейнеров, труб, крышки от бутылок для напитков и упаковок тетрапак, ёмкостей для бытовой химии, варочных пакетиков для круп, вёдер, стаканчиков для йогурта, упаковки для линз и тд.',
// title:
// '2 ПНД | PE-HD- полиэтилен высокой плотности низкого давления',
// img: Assets.instructionCaution2,
// ),
// const CustomInstraction(
// title:
// "4 ПЭВД | PE-LD - полиэтилен высокого давления",
// desc:
// "Это неплотный пластик, который используется для разного вида пленок, пакетов, мешков, брезента, упаковка из-под бытовой техники, порошка, подгузников, туалетной бумаги, ватных дисков и палочек",
// img: Assets.instructionCaution4),
// const CustomInstraction(
// title: "5 ПП | PP- полипропилен.",
// desc:
// "Чаще всего применяется в изготовлении мебели, садовых и автомобильных принадлежностей, труб, упаковки еды, игрушек, шуршащих пакетов, детских сосок, шприцов, трубочки для напитков, множество хозяйственных предметов, таких как тазы, лейки, вёдра, горшки для цветов, пакеты из-под круп, сахара, хлеба",
// img: Assets.instructionCaution5),
// const CustomInstraction(
// title: "6 ПС | PS- полистирол",
// desc:
// "Из данного вида пластика производят одноразовую посуду, канцелярскую продукцию, коробки для хранения, лотки для овощей и фруктов, вспененные упаковки для яиц, крышки от одноразовых стаканчиков, упаковка для компакт-дисков, пенопласт",
// img: Assets.instructionCaution6),
// Padding(
// padding: const EdgeInsets.symmetric(horizontal: 20),
// child: Text(
// "ПЛАСТИК,КОТОРЫЙ МЫ НЕ ПРИНЕМАЕМ",
// style: AppTextStyles.body16UnboundedMedium,
// ),
// ),
// const SizedBox(height: 20),
// const CustomInstraction(
// title: "3 ПВХ | PVC– поливинилхлорид",
// desc:
// "ПВХ – материал для изготовления мебели, труб, строительных товаров, термоусадочной плёнки, некоторой пищевой плёнки, плавательных принадлежностей, блистерной упаковки, ПВХ-окон, упаковки для тортов, клеенки, шторки для душа, а иногда и для новогодних ёлок",
// img: Assets.instructionCaution3),
// const CustomInstraction(
// title: "7 Other | Другое",
// desc:
// "Смесь пластиков и полимеров, не указанных выше (вакуумные упаковки колбасных изделий, сыров, рыбы, упаковки корма для животных, кофе, материал для больших бутылок, теплиц, мебели, плафонов, прозрачных изделий и многого другого",
// img: Assets.instructionCaution7),
// Padding(
// padding: const EdgeInsets.symmetric(horizontal: 20),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Row(
// mainAxisAlignment: MainAxisAlignment.start,
// crossAxisAlignment: CrossAxisAlignment.center,
// children: [
// Image.asset(
// Assets.instructionCaution9,
// height: 43,
// width: 43,
// fit: BoxFit.cover,
// ),
// const SizedBox(width: 8.0),
// Expanded(
// child: Text(
// "9 АБС | ABS",
// style: AppTextStyles.body16GeologicaLight,
// ),
// ),
// ],
// ),
// const SizedBox(height: 8.0),
// Text(
// "Акрилонитрил, бутадиен, стирол (корпуса телевизоров, телефонов, компьютеров, распечатанные на 3D-принтере компоненты, не являющиеся биопластиками, такими как PLA.",
// style: AppTextStyles.body16GeologicaLight,
// ),
// const SizedBox(height: 8.0),
// BulletPoint(
// text:
// 'упаковка с кодом С/PP (обычно для замороженных овощей);'),
// BulletPoint(
// text: 'пакеты из биоразлагаемого материала;'),
// BulletPoint(
// text:
// 'конфетные фантики и любая мягкая упаковка с фольгированным слоем со знаком PP;'),
// BulletPoint(
// text:
// 'плетёные мешки из - под сахара, картошки, строительного мусора и плетёные сетки от овощей и фруктов;'),
// BulletPoint(text: 'грязные лотки для мяса;'),
// BulletPoint(text: 'сырьё без маркировки.'),
// ],
// ),
// ),
// const SizedBox(
// height: 20,
// ),
// Padding(
// padding: const EdgeInsets.symmetric(horizontal: 20),
// child: Text(
// "КАК ПОДГОТОВИТЬ ПЛАСТИК К СДАЧЕ?",
// style: AppTextStyles.body16UnboundedMedium,
// ),
// ),
// const SizedBox(
// height: 20,
// ),
// Padding(
// padding: const EdgeInsets.symmetric(horizontal: 20),
// child: Text(
// "Твердый пластик",
// style: AppTextStyles.body16GeologicaSemiBold,
// ),
// ),
// const SizedBox(
// height: 8,
// ),
// InstructionItem(
// number: 1,
// text:
// 'Весь твердый пластик необходимо очистить от пищевых отходов и других загрязнений.',
// ),
// InstructionItem(
// number: 2,
// text:
// 'Удалить бумажные и металлические элементы, наклейки, этикетки, скотч и термоусадочную пленку.',
// ),
// InstructionItem(
// number: 3,
// text:
// 'Снять крышки и колечки с бутылок. Их можно сдать отдельно.',
// ),
// InstructionItem(
// number: 4,
// text:
// 'Вымыть и высушить пластиковые тары. Не заполняйте бутылки другими изделиями из пластика.',
// ),
// InstructionItem(
// number: 5,
// text:
// 'Разделите по разным пакетам бутылочный ПЭТ и НЕбутылочный, так как смешивать эти 2 вида нельзя. В противном случае, сырьё не будет обладать нужными свойствами.',
// ),
// InstructionItem(
// number: 6,
// text: 'Каждый вид сложите отдельно друг от друга.',
// ),
// InstructionItem(
// number: 7,
// text:
// 'При возможности, спрессуйте сырье, перевяжите веревкой и компактно сложите в пакет или коробку, чтобы оно занимало меньше места.',
// ),
// const SizedBox(
// height: 10,
// ),
// const Divider(
// height: 1,
// color: AppColors.shade1,
// ),
// const SizedBox(
// height: 10,
// ),
// Padding(
// padding: const EdgeInsets.symmetric(horizontal: 20),
// child: Text(
// "Мягкий пластик",
// style: AppTextStyles.body16GeologicaSemiBold,
// ),
// ),
// const SizedBox(
// height: 8,
// ),
// InstructionItem(
// number: 1,
// text:
// 'Весь мягкий пластик необходимо очистить от пищевых отходов и других загрязнений.',
// ),
// InstructionItem(
// number: 2,
// text:
// 'Удалить бумажные и металлические элементы, наклейки, этикетки, скотч и тд.',
// ),
// InstructionItem(
// number: 3,
// text: 'Вымыть и высушить пластиковые отходы.',
// ),
// InstructionItem(
// number: 4,
// text:
// 'Разделите мягкий пластик на прозрачный и цветной (с изображениями или надписями).',
// ),
// InstructionItem(
// number: 5,
// text: 'Каждый вид сложите отдельно друг от друга.',
// ),
// InstructionItem(
// number: 6,
// text:
// 'При возможности, спрессуйте сырье, перевяжите веревкой и компактно сложите в пакет или коробку, чтобы оно занимало меньше места.',
// ),
// const SizedBox(
// height: 30,
// ),
// ],
// ),
// ),
// const CustomInstraction(
// title: "3 ПВХ | PVC– поливинилхлорид",
// desc:
// "ПВХ – материал для изготовления мебели, труб, строительных товаров, термоусадочной плёнки, некоторой пищевой плёнки, плавательных принадлежностей, блистерной упаковки, ПВХ-окон, упаковки для тортов, клеенки, шторки для душа, а иногда и для новогодних ёлок",
// img: Assets.instructionCaution3),
// const CustomInstraction(
// title: "7 Other | Другое",
// desc:
// "Смесь пластиков и полимеров, не указанных выше (вакуумные упаковки колбасных изделий, сыров, рыбы, упаковки корма для животных, кофе, материал для больших бутылок, теплиц, мебели, плафонов, прозрачных изделий и многого другого",
// img: Assets.instructionCaution7),
// const CustomInstraction(
// title: "3 ПВХ | PVC– поливинилхлорид",
// desc:
// "ПВХ – материал для изготовления мебели, труб, строительных товаров, термоусадочной плёнки, некоторой пищевой плёнки, плавательных принадлежностей, блистерной упаковки, ПВХ-окон, упаковки для тортов, клеенки, шторки для душа, а иногда и для новогодних ёлок",
// img: Assets.instructionCaution3),
// const CustomInstraction(
// title: "7 Other | Другое",
// desc:
// "Смесь пластиков и полимеров, не указанных выше (вакуумные упаковки колбасных изделий, сыров, рыбы, упаковки корма для животных, кофе, материал для больших бутылок, теплиц, мебели, плафонов, прозрачных изделий и многого другого",
// img: Assets.instructionCaution7),
// ],
// ),
// ),






///
