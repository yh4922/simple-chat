import 'package:flutter/material.dart';
import 'package:simple_chat/i18n/generated/l10n.dart';

class CommonTextField extends StatefulWidget {
  /// 输入控制器
  final TextEditingController? controller;

  /// 焦点控制器
  final FocusNode? focusNode;

  /// 标题
  final String title;

  /// 描述文本
  final String? descript;

  /// 占位文本
  final String? placeholder;

  /// 内边距
  final EdgeInsetsGeometry? padding;

  /// 外边距
  final EdgeInsetsGeometry? margin;

  /// 是否多行
  final bool multiLine;

  /// 最大行高
  final int maxLineHeight;

  /// 最大
  final int? maxLength;

  const CommonTextField({
    //
    super.key,
    this.controller,
    this.focusNode,
    required this.title,
    this.descript,
    this.placeholder,
    this.padding,
    this.margin,
    this.multiLine = false,
    this.maxLineHeight = 3,
    this.maxLength,
  });

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  @override
  Widget build(BuildContext context) {
    final locale = S.of(context);

    return Container(
      padding: widget.padding,
      margin: widget.margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: TextStyle(
              //
              fontSize: 14,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5, bottom: 2),
            height: widget.multiLine ? null : (42 + (widget.maxLength == null ? 0 : 20)),
            child: TextField(
              controller: widget.controller,
              focusNode: widget.focusNode,
              maxLength: widget.maxLength,
              maxLines: widget.multiLine ? widget.maxLineHeight : 1,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: widget.multiLine ? 10 : 2),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(color: Theme.of(context).colorScheme.secondaryFixedDim, width: 1),
                ),
                // 错误标签
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(color: Theme.of(context).colorScheme.error, width: 1),
                ),
                // 禁用状态
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(color: Theme.of(context).colorScheme.primaryFixedDim, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 2),
                ),
                // 获取焦点边框
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(color: Theme.of(context).colorScheme.error, width: 2),
                ),
                // 占位文本
                hintText: widget.placeholder ?? locale.please_enter,
                hintStyle: TextStyle(color: Theme.of(context).colorScheme.onSurface.withAlpha(100), fontSize: 14),
                // 背景颜色
                fillColor: Theme.of(context).colorScheme.surfaceContainerLowest,
                hoverColor: Theme.of(context).colorScheme.surfaceContainerLowest,
                filled: true,
              ),
              style: TextStyle(fontSize: 14),
            ),
          ),
          widget.descript == null
              ? SizedBox.shrink()
              : Text(
                widget.descript!,
                style: TextStyle(
                  //
                  fontSize: 12,
                  color: Theme.of(context).colorScheme.onSurface.withAlpha(200),
                ),
              ),
        ],
      ),
    );
  }
}
