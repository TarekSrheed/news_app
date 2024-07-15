// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_flutter/core/bloc_manager/app_manager_bloc.dart';

import 'package:news_app_flutter/core/res/app_color.dart';
import 'package:news_app_flutter/core/res/app_images.dart';
import 'package:news_app_flutter/core/res/app_string.dart';
import 'package:news_app_flutter/core/res/app_style.dart';
import 'package:news_app_flutter/features/data/model/user_model.dart';
import 'package:news_app_flutter/features/view/bloc/auth_bloc/auth_bloc.dart';
import 'package:news_app_flutter/features/view/widgets/my_botton.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController username = TextEditingController();

  final TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: Builder(builder: (context) {
        return Scaffold(
          body: Form(
            key: formkey,
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(newsLogo),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 10,
                  ),
                  child: SizedBox(
                    width: 340,
                    height: 60,
                    child: TextFormField(
                      controller: username,
                      validator: (value) {
                        if (value!.length < 3) {
                          return 'The user name is to short';
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        labelText: "Username",
                        labelStyle: hintStyle,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 10,
                  ),
                  child: SizedBox(
                    width: 340,
                    height: 60,
                    child: TextFormField(
                      controller: password,
                      obscureText: true,
                      validator: (value) {
                        if (value!.length < 8) {
                          return 'The password is to week';
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        suffixIcon: const Icon(
                          Icons.visibility_off,
                          size: 22,
                        ),
                        labelText: "Password",
                        labelStyle: hintStyle,
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    FORGOTPASSWORD,
                    style: forgotStyle,
                  ),
                ),
                BlocListener<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state is SuccessToLogIn) {
                      context.read<AppManagerBloc>().add(Success());
                    }
                    if (state is FailedToLogIn) {
                      context.read<AppManagerBloc>().add(Failed());
                    }
                  },
                  child: InkWell(
                    onTap: () {
                      context.read<AuthBloc>().add(
                            LogIn(
                              user: UserModel(
                                username: username.text,
                                password: password.text,
                              ),
                            ),
                          );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 45,
                      width: 169,
                      decoration: BoxDecoration(
                        color: primaryBlue,
                        borderRadius: BorderRadius.circular(44),
                      ),
                      child: Text(
                        SIGNIN,
                        style: signInStyle,
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        indent: 20,
                        endIndent: 10,
                        color: lightGrey,
                      ),
                    ),
                    Text(
                      ORSIGN,
                      style: orSignInStyle,
                    ),
                    Expanded(
                      child: Divider(
                        indent: 10,
                        endIndent: 20,
                        color: lightGrey,
                      ),
                    ),
                  ],
                ),
                Mybotton(
                  title: CONTINUTGOOGEL,
                  image: googel,
                ),
                // const SizedBox(
                //   height: 20,
                // ),
                Mybotton(
                  title: CONTINUTFACEBOOK,
                  image: facebook,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      DONTHAVE,
                      style: donthaveStyle,
                    ),
                    Text(
                      REGISTER,
                      style: registerStyle,
                    )
                  ],
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
