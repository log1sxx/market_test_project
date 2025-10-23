import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:market_test_project/core/theme/app_colors.dart';
import 'package:market_test_project/core/widgets/app_circle_button.dart';
import 'package:market_test_project/features/chat/domain/entities/message_entity.dart';
import 'package:market_test_project/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:market_test_project/features/chat/presentation/bloc/chat_event.dart';
import 'package:market_test_project/features/chat/presentation/bloc/chat_state.dart';
import 'package:market_test_project/features/chat/presentation/widgets/chat_message_widget.dart';
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
    _chatBloc.add(ConnectChat());
    super.initState();
  }

  List<MessageEntity> messages = [];

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
                child: BlocConsumer(
                  bloc: _chatBloc,
                  listener: (context, state) {
                    if (state is ChatMessageReceived) {
                      messages.add(state.message);
                    }
                  },
                  builder: (context, state) {
                    return SingleChildScrollView(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          for (int i = 0; i < messages.length; i++)
                            ChatMessageWidget(
                              message: messages[i].content,
                              timestamp: messages[i].timestamp,
                              isMe: messages[i].sender == 'me',
                            ),
                        ],
                      ),
                    );
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
                      onTap: () {
                        messages.add(
                          MessageEntity('me', controller.text, DateTime.now()),
                        );
                        _chatBloc.add(SendChatMessage(controller.text));
                        controller.clear();
                      },
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
