import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'package:wonder_shop/core/utils/assets.dart';

Widget lottieStatusRequest(StatusRequest statusRequest) {
  String? lottiePath;

  switch (statusRequest) {
    case StatusRequest.loading:
      lottiePath = AssetsData.loadingLottie;
      break;
    case StatusRequest.failure:
      lottiePath = AssetsData.baseLottieUrl + '/failure.json';
      break;
    case StatusRequest.internetFailure:
      lottiePath = AssetsData.baseLottieUrl + '/noInternet.json';
      break;
    case StatusRequest.dataEmpty:
      lottiePath = AssetsData.baseLottieUrl + '/empty.json';
      break;
    case StatusRequest.success:
      return const SizedBox.shrink(); // no animation for success
  }

  return SizedBox(
    height: 20.h,
    width: 50.w,
    child: Center(
      child: lottiePath != null
          ? Lottie.asset(
        lottiePath,
        fit: BoxFit.cover,
        repeat: true,
      )
          : const SizedBox.shrink(),
    ),
  );
}

enum StatusRequest {
  loading,
  success,
  failure,
  internetFailure,
  dataEmpty,
}

