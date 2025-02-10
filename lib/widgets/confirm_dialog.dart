import 'package:flutter/material.dart';

class ConfirmDialog<T> extends StatelessWidget {
  final String title;
  final String content;
  final String cancelText;
  final String confirmText;
  final Color? confirmColor;
  final T? Function()? onConfirm;
  final T? Function()? onCancel;
  final bool barrierDismissible;
  final Widget? titleWidget;
  final Widget? contentWidget;

  const ConfirmDialog({
    super.key,
    this.title = '',
    this.content = '',
    this.cancelText = '取消',
    this.confirmText = '确定',
    this.confirmColor,
    this.onConfirm,
    this.onCancel,
    this.barrierDismissible = true,
    this.titleWidget,
    this.contentWidget,
  });

  static Future<T?> show<T>({
    required BuildContext context,
    String title = '',
    String content = '',
    String cancelText = '取消',
    String confirmText = '确定',
    Color? confirmColor,
    T? Function()? onConfirm,
    T? Function()? onCancel,
    bool barrierDismissible = true,
    Widget? titleWidget,
    Widget? contentWidget,
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) => ConfirmDialog<T>(
        title: title,
        content: content,
        cancelText: cancelText,
        confirmText: confirmText,
        confirmColor: confirmColor,
        onConfirm: onConfirm,
        onCancel: onCancel,
        titleWidget: titleWidget,
        contentWidget: contentWidget,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (titleWidget != null)
              titleWidget!
            else if (title.isNotEmpty)
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            const SizedBox(height: 16),
            if (contentWidget != null)
              contentWidget!
            else if (content.isNotEmpty)
              Text(
                content,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      final result = onCancel?.call();
                      Navigator.of(context).pop(result);
                    },
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: const BorderSide(color: Colors.grey),
                      ),
                    ),
                    child: Text(
                      cancelText,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      final result = onConfirm?.call();
                      Navigator.of(context).pop(result);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: confirmColor ?? Colors.red,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      confirmText,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
