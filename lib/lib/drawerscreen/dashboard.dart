import 'package:flutter/material.dart';
import 'package:swish/lib/constants.dart';
import 'package:swish/lib/theme.dart';
import 'package:swish/lib/widgetssajas/bordercard.dart';
import 'package:swish/lib/widgetssajas/countbutton.dart';

class DashboardCard extends StatelessWidget {
  DashboardCard(
      {Key key,
      this.date,
      this.imgPath,
      this.title,
      this.countTotal,
      this.color})
      : super(key: key);
  final String imgPath;
  final String title;
  final String countTotal;
  final String date;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return BorderedBoxCard(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: defaultPadding * 3,
                  width: defaultPadding * 3,
                  child: CountButton(
                    imgPath: imgPath,
                    color: color.withOpacity(0.5),
                    press: () {},
                  ),
                ),
                Text(
                  title,
                  style: subHead1.copyWith(
                    color: bluish,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Text(
              countTotal,
              style: h2,
              textAlign: TextAlign.right,
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Row(
              children: [
                Icon(Icons.date_range),
                SizedBox(
                  width: defaultPadding / 2,
                ),
                Text(
                  date,
                  style: h4,
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
