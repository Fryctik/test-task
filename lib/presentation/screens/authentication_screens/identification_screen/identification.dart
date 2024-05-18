import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:test/presentation/screens/authentication_screens/identification_screen/widgets/agreement_widget.dart';
import 'package:test/presentation/screens/authentication_screens/identification_screen/widgets/title_identification_widget.dart';
import 'package:test/presentation/theme/theme.dart';

@RoutePage()
class IdentificationScreen extends StatefulWidget {
  const IdentificationScreen({super.key});

  @override
  State<IdentificationScreen> createState() => _IdentificationScreenState();
}

class _IdentificationScreenState extends State<IdentificationScreen> {
  final TextEditingController _phoneNumberController = TextEditingController();

  final maskFormatter = MaskTextInputFormatter(
      mask: '+7 (###) ###-##-##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);
  bool _isValidPhoneNumber = true;
  bool _isNumberValidInputed = false;

  bool isValidPhoneNumber(String value) {
    return RegExp(r'^\+7 \(\d{3}\) \d{3}-\d{2}-\d{2}$').hasMatch(value);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 45, 20, 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          context.router.back();
                        },
                        child: const Icon(
                          Icons.close_sharp,
                          size: 24,
                          color: AppColors.accent,
                          weight: 2,
                        ),
                      )
                    ],
                  ),
                  const TitleIdentificationWidget(),
                  Padding(
                    padding: const EdgeInsets.only(top: 48),
                    child: TextField(
                      controller: _phoneNumberController,
                      keyboardType: TextInputType.phone,
                      inputFormatters: [maskFormatter],
                      cursorColor: const Color.fromARGB(255, 186, 132, 246),
                      style: theme.textTheme.bodyMedium?.copyWith(
                        height: 20 / 16,
                        color: _isValidPhoneNumber
                            ? AppColors.black
                            : AppColors.red,
                      ),
                      onChanged: (value) {
                        setState(() {
                          _isValidPhoneNumber = isValidPhoneNumber(value);
                          _isValidPhoneNumber
                              ? _isNumberValidInputed = true
                              : _isNumberValidInputed = false;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: '+7',
                        hintStyle: theme.textTheme.bodyMedium?.copyWith(
                          color: AppColors.shade3,
                          height: 20 / 16,
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(
                            color: AppColors.main,
                            width: 1,
                          ),
                        ),
                        errorBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide.none,
                        ),
                        focusedErrorBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide.none,
                        ),
                        errorText:
                            _isValidPhoneNumber ? null : 'Неправильный номер',
                        errorStyle: theme.textTheme.bodyMedium?.copyWith(
                          color: AppColors.red,
                          height: 20 / 16,
                        ),
                        fillColor: _isValidPhoneNumber
                            ? AppColors.shade1
                            : AppColors.softRed,
                        filled: true,
                        suffixIcon: _isNumberValidInputed
                            ? const Icon(
                                Icons.check,
                                size: 24,
                                color: AppColors.accent,
                                weight: 3,
                              )
                            : null,
                      ),
                    ),
                  ),
                ],
              ),
              AgreementWidget(phoneNumberController: _phoneNumberController)
            ],
          ),
        ),
      ),
    );
  }
}
