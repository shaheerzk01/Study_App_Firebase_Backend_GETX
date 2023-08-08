import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:easy_separator/easy_separator.dart';

class QuestionScreenHolder extends StatelessWidget {
  const QuestionScreenHolder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var line = Container(
      width: double.infinity,
      height: 12.0,
      color: Theme.of(context).scaffoldBackgroundColor,
    );

    var answer = Container(
      width: double.infinity,
      height: 50.0,
      color: Theme.of(context).scaffoldBackgroundColor,
    );

    return Shimmer.fromColors(
        child: EasySeparatedColumn(
          separatorBuilder: (BuildContext context, int index){ return SizedBox(height: 20.0); },
          children: [
            EasySeparatedColumn(
              separatorBuilder: (BuildContext context, int index){ return SizedBox(height: 10.0); },
              children: [
                line,
                line,
                line,
              ],
            ),
            answer,
            answer,
            answer,
            answer,
          ],
        ),
        baseColor: Colors.white,
        highlightColor: Colors.blueGrey.withOpacity(0.3)
    );
  }
}
