import 'package:flutter/cupertino.dart';

class CustomMarketView extends StatefulWidget {
  const CustomMarketView({super.key, required this.pageController});
  final PageController pageController;


  @override
  State<CustomMarketView> createState() => _CustomMarketViewState();
}

class _CustomMarketViewState extends State<CustomMarketView> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Center(
        child: Text("Market View"),
      ),
    );
  }
}
