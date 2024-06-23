import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test/config/contstants/app_colors.dart';
import 'package:test/config/contstants/app_text_styles.dart';
import 'package:test/generated/assets.dart';

import 'package:test/presentation/pages/chat/components/chat_bottom_row_widget.dart';

import 'package:test/presentation/pages/chat/components/chat_empty_body_widget.dart';

import 'package:test/presentation/pages/chat/components/chat_bubble.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  bool isEmpty = true;
  bool isShowEmptyWidget = true;

  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller.addListener(() {
      setState(() {
        isEmpty = _controller.text.isEmpty;
      });
    });
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          backgroundColor: Colors.white,
          // resizeToAvoidBottomInset: true,
          appBar: AppBar(
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark,
              statusBarBrightness: Brightness.dark,
            ),
            elevation: 0,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title: Text(
              "ЧАТ С ПОДДЕРЖКОЙ",
              style: AppTextStyles.body16UnboundedMedium,
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: SvgPicture.asset(
                  Assets.assetsIconsChatPhone,
                  colorFilter:
                      const ColorFilter.mode(AppColors.accent, BlendMode.srcIn),
                ),
              ),
            ],
          ),
          body: Column(children: [
            Expanded(
              child: isShowEmptyWidget
                  ? const ChatEmptyBodyWidget()
                  : Align(
                      alignment: Alignment.bottomCenter,
                      child: ListView(
                        reverse: true,
                        padding: const EdgeInsets.all(8.0).copyWith(bottom: 24),
                        children: [
                          const ChatBubble(
                            text:
                                'Здравствуйте, на каком именно этапе возникают трудности?',
                            isMe: false,
                            time: '20:40',
                          ),
                          const ChatBubble(
                            text:
                                'Столкнулся с проблемой. Не получается оформить заказ',
                            isMe: true,
                            time: '20:37',
                          ),
                          Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(
                                '18 апреля',
                                style: AppTextStyles.body14GeologicaSemiBold
                                    .copyWith(color: AppColors.shade3),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
            ChatBottomRowWidget(
              onTap: () {
                _controller.clear();
                setState(() {
                  isShowEmptyWidget = false;
                });
              },
              controller: _controller,
            )
          ]),
        ),
      );
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
