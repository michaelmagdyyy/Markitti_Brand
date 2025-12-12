import 'package:brand_app/core/utils/extensions.dart';
import 'package:brand_app/core/widgets/app_btn.dart';
import 'package:brand_app/core/widgets/app_field.dart';
import 'package:brand_app/gen/locale_keys.g.dart';
import 'package:brand_app/views/scan/controller/state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../core/services/service_locator.dart';
import '../../core/widgets/flash_helper.dart';
import 'controller/bloc.dart';
import 'controller/event.dart';

class QRScannerScreen extends StatefulWidget {
  const QRScannerScreen({super.key});

  @override
  State<QRScannerScreen> createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<QRScannerScreen> {
  String? scannedData;
  bool isScanComplete = false;
  late final bloc = sl<CodeBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: bloc,
      listener: (context, state) {
        // if (state is FailedSocketQrState) {
        //   FlashHelper.showToast(state.msg, type: MessageType.fail);
        // }
        if (state is DoneSocketQrState) {
          showModalBottomSheet(
              context: context,
              builder: (context) => Container(
                width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(16.r), topRight: Radius.circular(16.r))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(LocaleKeys.brand_details.tr(), style: context.semiboldText.copyWith(fontSize: 16.sp)),
                        Text("${bloc.infoModel?.brandName}", style: context.boldText.copyWith(fontSize: 16.sp, color: context.primaryColor)).withPadding(top: 8.h,),
                        Text(LocaleKeys.branchCity.tr(), style: context.semiboldText.copyWith(fontSize: 16.sp)),
                        Text("${bloc.infoModel?.branchName}", style: context.boldText.copyWith(fontSize: 16.sp, color: context.primaryColor)).withPadding(top: 8.h,),
                        Text("${LocaleKeys.invoiceAmount.tr()}", style: context.semiboldText.copyWith(fontSize: 16.sp)),
                        Text("${bloc.infoModel?.invoiceAmount} L.E", style: context.boldText.copyWith(fontSize: 16.sp, color: context.primaryColor)).withPadding(top: 8.h,),
                        Text("${LocaleKeys.discountPercentage.tr()}", style: context.semiboldText.copyWith(fontSize: 16.sp)),
                        Text("${bloc.infoModel?.discountPercentage} L.E", style: context.boldText.copyWith(fontSize: 16.sp, color: context.primaryColor)).withPadding(top: 8.h, bottom: 16.h),
                        Text("${LocaleKeys.amountToBePaid.tr()}", style: context.semiboldText.copyWith(fontSize: 16.sp)),
                        Text("${bloc.infoModel?.amountToBePaid} L.E", style: context.boldText.copyWith(fontSize: 16.sp, color: context.primaryColor)).withPadding(top: 8.h,),
                        Text(LocaleKeys.transactionDateTime.tr(), style: context.semiboldText.copyWith(fontSize: 16.sp)),
                        Text("${bloc.infoModel?.transactionDateTime}", style: context.boldText.copyWith(fontSize: 16.sp, color: context.primaryColor)).withPadding(top: 8.h,),
                        SizedBox(height: 20,)
                      ],
                    ),
                  ));
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(LocaleKeys.codeScan.tr(), style: context.mediumText.copyWith(color: Colors.white)),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 400.h,
                  child: MobileScanner(
                    onDetect: (capture) {
                      final List<Barcode> barcodes = capture.barcodes;
                      for (final barcode in barcodes) {
                        if (!isScanComplete && barcode.rawValue != null) {
                          isScanComplete = true;
                          setState(() {
                            scannedData = barcode.rawValue!;
                          });
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text(LocaleKeys.codeScan.tr()),
                              content: Text(barcode.rawValue!),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(); // Close dialog
                                    setState(() {
                                      isScanComplete = false; // Resume scanning
                                    });
                                  },
                                  child: Text('Scan Again'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(); // Close dialog
                                    // Navigator.of(context).pop(scannedData); // Return scanned data
                                  },
                                  child: Text('Return Data'),
                                ),
                              ],
                            ),
                          );
                        }
                      }
                    },
                  ),
                ),
                AppField(
                  title: LocaleKeys.codeScan.tr(),
                  controller: TextEditingController(text: scannedData),
                  onTap: () {},
                ).withPadding(top: 24.h, horizontal: 16.w),
                AppField(
                  title: LocaleKeys.price.tr(),
                  controller: bloc.price,
                  keyboardType: TextInputType.number,
                ).withPadding(bottom: 16.h, horizontal: 16.w),
                AppBtn(
                  title: LocaleKeys.confirm.tr(),
                  loading: state is LoadingCodeState,
                  onPressed: () {
                    if (bloc.price.text.isNotEmpty) {
                      if (scannedData != null) {
                        bloc.add(GetCodeEvent(qr: scannedData!));
                      } else {
                        FlashHelper.showToast("code is failed", type: MessageType.fail);
                      }
                    } else {
                      FlashHelper.showToast("add price first", type: MessageType.fail);
                    }
                  },
                ).withPadding(vertical: 24.h, horizontal: 32.w),
                AppBtn(
                  title: LocaleKeys.show_info.tr(),
                  loading: state is LoadingSocketQrState,
                  onPressed: () {
                    bloc.add(SocketQrEvent(qrCode: scannedData ?? "empty"));
                  },
                ).withPadding(vertical: 24.h, horizontal: 32.w),
              ],
            ),
          ),
        );
      },
    );
  }
}
