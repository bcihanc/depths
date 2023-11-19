import 'package:flutter/material.dart' hide Key;
import 'package:flutter/services.dart';
import 'package:encrypt/encrypt.dart';

Future<void> closeApp({bool animated = true}) => SystemNavigator.pop(animated: animated);

void hideKeyboard(BuildContext context) {
  final currentFocus = FocusScope.of(context);
  SystemChannels.textInput.invokeMethod<dynamic>('TextInput.hide');
  if (currentFocus.hasFocus) {
    currentFocus.unfocus();
    currentFocus.focusedChild?.unfocus();
  }
}

String encrypt({required String value, required String secret}) {
  final key = Key.fromUtf8(secret);
  final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
  final initVector = IV.fromUtf8(secret.substring(0, 16));
  final encryptedData = encrypter.encrypt(value, iv: initVector);
  return encryptedData.base64;
}

String decrypt({required String value, required String secret}) {
  final key = Key.fromUtf8(secret);
  final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
  final initVector = IV.fromUtf8(secret.substring(0, 16));
  final encrypted = Encrypted.fromBase64(value);
  return encrypter.decrypt(encrypted, iv: initVector);
}
