import 'package:brand_app/core/utils/extensions.dart';
import 'package:brand_app/views/home/sheets/home_info_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/widgets/custom_circle_icon.dart';
import '../../../core/widgets/custom_image.dart';
import '../../../gen/assets.gen.dart';

class HomeItem extends StatelessWidget {
  const HomeItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      onTap: () {
        showModalBottomSheet(context: context, builder: (context) => const HomeInfoSheet(),);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(border: Border.all(color: context.borderColor), color: context.primaryColor.withOpacity(.3)),
        child: Row(children: [
          CustomRadiusIcon(
            size: 48.r,
            child: CustomImage(
              Assets.svg.notify,
              width: 24.r,
              height: 24.r,
            ),
          ).withPadding(end: 8.w),
          Expanded(
              child: Text('Ahmed Mohammed Registered and activated via your iCode ', style: context.regularText.copyWith(fontSize: 14.sp))
                  .withPadding(end: 8.w)),
          Text('12:36 pm', style: context.mediumText.copyWith(fontSize: 12, color: context.primaryColorDark.withOpacity(.5)))
        ]),
      ),
    );
  }
}
