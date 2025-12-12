import 'package:brand_app/core/utils/extensions.dart';
import 'package:brand_app/gen/my_images.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../gen/assets.gen.dart';
import 'custom_image.dart';

class AuthScaffold extends StatelessWidget {
  const AuthScaffold({super.key, required this.title, required this.desc, required this.widget});

  final String title, desc;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomImage(MyImages.logo,width: 100.w, height: 50.h)
                  .center
                  .withPadding(top: 16.h),
              Text(title, style: context.boldText.copyWith(fontSize: 32.sp))
                  .withPadding(top: 24.h, bottom: 8.h),
              Text(desc, style: context.regularText.copyWith(fontSize: 16.sp))
                  .withPadding(bottom: 20.h),
              widget
            ],
          ),
        ),
      ),
    );
  }
}
