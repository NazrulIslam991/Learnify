import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnify/core/resources/constant/color_manager.dart';

class GeneratingQuestionScreen extends StatefulWidget {
  const GeneratingQuestionScreen({super.key});

  @override
  State<GeneratingQuestionScreen> createState() =>
      _GeneratingQuestionScreenState();
}

class _GeneratingQuestionScreenState extends State<GeneratingQuestionScreen> {
  final String dummyText = """

Flutter is an open-source UI software development kit created by Google. It is used to develop cross-platform applications for Android, iOS, Linux, Mac, Windows, and the web from a single codebase. Flutter was first described by Google in 2015 and released in 2017. 



The core of Flutter is its widgets, which are used to build the user interface. Everything in Flutter is a widget, from buttons to layout structures. It uses the Dart programming language, which is easy to learn and offers great performance. One of the main advantages of Flutter is its 'Hot Reload' feature, which allows developers to see changes in real-time without restarting the app.

""";

  final List<Map<String, String>> qaList = [
    {
      "question": "Q1: What is Flutter?",

      "answer":
          "Flutter is an open-source UI toolkit by Google for building natively compiled applications from a single codebase.",
    },

    {
      "question": "Q2: Which language does Flutter use?",

      "answer":
          "Flutter uses the Dart programming language, which is optimized for fast UI rendering.",
    },

    {
      "question": "Q3: What is 'Hot Reload'?",

      "answer":
          "Hot Reload allows developers to instantly view code changes in the app without losing the current application state.",
    },

    {
      "question": "Q4: What is a Widget in Flutter?",

      "answer":
          "A widget is a declarative UI element that describes what its view should look like given its current configuration and state.",
    },

    {
      "question":
          "Q5: What is the difference between Stateless and Stateful widgets?",

      "answer":
          "Stateless widgets are immutable, while Stateful widgets maintain a state that can change during the widget's lifetime.",
    },

    {
      "question": "Q6: What is the main entry point of a Flutter app?",

      "answer":
          "The main entry point is the main() function, which calls the runApp() method.",
    },

    {
      "question": "Q7: Does Flutter use native UI components?",

      "answer":
          "No, Flutter uses its own high-performance rendering engine (Skia/Impeller) to draw UI components, bypassing platform-specific UI widgets.",
    },

    {
      "question": "Q8: What is the purpose of the 'pubspec.yaml' file?",

      "answer":
          "The pubspec.yaml file manages project dependencies, assets, and app configuration.",
    },

    {
      "question": "Q9: How do you handle navigation in Flutter?",

      "answer":
          "Flutter uses the Navigator class, which manages a stack of Route objects.",
    },

    {
      "question": "Q10: What are 'Packages' in Flutter?",

      "answer":
          "Packages are reusable libraries that provide extra functionality, which can be found at pub.dev.",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: ColorManager.black6,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text("Knowledge Center", style: TextStyle(fontSize: 16.sp)),
          bottom: TabBar(
            indicatorColor: Colors.purpleAccent,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white54,
            labelStyle: TextStyle(fontSize: 13.sp),
            tabs: const [
              Tab(text: "Scanned Text"),
              Tab(text: "Q&A Analysis"),
            ],
          ),
        ),
        body: TabBarView(children: [_buildTextPart(), _buildQAPart()]),
      ),
    );
  }

  Widget _buildTextPart() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(15.w),
      child: Text(
        dummyText,
        style: TextStyle(color: Colors.white70, fontSize: 14.sp, height: 1.6),
      ),
    );
  }

  Widget _buildQAPart() {
    return ListView.builder(
      padding: EdgeInsets.all(15.w),
      itemCount: qaList.length,
      itemBuilder: (context, index) {
        return Card(
          color: Colors.white.withAlpha(25),
          margin: EdgeInsets.only(bottom: 15.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  qaList[index]["question"]!,
                  style: TextStyle(
                    color: ColorManager.purpleShade,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  qaList[index]["answer"]!,
                  style: TextStyle(
                    color: Colors.white60,
                    height: 1.4,
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
