import 'package:flutter/material.dart';

/// DS-5 bottom sheet: radius 28 top and `line` drag handle (from the
/// theme), at most 90% of the screen height.
Future<T?> showAppBottomSheet<T>(
  BuildContext context, {
  required WidgetBuilder builder,
}) {
  return showModalBottomSheet<T>(
    context: context,
    builder: builder,
    showDragHandle: true,
    isScrollControlled: true,
    useSafeArea: true,
    constraints: BoxConstraints(
      maxHeight: MediaQuery.sizeOf(context).height * 0.9,
    ),
  );
}
