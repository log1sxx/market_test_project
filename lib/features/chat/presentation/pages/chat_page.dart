import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:market_test_project/core/theme/app_colors.dart';
import 'package:market_test_project/core/widgets/app_circle_button.dart';
import 'package:market_test_project/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:market_test_project/features/chat/presentation/bloc/chat_event.dart';
import 'package:market_test_project/gen/assets.gen.dart';

@RoutePage()
class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final controller = TextEditingController();
  final _chatBloc = GetIt.I<ChatBloc>();
  @override
  void initState() {
    _chatBloc.add(ConnectToChat());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(title: Text('Связаться с нами')),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: StreamBuilder(
                  stream: _chatBloc.repository.listenMessages(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) return Text('Нет сообщений');
                    return Text(snapshot.data!.content);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                child: Row(
                  children: [
                    Flexible(
                      child: TextField(
                        controller: controller,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    AppCircleButton(
                      icon: Assets.icons.send,
                      padding: 10,
                      buttonSize: 46,
                      radius: 12,
                      backgroundColor: ColorStyles.crimson400,
                      onTap: () =>
                          _chatBloc.add(SendChatMessage(controller.text)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
