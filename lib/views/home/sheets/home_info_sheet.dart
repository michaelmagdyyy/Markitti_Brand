import 'package:brand_app/core/utils/extensions.dart';
import 'package:brand_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/widgets/custom_circle_icon.dart';
import '../../../core/widgets/custom_image.dart';

class HomeInfoSheet extends StatelessWidget {
  const HomeInfoSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: context.h - (kToolbarHeight + 30.h)),
      decoration:
          BoxDecoration(color: context.scaffoldBackgroundColor, borderRadius: BorderRadiusDirectional.vertical(top: Radius.circular(32.r))),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 20.h, horizontal: 24.w),
              height: 5.h,
              width: 134.w,
              decoration: BoxDecoration(
                color: context.hintColor,
                borderRadius: BorderRadius.circular(4.r),
              ),
            ).center,
            Row(
              children: [
                CustomRadiusIcon(
                  size: 40.h,
                  borderRadius: BorderRadius.circular(6.r),
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    Icons.close,
                    size: 20.h,
                  ),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: Text(
                    "Scan details",
                    style: context.boldText.copyWith(fontSize: 20.sp, color: context.primaryColor),
                  ),
                )
              ],
            ).withPadding(horizontal: 24.w, bottom: 12.h),
            Flexible(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        CustomImage(
                          Assets.images.test.path,
                          width: 56.r,
                          height: 56.r,
                          border: Border.all(color: context.borderColor),
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Service Name", style: context.boldText.copyWith(fontSize: 20.sp)),
                              Row(
                                children: List.generate(
                                  5,
                                  (index) => Icon(Icons.star_rate_rounded,
                                      size: 18.r, opticalSize: 18.r, color: index == 4 ? context.borderColor : context.hoverColor),
                                ),
                              )
                            ],
                          ).withPadding(start: 8.w),
                        ),
                        Container(
                          width: 48.r,
                          height: 48.r,
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(8.r),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [
                                context.secondaryColor,
                                context.primaryColor,
                              ]),
                              shape: BoxShape.circle),
                          child: FittedBox(
                            child: Text(
                              "25%",
                              style: context.boldText.copyWith(fontSize: 14.sp, color: context.primaryColorLight),
                            ),
                          ),
                        )
                      ],
                    ).withPadding(vertical: 8.h),
                    Row(
                      children: [
                        Text("status : ",
                            style: context.mediumText.copyWith(fontSize: 16.sp, color: context.primaryColorDark.withOpacity(.4))),
                        Text("Success", style: context.boldText.copyWith(fontSize: 16.sp, color: context.indicatorColor))
                      ],
                    ),
                    Row(
                      children: [
                        Text("Price : ",
                            style: context.mediumText.copyWith(fontSize: 16.sp, color: context.primaryColorDark.withOpacity(.4))),
                        Text("2500", style: context.boldText.copyWith(fontSize: 16.sp, color: context.primaryColorDark))
                      ],
                    ),
                    Row(
                      children: [
                        Text("Date : ",
                            style: context.mediumText.copyWith(fontSize: 16.sp, color: context.primaryColorDark.withOpacity(.4))),
                        Text("12/3/2024", style: context.boldText.copyWith(fontSize: 16.sp, color: context.primaryColorDark))
                      ],
                    ),
                    Text('Ahmed Mohammed Registered and activated via your iCode ' * 3,
                        style: context.regularText.copyWith(fontSize: 14.sp))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
