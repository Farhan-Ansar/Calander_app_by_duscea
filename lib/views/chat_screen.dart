import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../AppConstant/app_constant.dart';
import '../Resources/Components/custom_app_bar.dart';
import '../Resources/Components/my_drawer.dart';

enum MessageType { text, image, pdf }

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _advancedDrawerController = AdvancedDrawerController();
  final List<Message> messages = [
    Message(
      sender: 'User1',
      text: 'Hello!',
      timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
      senderImageUrl: 'assets/images/User11.svg',
      type: MessageType.text,
    ),
    Message(
      sender: 'User2',
      text: 'Hi there!',
      timestamp: DateTime.now().subtract(const Duration(minutes: 3)),
      senderImageUrl: 'assets/images/User12.svg',
      type: MessageType.text,
    ),
    Message(
      sender: 'User1',
      text: 'Here\'s a PDF',
      timestamp: DateTime.now().subtract(const Duration(minutes: 2)),
      senderImageUrl: 'assets/images/User11.svg',
      type: MessageType.image,
      attachmentUrl: 'assets/images/Images.png',
    ),
    Message(
      sender: 'User2',
      text: null,
      timestamp: DateTime.now(),
      senderImageUrl: 'assets/images/User12.svg',
      type: MessageType.pdf,
      attachmentUrl: 'assets/docs/Flutter Hiring Task 6.pdf',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AdvancedDrawer(
        backdropColor: kColorBackGround,
        controller: _advancedDrawerController,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 100),
        childDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
        drawer: MyDrawer(),
        child: Scaffold(
          backgroundColor: kColorBackGround,
          appBar: CustomAppBar(controller: _advancedDrawerController),
          body: Column(
            children: [
              const Divider(color: kColorGrey),
              Row(
                children: [
                  const SizedBox(width: 10),
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.arrow_back)),
                  Expanded(
                    child: ListTile(
                      leading: SvgPicture.asset('assets/images/User11.svg'),
                      trailing: SvgPicture.asset("assets/images/moore.svg"),
                      title: Text("Design Team", style: kStyleBlack15400),
                      subtitle:
                          Text("6 Members, 3 Online", style: kStyleGrey15400),
                    ),
                  ),
                ],
              ),
              const Divider(color: kColorGrey),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: double.infinity,
                    decoration: ShapeDecoration(
                      color: kColorWhite,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x19040F15),
                          blurRadius: 30,
                          offset: Offset(0, 20),
                          spreadRadius: -18,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemCount: messages.length,
                            itemBuilder: (context, index) {
                              final message = messages[index];
                              return MessageBubble(
                                message: message,
                                isMe: message.sender == 'User1',
                              );
                            },
                          ),
                        ),
                        _buildMessageInput(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMessageInput() {
    final TextEditingController _controller = TextEditingController();
    bool _isPrefixIconClicked = true;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Column(
        children: [
          TextFormField(
            controller: _controller,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
              labelText: 'Type a message...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: const BorderSide(color: kColorGrey),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: const BorderSide(color: kColorGrey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: const BorderSide(color: kColorBlues),
              ),
              prefixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _isPrefixIconClicked = !_isPrefixIconClicked;
                  });
                },
                child: Padding(
                  padding: EdgeInsets.all(_isPrefixIconClicked ? 12.0 : 8.0),
                  child:
                      SvgPicture.asset("assets/images/User12.svg", height: 10),
                ),
              ),
              suffixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset("assets/images/Send.svg"),
              ),
            ),
          ),
          Visibility(
            visible: _isPrefixIconClicked,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SvgPicture.asset("assets/images/Smile.svg"),
                  SizedBox(width: 5.w),
                  SvgPicture.asset("assets/images/Attachment.svg"),
                  SizedBox(width: 5.w),
                  SvgPicture.asset("assets/images/Image.svg"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  final Message message;
  final bool isMe;

  const MessageBubble({required this.message, required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment:
                isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              if (!isMe)
                ClipOval(
                  child: SvgPicture.asset(
                    message.senderImageUrl,
                    width: 30,
                    height: 30,
                    fit: BoxFit.cover,
                  ),
                ),
              const SizedBox(width: 8),
              Text(
                message.sender,
                style: kStyleBlack15600,
              ),
              const SizedBox(width: 4),
              Text(
                '${message.timestamp.hour}:${message.timestamp.minute}',
                style: kStyleGrey12400,
              ),
              if (isMe)
                const SizedBox(width: 8),
              if (isMe)
                ClipOval(
                  child: SvgPicture.asset(
                    message.senderImageUrl,
                    width: 30,
                    height: 30,
                    fit: BoxFit.cover,
                  ),
                ),
            ],
          ),
          Padding(
            padding: isMe
                ? const EdgeInsets.only(right: 20.0)
                : const EdgeInsets.only(left: 20.0),
            child: Align(
              alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                margin:
                    const EdgeInsets.only(top: 4, left: 8, right: 8, bottom: 8),
                decoration: message.type == MessageType.text
                    ? BoxDecoration(
                        color: isMe ? Colors.blue : Colors.grey[300],
                        borderRadius: BorderRadius.circular(12),
                      )
                    : null, // No background color for image or PDF
                child: message.type == MessageType.text
                    ? Text(
                        message.text ?? '',
                        style: isMe ? kStyleBlack14400 : kStyleBlack15400,
                      )
                    : message.type == MessageType.image
                        ? Image.asset(message.attachmentUrl ?? '')
                        : Container(
                            decoration: ShapeDecoration(
                              color: kColorGrey, // Transparent background
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child:
                                  SvgPicture.asset("assets/images/FilePdf.svg"),
                            ),
                          ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Message {
  final String sender;
  final String? text;
  final DateTime timestamp;
  final String senderImageUrl;
  final MessageType type;
  final String? attachmentUrl;

  Message({
    required this.sender,
    this.text,
    required this.timestamp,
    required this.senderImageUrl,
    required this.type,
    this.attachmentUrl,
  });
}
