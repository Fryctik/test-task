
import 'package:flutter/material.dart';
import 'package:test/presentation/theme/theme.dart';

class PhotoModalBottomSheet extends StatelessWidget {
  const PhotoModalBottomSheet({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          backgroundColor: Colors.transparent,
          builder: (context) {
            return Container(
              margin: const EdgeInsets.symmetric(
                  horizontal: 5, vertical: 37),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: AppColors.shade1,
                        borderRadius:
                            BorderRadius.circular(12)),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          padding:
                              const EdgeInsets.symmetric(
                            vertical: 15,
                          ),
                          child: GestureDetector(
                            child: Text(
                              textAlign: TextAlign.center,
                              'Выбрать фото из галереи',
                              style: theme
                                  .textTheme.bodyMedium
                                  ?.copyWith(
                                color: const Color.fromARGB(
                                    255, 21, 117, 214),
                              ),
                            ),
                          ),
                        ),
                        const Divider(
                          color: Color.fromRGBO(
                              116, 116, 130, 0.357),
                          height: 0,
                        ),
                        Container(
                          width: double.infinity,
                          padding:
                              const EdgeInsets.symmetric(
                            vertical: 15,
                          ),
                          child: GestureDetector(
                            child: Text(
                              'Сделать фото',
                              textAlign: TextAlign.center,
                              style: theme
                                  .textTheme.bodyMedium
                                  ?.copyWith(
                                color: const Color.fromARGB(
                                  255,
                                  21,
                                  117,
                                  214,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Divider(
                          color: Color.fromRGBO(
                              116, 116, 130, 0.357),
                          height: 0,
                        ),
                        Container(
                          width: double.infinity,
                          padding:
                              const EdgeInsets.symmetric(
                            vertical: 15,
                          ),
                          child: GestureDetector(
                            child: Text(
                              'Удалить фото',
                              textAlign: TextAlign.center,
                              style: theme
                                  .textTheme.bodyMedium
                                  ?.copyWith(
                                color: const Color.fromARGB(
                                    255, 21, 117, 214),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          vertical: 25,
                        ),
                        backgroundColor: AppColors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
                      ),
                      child: Text(
                        'Отмена',
                        style: theme.textTheme.bodyLarge
                            ?.copyWith(
                          color: const Color.fromARGB(
                            255,
                            21,
                            117,
                            214,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          image: const DecorationImage(
            image: AssetImage(
              'assets/image/human.png',
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: Align(
          alignment: Alignment.bottomRight,
          child: Image.asset(
            'assets/icons/camera.png',
            width: 36,
            height: 36,
          ),
        ),
      ),
    );
  }
}
