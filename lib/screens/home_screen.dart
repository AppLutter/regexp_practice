import 'package:flutter/material.dart';
import 'package:reg/models/user_info_model.dart';
import 'package:reg/screens/user_form_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UserInfoModel? userInfoModel;

  @override
  Widget build(BuildContext context) {
    return buildScaffold(userInfoModel);
  }

  Scaffold buildScaffold(UserInfoModel? userInfoModel) {
    if (userInfoModel == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text('유저 정보 입력 전'),
        ),
        body: Center(
          child: TextButton(
            onPressed: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => UserFormScreen(),
                ),
              );

              if (result is UserInfoModel) {
                setState(() {
                  userInfoModel = result;
                });
              }
            },
            child: Text('유저 정보 입력하러 가기'),
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text('유저 정보 입력 후'),
        ),
        body: Container(
          width: double.infinity,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('이름 : ${userInfoModel.name}'),
                const SizedBox(height: 20.0),
                Text('전화번호 : ${userInfoModel.phoneNumber}'),
                const SizedBox(height: 20.0),
                Text('주민번호 : ${userInfoModel.residentNumber}'),
                const SizedBox(height: 20.0),
                Text('이메일 : ${userInfoModel.eMail}'),
                const SizedBox(height: 20.0),
                TextButton(
                  onPressed: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => UserFormScreen(),
                      ),
                    );

                    if (result is UserInfoModel) {
                      setState(() {
                        userInfoModel = result;
                      });
                    }
                  },
                  child: Text('다시 입력하러 가기'),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
