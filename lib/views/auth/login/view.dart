import 'package:brand_app/core/utils/extensions.dart';
import 'package:brand_app/core/widgets/app_btn.dart';
import 'package:brand_app/core/widgets/app_field.dart';
import 'package:brand_app/core/widgets/auth_scaffold.dart';
import 'package:brand_app/gen/locale_keys.g.dart';
import 'package:brand_app/views/auth/login/controller/state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/routes/app_routes_fun.dart';
import '../../../core/routes/routes.dart';
import '../../../core/services/service_locator.dart';
import 'controller/bloc.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final bloc = sl<LoginBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: bloc,
      listener: (context, state) {},
      builder: (context, state) {
        return Form(
          key: bloc.formKey,
          autovalidateMode: bloc.autoValidateMode,
          child: AuthScaffold(
              title: LocaleKeys.sign_in_button.tr(),
              desc: LocaleKeys.sign_in_message.tr(),
              widget: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppField(
                    title: LocaleKeys.mobile.tr(),
                    keyboardType: TextInputType.phone,
                    controller: bloc.phone,
                  ),
                  AppField(
                    title: LocaleKeys.password.tr(),
                    hintText: "***********",
                    keyboardType: TextInputType.visiblePassword,
                    controller: bloc.password,
                  ).withPadding(vertical: 16.h),
                  AppBtn(
                      title: LocaleKeys.sign_in.tr(),
                      loading: state is LoadingLoginState,
                      onPressed: () {
                        // if (bloc.formKey.currentState!.validate()) {
                        //   bloc.add(StartLoginEvent());
                        // } else {
                        //   bloc.autoValidateMode = AutovalidateMode.onUserInteraction;
                        //   setState(() {});
                        // }
                        push(NamedRoutes.home);
                      }),
                ],
              )),
        );
      },
    );
  }
}
