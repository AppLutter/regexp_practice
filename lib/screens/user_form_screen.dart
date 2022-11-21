import 'package:flutter/material.dart';
import 'package:reg/models/user_info_model.dart';
import 'package:reg/utils/regex.dart';
import 'package:reg/widgets/user_text_form_field.dart';

class UserFormScreen extends StatefulWidget {
  UserFormScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();

  @override
  State<UserFormScreen> createState() => _UserFormScreenState();
}

class _UserFormScreenState extends State<UserFormScreen> {
  late FocusNode nameFocusNode;
  late FocusNode eMailFocusNode;
  late FocusNode residentNumberFocusNode;
  late FocusNode phoneFocusNode;

  late TextEditingController nameController;
  late TextEditingController phoneNumberController;
  late TextEditingController residentNumberController;
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  void initState() {
    super.initState();
    nameFocusNode = FocusNode();
    eMailFocusNode = FocusNode();
    residentNumberFocusNode = FocusNode();
    phoneFocusNode = FocusNode();

    nameController = TextEditingController();
    phoneNumberController = TextEditingController();
    residentNumberController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    nameFocusNode.dispose();
    eMailFocusNode.dispose();
    residentNumberFocusNode.dispose();
    phoneFocusNode.dispose();

    nameController.dispose();
    phoneNumberController.dispose();
    residentNumberController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('정규식 연습하기'),
        ),
        body: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0.0),
                    child: Form(
                      key: widget.formKey,
                      child: Column(
                        children: [
                          UserInfoTextFormField(
                            controller: nameController,
                            labelText: '이름',
                            currentFocusNode: nameFocusNode,
                            autoValidateMode: autoValidateMode,
                            regExp: nameRegExp,
                            emptyString: '이름을 입력해주세요',
                            notMatchString: '이름을 한글로 정확히 입력해주세요',
                          ),
                          const SizedBox(height: 20.0),
                          UserInfoTextFormField(
                            controller: phoneNumberController,
                            labelText: '전화번호',
                            currentFocusNode: phoneFocusNode,
                            autoValidateMode: autoValidateMode,
                            regExp: phoneNumberRegExp,
                            emptyString: '전화번호를 입력해주세요',
                            notMatchString: '숫자로만 11자리 입력해주세요.',
                            keyboardType: TextInputType.number,
                          ),
                          const SizedBox(height: 20.0),
                          UserInfoTextFormField(
                            controller: residentNumberController,
                            labelText: '주민번호',
                            currentFocusNode: residentNumberFocusNode,
                            autoValidateMode: autoValidateMode,
                            regExp: residentNumberRegExp,
                            keyboardType: TextInputType.number,
                            emptyString: '주민번호를 입력해주세요',
                            notMatchString: '올바른 주민번호를 입력해주세요',
                          ),
                          const SizedBox(height: 20.0),
                          // UserInfoTextFormField(
                          //   labelText: '이메일',
                          //   currentFocusNode: eMailFocusNode,
                          //   autoValidateMode: autoValidateMode,
                          //   isLast: true,
                          // ),

                          ///
                          /// ///
                          ///
                          // UserInfoTextFormField(
                          //   labelText: '이름',
                          //   currentFocusNode: nameFocusNode,
                          //   nextFocusNode: phoneFocusNode,
                          // ),
                          // const SizedBox(height: 20.0),
                          // UserInfoTextFormField(
                          //   labelText: '전화번호',
                          //   currentFocusNode: phoneFocusNode,
                          // ),
                          // // const SizedBox(height: 20.0),
                          // // UserInfoTextFormField(
                          // //   labelText: '주민번호',
                          // //   currentFocusNode: residentNumberFocusNode,
                          // //   autoValidateMode: autoValidateMode,
                          // // ),
                          // // const SizedBox(height: 20.0),
                          // // UserInfoTextFormField(
                          // //   labelText: '이메일',
                          // //   currentFocusNode: eMailFocusNode,
                          // //   autoValidateMode: autoValidateMode,
                          // //   isLast: true,
                          // // ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SliverFillRemaining(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          if (autoValidateMode == AutovalidateMode.disabled) {
                            setState(() {
                              autoValidateMode = AutovalidateMode.always;
                            });
                          }
                          if (widget.formKey.currentState!.validate()) {
                            final UserInfoModel newUserInfoModel = UserInfoModel(
                                name: nameController.text,
                                phoneNumber: phoneNumberController.text,
                                residentNumber: residentNumberController.text);

                            Navigator.pop(context, newUserInfoModel);
                          }
                          ;
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Center(
                            child: Text(
                              '제출하기',
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
