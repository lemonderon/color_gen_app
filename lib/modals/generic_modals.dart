import 'package:color_gen_app/modals/dialog_constants.dart';
import 'package:color_gen_app/theme/app_theming_constants.dart';
import 'package:flutter/material.dart';

/// Shows [Dialog] with only "Go back" button. Allows [titleStr] and
/// [contentStr] as corresponding dialog title and content parameters.
/// Can be dismissed.
Future<void> showSimpleInfoDialog(
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
            overlayColor: MaterialStateProperty.all(kDialogBackgroundColor),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(kGeneralRoundingValue),
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
              fontSize: kGenericTextFontSize,
              color: Colors.black,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        )
      ],
    ),
  );
}
