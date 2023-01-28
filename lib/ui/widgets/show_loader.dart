import 'package:flutter/material.dart';

void showLoader(BuildContext context) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) {
        return Dialog(
          elevation: 0,
          insetPadding: const EdgeInsets.symmetric(horizontal: 100),
          backgroundColor: Colors.transparent,
          child: Center(
            child: Container(
              alignment: AlignmentDirectional.center,
              height: 124,
              width: 124,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(
                child: SizedBox(
                  height: 60.0,
                  width: 60.0,
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          ),
        );
      });
}

void hideLoading({required BuildContext? dialogContext}) async {
  if (dialogContext != null) Navigator.pop(dialogContext);
}
