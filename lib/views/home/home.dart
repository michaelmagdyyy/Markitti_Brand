import 'package:brand_app/core/routes/app_routes_fun.dart';
import 'package:brand_app/core/routes/routes.dart';
import 'package:brand_app/core/utils/extensions.dart';
import 'package:brand_app/core/widgets/app_btn.dart';
import 'package:brand_app/core/widgets/flash_helper.dart';
import 'package:brand_app/views/home/widgets/home_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/widgets/custom_image.dart';
import '../../gen/assets.gen.dart';
import '../../gen/my_images.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomImage(MyImages.logo, width: 100.w, height: 50.h,).center.withPadding(top: 16.h),
            // Row(
            //   children: [
            //     CustomImage(Assets.images.test.path,
            //             width: 56.r, height: 56.r, borderRadius: BorderRadius.circular(500.r), fit: BoxFit.cover)
            //         .withPadding(end: 8.w),
            //     Expanded(
            //       child: Text("Osama Hawas", style: context.boldText.copyWith(fontSize: 16.sp, color: context.primaryColor))
            //           .withPadding(bottom: 6.h),
            //     ),
            //   ],
            // ).withPadding(vertical: 12.h),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppBtn(
                      title: "Scan",
                      onPressed: () {
                        push(NamedRoutes.scan).then((v) async {
                          if (v != null) {
                            await FlashHelper.showToast(v.toString(), type: MessageType.success);
                          } else {
                            await FlashHelper.showToast("failed");
                          }
                        });
                      }),
                ],
              ),
            ),
            // Text("Your history of transactions :", style: context.semiboldText.copyWith(fontSize: 18.sp, color: context.primaryColorDark))
            //     .withPadding(vertical: 4.h, top: 12.h),
            // Expanded(
            //   child: SingleChildScrollView(
            //     padding: EdgeInsets.symmetric(vertical: 16.h),
            //     child: Container(
            //       decoration: BoxDecoration(border: Border.all(color: context.borderColor), borderRadius: BorderRadius.circular(8.r)),
            //       child: Wrap(
            //         children: List.generate(
            //           10,
            //           (index) => const HomeItem(),
            //         ),
            //       ),
            //     ),
            //   ),
            // )
          ],
        ).withPadding(horizontal: 16.w),
      ),
    );
  }
}
