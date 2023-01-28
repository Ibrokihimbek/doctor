import 'package:flutter/material.dart';

class loadingDialog extends StatelessWidget {
  Widget widget;

  loadingDialog({this.widget = const CircularProgressIndicator(), Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius:
          BorderRadius.all(
              Radius.circular(20))),
      content: Builder(
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(child: SizedBox(
                    width: 30,
                    height: 30,
                    child: widget)),
              ],
            ),
          );
        },
      ),
    );
  }
}
