import 'package:color_gen_app/constants/app_theming_constants.dart';
import 'package:color_gen_app/constants/dialog_constants.dart';
import 'package:flutter/material.dart';

void showSimpleInfoDialog(
  BuildContext context, {
  String? titleStr,
  String? contentStr,
}) async {
  await showDialog<String>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) => AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kGeneralRoundingValue),
      ),
      title: titleStr != null
          ? Text(
              titleStr,
              textAlign: TextAlign.center,
            )
          : null,
      content: contentStr != null
          ? Text(
              contentStr,
              textAlign: TextAlign.center,
            )
          : null,
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(const Color(0xFFD7D7D7)),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            padding: MaterialStateProperty.all(
              const EdgeInsets.all(kGeneralRoundingValue),
            ),
          ),
          child: const Text(
            kDefaultGoBackBtnText,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        )
      ],
    ),
  );
}
