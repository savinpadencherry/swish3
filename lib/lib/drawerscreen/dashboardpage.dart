import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swish/Modals/product.dart';
import 'package:swish/lib/constants.dart';
import 'package:swish/lib/controllers/dashboardcont.dart';
import 'package:swish/lib/drawerscreen/dashboard.dart';
import 'package:swish/lib/responsive.dart';
import 'package:swish/lib/theme.dart';
import 'package:swish/lib/widgets/cwidgets.dart';
import 'package:swish/lib/widgetssajas/stadiumBorderOutlined.dart';
import 'package:swish/lib/widgetssajas/stadiumBorderelevated.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({Key key}) : super(key: key);

  final List<DashboardCard> listDashboardCard = [
    DashboardCard(
        date: "Last 24 hours",
        imgPath: "assets/icons/user.png",
        title: "Total Consumer",
        countTotal: "5",
        color: bluish),
    DashboardCard(
        date: "Last 24 hours",
        imgPath: "assets/icons/home.png",
        title: "Total Revenue",
        countTotal: "0",
        color: pinkish),
    DashboardCard(
        date: "Last 24 hours",
        imgPath: "assets/icons/expense.png",
        title: "Total Expenses",
        countTotal: "0",
        color: greenish),
    DashboardCard(
        date: "Last 24 hours",
        imgPath: "assets/icons/credit.png",
        title: "Total Credits",
        countTotal: "0",
        color: Colors.orange)
  ];

  @override
  Widget build(BuildContext context) {
    final DashboardController _dashboardController =
        Get.put(DashboardController());
    return Scaffold(
      backgroundColor: whitish,
      appBar: cWidgets.appBar(title: "Dashboard", press: () => Get.back()),
      body: SafeArea(
        minimum: EdgeInsets.symmetric(
            vertical: defaultPadding / 2, horizontal: defaultPadding),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    child: Column(
                      children: [
                        Text(
                          "From",
                          style: subHead1,
                        ),
                        SizedBox(
                          height: defaultPadding / 2,
                        ),
                        Obx(
                          () => SizedBox(
                            child: StadiumBorderOutlined(
                              textStyle: subHead1,
                              text: _dashboardController.fromDate.value == false
                                  ? "Select Date"
                                  : "${_dashboardController.fromDate.value.day}/${_dashboardController.fromDate.value.month}/${_dashboardController.fromDate.value.year}",
                              press: () =>
                                  _dashboardController.pickDateFrom(context),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    child: Column(
                      children: [
                        Text(
                          "To",
                          style: subHead1,
                        ),
                        SizedBox(
                          height: defaultPadding / 2,
                        ),
                        Obx(
                          () => SizedBox(
                            child: StadiumBorderOutlined(
                              textStyle: subHead1,
                              text: _dashboardController.toDate == false
                                  ? "Select Date"
                                  : "${_dashboardController.toDate.value.day}/${_dashboardController.toDate.value.month}/${_dashboardController.toDate.value.year}",
                              press: () =>
                                  _dashboardController.pickDateTo(context),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: defaultPadding / 2,
            ),
            SizedBox(
              height: defaultPadding * 2,
              child: StadiumBorderElevated(
                text: "Filter",
                style: subHead1,
                btColor: mainYellow,
                press: () {},
              ),
            ),
            SizedBox(
              height: defaultPadding,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 2,
              width: MediaQuery.of(context).size.width,
              child: GridView.builder(
                itemCount: products.length,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: Responsive.isDesktop(context)
                      ? 4
                      : Responsive.isTablet(context) ? 2 : 1,
                  mainAxisSpacing: defaultPadding,
                  crossAxisSpacing: defaultPadding,
                ),
                itemBuilder: (context, index) => DashboardCard(
                  color: listDashboardCard[index].color,
                  imgPath: listDashboardCard[index].imgPath,
                  title: listDashboardCard[index].title,
                  countTotal: listDashboardCard[index].countTotal,
                  date: listDashboardCard[index].date,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
