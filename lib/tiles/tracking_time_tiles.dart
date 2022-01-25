import 'package:alayniah/config.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TrackingTimeTiles extends StatelessWidget {
  final double lineX;
  final String title;
  final DateTime subTitle;
  final double heightContainer;
  TrackingTimeTiles(
      {this.lineX, this.title, this.subTitle, this.heightContainer});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightContainer,
      child: TimelineTile(
        lineXY: lineX,
        indicatorStyle: IndicatorStyle(height: 2, color: Color_splash3),
        alignment: TimelineAlign.manual,
        // isFirst: true,
        endChild: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: AnimationLimiter(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: AnimationConfiguration.toStaggeredList(
                    duration: const Duration(milliseconds: 375),
                    childAnimationBuilder: (widget) => SlideAnimation(
                      horizontalOffset: 50.0,
                      child: FadeInAnimation(
                        child: widget,
                      ),
                    ),
                    children: [
                      new Text(
                        title,
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.watch_later_outlined,
                            size: 20,
                            color: Color_splash3,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: new Text(
                              formatDate(subTitle, [
                                yy,
                                '-',
                                M,
                                '-',
                                d,
                                '  ,  ',
                                HH,
                                ':',
                                nn,
                                ' ',
                                am
                              ]).toString(),
                              style: TextStyle(
                                  color: Colors.grey[400],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ))),
        ),
      ),
    );
  }
}
