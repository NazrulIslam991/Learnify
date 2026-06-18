import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EdubotScreen extends StatefulWidget {
  const EdubotScreen({super.key});

  @override
  State<EdubotScreen> createState() => _EdubotScreenState();
}

class _EdubotScreenState extends State<EdubotScreen> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  List<Map<String, dynamic>> messages = [
    {"text": "Hi 👋 I'm EduBot\nYour AI Study Companion 🤖", "isUser": false},
  ];

  void sendMessage() {
    if (_controller.text.trim().isEmpty) return;

    setState(() {
      messages.add({"text": _controller.text, "isUser": true});

      messages.add({"text": "Thinking... 🤖", "isUser": false});
    });

    _controller.clear();

    Future.delayed(const Duration(milliseconds: 200), () {
      _scrollToBottom();
    });
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F1020),
      body: SafeArea(
        child: Column(
          children: [
            /// 🔥 PREMIUM HEADER
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF6C63FF), Color(0xFF9D4EDD)],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25.r),
                  bottomRight: Radius.circular(25.r),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(6.r),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: const Icon(Icons.smart_toy, color: Colors.black),
                  ),
                  SizedBox(width: 12.w),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "EduBot AI",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Smart Study Assistant",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 11.sp,
                        ),
                      ),
                    ],
                  ),

                  const Spacer(),

                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 5.h,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Text(
                      "ONLINE",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            /// 🔥 CHAT AREA
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final msg = messages[index];
                  final isUser = msg["isUser"];

                  return Align(
                    alignment: isUser
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.only(bottom: 10.h),
                      padding: EdgeInsets.all(12.r),
                      constraints: BoxConstraints(maxWidth: 270.w),
                      decoration: BoxDecoration(
                        color: isUser
                            ? const Color(0xFF6C63FF)
                            : const Color(0xFF1B1D33),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16.r),
                          topRight: Radius.circular(16.r),
                          bottomLeft: isUser
                              ? Radius.circular(16.r)
                              : Radius.zero,
                          bottomRight: isUser
                              ? Radius.zero
                              : Radius.circular(16.r),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            blurRadius: 8,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Text(
                        msg["text"],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.sp,
                          height: 1.3,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            /// 🔥 INPUT BAR (MODERN)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: const Color(0xFF1B1D33),
                borderRadius: BorderRadius.vertical(top: Radius.circular(22.r)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    blurRadius: 15,
                    offset: const Offset(0, -3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(30.r),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.08),
                        ),
                      ),
                      child: TextField(
                        controller: _controller,
                        style: TextStyle(color: Colors.white, fontSize: 13.sp),
                        decoration: InputDecoration(
                          hintText: "Ask anything about study...",
                          hintStyle: TextStyle(
                            color: Colors.white38,
                            fontSize: 12.sp,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: 10.w),

                  GestureDetector(
                    onTap: sendMessage,
                    child: Container(
                      padding: EdgeInsets.all(12.r),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [Color(0xFF6C63FF), Color(0xFF9D4EDD)],
                        ),
                      ),
                      child: Icon(
                        Icons.send_rounded,
                        color: Colors.white,
                        size: 18.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
