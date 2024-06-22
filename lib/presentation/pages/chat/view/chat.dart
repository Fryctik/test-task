import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test/config/contstants/app_colors.dart';
import 'package:test/config/contstants/app_text_styles.dart';
import 'package:test/generated/assets.dart';

import 'package:test/presentation/pages/chat/components/chat_bottom_row_widget.dart';

import '../components/chat_empty_body_widget.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: true,
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
          ),
          body: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(8.0),
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        '18 апреля',
                        style: AppTextStyles.body14GeologicaBold
                            .copyWith(color: AppColors.shade3),
                      ),
                    ),
                  ),
                  const ChatBubble(
                    text:
                        'Столкнулся с проблемой. Не получается оформить заказ',
                    isMe: true,
                    time: '20:37',
                  ),
                  const ChatBubble(
                    text:
                        'Здравствуйте, на каком именно этапе возникают трудности?',
                    isMe: false,
                    time: '20:40',
                  ),
                ],
              ),
              //  ChatEmptyBodyWidget(),
            ),
            const ChatBottomRowWidget()
          ]),
        ),
      );
}

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isMe;
  final String time;

  const ChatBubble({
    super.key,
    required this.text,
    required this.isMe,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    final String whoIs = isMe ? 'Вы' : 'Администратор';
    return SizedBox(
      width: 258.sp,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: Align(
          alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
          child: Column(
            crossAxisAlignment:
                isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                decoration: BoxDecoration(
                  color: isMe ? AppColors.main : AppColors.shade1,
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                ),
                child: Text(
                  text,
                  style: AppTextStyles.body16GeologicaLight
                      .copyWith(color: isMe ? Colors.white : AppColors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Row(
                  children: [
                    // RichText(
                    //     text: TextSpan(
                    //   text: ' в $time',
                    //   children: [
                    //     TextSpan(
                    //       text: whoIs,
                    //       style: AppTextStyles.body14GeologicaLight
                    //           .copyWith(color: AppColors.shade3),
                    //     )
                    //   ],
                    //   style: AppTextStyles.body14GeologicaLight
                    //       .copyWith(color: AppColors.shade2),
                    // )),
                    RichText(
                      text: TextSpan(
                        text: whoIs,
                        style: AppTextStyles.body14GeologicaLight
                            .copyWith(color: AppColors.shade3),
                        children: [
                          TextSpan(
                            text: ' в $time',
                            style: AppTextStyles.body14GeologicaLight
                                .copyWith(color: AppColors.shade2),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
