import 'package:bot_toast/bot_toast.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:simple_chat/i18n/generated/l10n.dart';
import 'package:simple_chat/models/assistant.dart';
// import 'package:simple_chat/utils/store.dart';
import 'package:simple_chat/widgets/avatar_popup/avatar_popup.dart';
import 'package:simple_chat/widgets/common_avatar/common_avatar.dart';
import 'package:simple_chat/widgets/common_button/common_button.dart';
import 'package:simple_chat/widgets/common_popup/common_popup.dart';
import 'package:simple_chat/widgets/common_text_field/common_text_field.dart';
import 'package:simple_chat/widgets/iconfont/iconfont.dart';

/// 添加助手弹出框

class AddAssistantPopup extends ConsumerStatefulWidget {
  final BuildContext ctx;
  final void Function() cancel;
  const AddAssistantPopup({super.key, required this.ctx, required this.cancel});

  @override
  ConsumerState<AddAssistantPopup> createState() => _AddAssistantPopupState();
}

class _AddAssistantPopupState extends ConsumerState<AddAssistantPopup> {
  /// 名称
  final TextEditingController nameController = TextEditingController(text: "");

  /// 描述
  final TextEditingController descController = TextEditingController(text: "");

  /// 角色设定
  final TextEditingController roleController = TextEditingController(text: "");

  late Assistant assistant;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    assistant = Assistant(id: 0, name: "");
    nameController.text = assistant.name;
    descController.text = assistant.description;
    roleController.text = assistant.profile;
  }

  @override
  Widget build(BuildContext context) {
    final locale = S.of(context);

    return Overlay(
      initialEntries: [
        OverlayEntry(
          builder:
              (context) => Center(
                child: Container(
                  margin: EdgeInsets.all(30),
                  padding: EdgeInsets.all(20),
                  // constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.8),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surfaceContainerLowest,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).colorScheme.shadow.withAlpha(100),
                        spreadRadius: 0,
                        blurRadius: 30,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  // height: 600,
                  width: 1000,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            locale.add_ai_assistant,
                            style: TextStyle(
                              fontWeight: FontWeight.w500, //
                              fontSize: 22,
                              height: 1,
                            ),
                          ),
                          IconButton(onPressed: widget.cancel, icon: Icon(Icons.close)),
                        ],
                      ),
                      SizedBox(height: 10),
                      Expanded(
                        child: DefaultTabController(
                          length: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TabBar(
                                isScrollable: true,
                                tabAlignment: TabAlignment.start,
                                padding: EdgeInsets.all(0),
                                tabs: [
                                  // 标签标题
                                  Tab(text: locale.assistant_setup),
                                  Tab(text: locale.role_settings),
                                  Tab(text: locale.chat_settings),
                                  Tab(text: locale.advanced_settings),
                                ],
                              ),
                              Expanded(
                                child: TabBarView(
                                  children: [
                                    // 基础设置
                                    Container(
                                      padding: EdgeInsets.all(0),
                                      child: ListView(
                                        children: [
                                          // 头像
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                padding: EdgeInsets.only(right: 15),
                                                child: Stack(
                                                  children: [
                                                    CommonAvatar(avatar: assistant.avatar, radius: 35),
                                                    Positioned(
                                                      bottom: 1,
                                                      right: 1,
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          // nameController.e
                                                          // 打开头像
                                                          BotToast.showAnimationWidget(
                                                            toastBuilder: (cancelFunc) {
                                                              return AvatarPopup(
                                                                avatar: assistant.avatar,
                                                                cancel: cancelFunc,
                                                                onChange: (String avatar) {
                                                                  //
                                                                  setState(() {
                                                                    assistant.avatar = avatar;
                                                                  });
                                                                },
                                                              );
                                                            },
                                                            animationDuration: Duration(milliseconds: 200),
                                                            animationReverseDuration: Duration(milliseconds: 200),
                                                            backButtonBehavior: BackButtonBehavior.ignore,
                                                            wrapAnimation: (controller, cancel, child) {
                                                              return CommonPopup(
                                                                backgroundColor: Theme.of(context).colorScheme.shadow.withAlpha(20),
                                                                controller: controller,
                                                                cancel: cancel,
                                                                child: child,
                                                              );
                                                            },
                                                          );
                                                        },
                                                        child: Container(
                                                          padding: EdgeInsets.all(5),
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(20),
                                                            color: Theme.of(context).colorScheme.primary,
                                                          ),
                                                          child: Icon(
                                                            Icons.edit, //
                                                            size: 12,
                                                            color: Theme.of(context).colorScheme.onPrimary,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: CommonTextField(
                                                  margin: EdgeInsets.only(top: 15, bottom: 15),
                                                  title: locale.assistant_name, //
                                                  placeholder: locale.assistant_name_placeholder,
                                                  controller: nameController,
                                                  maxLength: 10,
                                                ),
                                              ),
                                            ],
                                          ),
                                          // 描述
                                          CommonTextField(
                                            maxLineHeight: 3,
                                            multiLine: true,
                                            margin: EdgeInsets.only(top: 0, bottom: 15),
                                            title: locale.assistant_desc, //
                                            placeholder: locale.assistant_desc_placeholder,
                                            controller: descController,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(vertical: 16),
                                      child: Column(
                                        children: [
                                          // 角色设定
                                          CommonTextField(
                                            maxLineHeight: 10,
                                            multiLine: true,
                                            margin: EdgeInsets.only(top: 0, bottom: 15),
                                            title: locale.role_settings, //
                                            placeholder: locale.role_settings_placeholder,
                                            descript: locale.role_settings_tips,
                                            controller: roleController,
                                          ),
                                        ],
                                      ),
                                    ),
                                    // 高级设置
                                    Container(
                                      padding: EdgeInsets.all(16),
                                      child: Column(
                                        children: [
                                          TextField(
                                            controller: nameController,
                                            decoration: InputDecoration(labelText: "系统提示词", border: OutlineInputBorder()),
                                            maxLines: 3,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(padding: EdgeInsets.all(16), child: Column(children: [Text("标签内容")])),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CommonButton(
                            text: "取消",
                            onTap: widget.cancel, //
                          ),
                          SizedBox(width: 20),
                          CommonButton(
                            text: "保存",
                            icon: Iconfont.save,
                            color: Theme.of(context).colorScheme.onPrimary,
                            bgColor: Theme.of(context).colorScheme.primary,
                            onTap: () {}, //
                            border: false,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
        ),
      ],
    );
  }
}
