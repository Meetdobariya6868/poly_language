import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:poly_language/screens/constant.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, // Change the color of the leading icon to white
        ),
        backgroundColor: primaryColor,
        title: Text('Dashboard',style: TextStyle(
          color: Colors.white,
        ),),
      ),
      body: DashboardBody(),
    );
  }
}

class DashboardBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi John Deo',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'You have no new events..',
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(height: 20),

            Container(
              height: 150,
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildTrendingItem('0', 'Upcoming Live Sessions', Icons.video_camera_back_rounded),
                  _buildTrendingItem('2', 'Support Message', Icons.mail_lock_outlined),
                  _buildTrendingItem('1', 'Comment', Icons.comment_outlined),
                  // Add more items as needed
                ],
              ),
            ),
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: primaryColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '\$100',
                              style: TextStyle(fontSize: 18, color: Colors.white),
                            ),
                            Text(
                              'Account Balance',
                              style: TextStyle(fontSize: 14, color: Colors.white),
                            ),
                          ],
                        ),
                        Icon(Icons.account_balance_wallet, color: Colors.white),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: primaryColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '0',
                              style: TextStyle(fontSize: 18, color: Colors.white),
                            ),
                            Text(
                              'Reward point',
                              style: TextStyle(fontSize: 14, color: Colors.white),
                            ),
                          ],
                        ),
                        Icon(Icons.card_giftcard_outlined, color: Colors.white),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Learning Statistics',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          Container(
            height: 200,
            width: double.infinity,
            color: Colors.grey[200],
            padding: EdgeInsets.all(16),
            child: LineChart(
              LineChartData(
                lineBarsData: [
                  LineChartBarData(
                    spots: [
                      FlSpot(0, 3),
                      FlSpot(1, 4),
                      FlSpot(2, 3.5),
                      FlSpot(3, 5),
                      FlSpot(4, 4.5),
                      FlSpot(5, 6),
                      FlSpot(6, 5.5),
                      FlSpot(7, 7),
                      FlSpot(8, 6.5),
                      FlSpot(9, 8),
                      FlSpot(10, 7.5),
                      FlSpot(11, 9),
                    ],
                    isCurved: true,
                    colors: [primaryColor],
                    barWidth: 2,
                    isStrokeCapRound: true,
                    belowBarData: BarAreaData(show: false),
                  ),
                ],
                titlesData: FlTitlesData(
                  bottomTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 22,
                    getTextStyles: (value) => TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                  ),
                    getTitles: (value) {
                      switch (value.toInt()) {
                        case 0:
                          return 'Jan';
                        case 2:
                          return 'Mar';
                        case 5:
                          return 'Jun';
                        case 8:
                          return 'Sep';
                        case 11:
                          return 'Dec';
                      }
                      return '';
                    },
                    margin: 8,
                  ),
                  leftTitles: SideTitles(
                    showTitles: true,
                    getTextStyles: (value) => TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                    getTitles: (value) {
                      switch (value.toInt()) {
                        case 2:
                          return '2k';
                        case 5:
                          return '5k';
                        case 8:
                          return '8k';
                      }
                      return '';
                    },
                    margin: 8,
                  ),
                ),
                borderData: FlBorderData(
                  show: true,
                  border: Border.all(color: Colors.transparent),
                  // borderGradientFrom: Offset.zero,
                  // borderGradientTo: Offset.zero,
                ),
                minX: 0,
                maxX: 11,
                minY: 0,
                maxY: 10,
                // lineBarsData: [],
              ),
            ),
          ),
            SizedBox(height: 20),
            Text(
              'Notice',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Container(
              height: 80, // Adjust the height as needed
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    NoticeItem(icon: Icons.warning, text: 'Notice 1'),
                    NoticeItem(icon: Icons.warning, text: 'Notice 2'),
                    NoticeItem(icon: Icons.warning, text: 'Notice 3'),
                  ],
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
  Widget _buildTrendingItem(String title, String subtitle, IconData icon) {
    return Container(
      width: 150, // Adjust width as needed
      margin: EdgeInsets.only(right: 10), // Add spacing between items
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.green.withOpacity(0.1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            // width: double.infinity,
            height: 50,
            alignment: Alignment.center,
            child: Icon(icon, size: 40), // Use the passed icon here
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


}

class DashboardItem extends StatelessWidget {
  final IconData icon;
  final int count;
  final String subtext;

  const DashboardItem({
    required this.icon,
    required this.count,
    required this.subtext,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 3 - 30,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.blue,
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.white),
          SizedBox(height: 10),
          Text(
            count.toString(),
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          Text(
            subtext,
            style: TextStyle(fontSize: 14, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class NoticeItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const NoticeItem({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        SizedBox(width: 5),
        Text(text),
        SizedBox(width: 10),
      ],
    );
  }
}

// void main() {
//   runApp(MaterialApp(
//     home: DashboardScreen(),
//   ));
// }
