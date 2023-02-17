import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:calci/providers/calc_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

class HistoryList extends StatefulWidget {
  const HistoryList({super.key});

  @override
  State<HistoryList> createState() => _HistoryListState();
}

class _HistoryListState extends State<HistoryList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.grey,
        title: AnimatedTextKit(
          animatedTexts: [
            TyperAnimatedText(
              'History',
              speed: Duration(
                milliseconds: 200,
              ),
              textStyle: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
          isRepeatingAnimation: false,
          repeatForever: false,
          displayFullTextOnTap: true,
          stopPauseOnTap: false,
        ),
        backgroundColor: Colors.grey[300],
        centerTitle: true,
        elevation: 0,
        actions: [
          Consumer<CalcProvider>(
            builder: (context, value, child) {
              return IconButton(
                onPressed: () {
                  setState(
                    () {
                      value.inputDatas.length = 0;
                      value.resultDatas.length = 0;
                    },
                  );
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.grey,
                ),
              );
            },
          ),
        ],
      ),
      body: Consumer<CalcProvider>(
        builder: (context, value, child) {
          return AnimationLimiter(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: value.inputDatas.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                    left: 10,
                    right: 10.0,
                    top: index == 0 ? 10.0 : 0.0,
                  ),
                  child: AnimationConfiguration.staggeredList(
                    position: index,
                    delay: const Duration(milliseconds: 100),
                    child: SlideAnimation(
                      curve: Curves.fastLinearToSlowEaseIn,
                      horizontalOffset: 30,
                      verticalOffset: 300,
                      duration: const Duration(milliseconds: 2000),
                      child: FlipAnimation(
                        duration: const Duration(milliseconds: 2000),
                        curve: Curves.fastLinearToSlowEaseIn,
                        flipAxis: FlipAxis.y,
                        child: Card(
                          child: ListTile(
                            title: Text(
                              value.inputDatas[index] + ' =',
                              style: TextStyle(
                                  fontSize: 23, color: Colors.grey[500]),
                            ),
                            subtitle: Text(
                              value.resultDatas[index],
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey[400],
                              ),
                            ),
                            trailing: IconButton(
                              onPressed: () {
                                setState(
                                  () {
                                    value.inputDatas.removeAt(index);
                                    value.resultDatas.removeAt(index);
                                  },
                                );
                              },
                              icon: const Icon(Icons.close),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
