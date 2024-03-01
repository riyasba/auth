import 'package:auth/widgets/form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


mixin AppConstant {
  static const Color primaryColor = Color(0xffF98448);
  static const Color secondaryColor = Color(0xffFFCD38);
  static const Color appBlack = Color.fromARGB(255, 0, 0, 0);
  static const Color appWhite = Color.fromARGB(255, 255, 255, 255);
  static const Color subtitleColor = Color.fromARGB(255, 190, 190, 190);

  static const String googleMapPlacesApi =
      'AIzaSyCKDSTGjMpSQsEkx5LF1C1CCKyzCORGTR8';

  static const String linkedInAppAccessToken =
      'AQWh9KD4U7pu16pgVED3_13iZCQohHwt4aVgQwBVbzmAgqW7h-3RcKdy2v4lP76a5C6LepJJIwpCx_GjkesXZbmJnglO3TeXKJFYZMx2U9YZZ6fFRWu-d2p45CIh-6w2ws9NQwEQMKkdlP4xqXh9DhHyfWU0aIoyLKgHpYs3gqPVCRx7pT9xD00h5WI53MqylC6WbuFWaaSd1-XUbzd6cipNaPo3AagBeJl4eSBDMOjXWA3ts5DqeylLpkZDkKKcKQsOy0IY4Ku1E1ijM_gju8ADaX32O7g-KlePcXVmXt2dLWszScE1zjXaBDpUmBBJtZrSaFsX-tQQ06RZMfCevgV6p4ZCFQ';

  static const String redirectUrl =
      'https://www.linkedin.com/developers/tools/oauth/redirect';
  static const String clientId = '86yqvu7z4wn8h9';
  static const String clientSecret = 'bsKjjBx6EfPc5KK3';

  static showLoader({
    required BuildContext context,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Center(
          child: Container(
            height: 50,
            width: 260,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(
                10,
              ),
            ),
            child: CircularProgressIndicator(
              strokeWidth: 5,
              color:AppColors.green ,
            ),
          ),
        );
      },
    );
  }

  static showSnackbar({
    required String headText,
    required String content,
    required SnackPosition position,
  }) {
    return Get.snackbar(
  headText,
  content,
  duration: const Duration(seconds: 3),
  snackPosition: position,
  backgroundColor: Colors.green, // Change background color here
  colorText: Colors.white, // Change text color here
);
  }

  static showSocketExceptionError() {
    return Get.snackbar(
      "Failed",
      "You are offline.",
      duration: const Duration(seconds: 2),
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
