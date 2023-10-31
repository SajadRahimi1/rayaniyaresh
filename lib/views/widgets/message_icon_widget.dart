import 'package:flutter/material.dart' show Icon, Icons, Color;

Icon? messageIcon(bool success, bool isSend, bool isSeen, bool isUserSend) {
  if (!isSend) {
    return const Icon(Icons.access_time);
  }

  if (!isUserSend) return null;

  if (success) {
    return isSeen
        ? const Icon(Icons.done_all, color: Color(0xff00ff00))
        : const Icon(Icons.check);
  }

  return const Icon(Icons.error, color: Color(0xffff0000));
}
