import 'package:flutter/material.dart';
import 'package:poly_language/screens/constant.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Subscription Planning',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: SubscriptionPage(),
//     );
//   }
// }

class SubscriptionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, // Change the color of the leading icon to white
        ),
        backgroundColor: primaryColor,
        title: Text("Subscription",style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                image: DecorationImage(
                  image: AssetImage("assets/images/featured.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Text(
                  "Choose Your Subscription Plan",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  SubscriptionPlanCard(
                    planName: "Basic",
                    price: "\$9.99/month",
                    features: ["Feature 1", "Feature 2", "Feature 3"],
                  ),
                  SubscriptionPlanCard(
                    planName: "Premium",
                    price: "\$19.99/month",
                    features: ["Feature 1", "Feature 2", "Feature 3", "Feature 4"],
                  ),
                  SubscriptionPlanCard(
                    planName: "Ultimate",
                    price: "\$29.99/month",
                    features: ["Feature 1", "Feature 2", "Feature 3", "Feature 4", "Feature 5"],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Activate subscription
              },
              child: Text("Activate Subscription"),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class SubscriptionPlanCard extends StatelessWidget {
  final String planName;
  final String price;
  final List<String> features;

  const SubscriptionPlanCard({
    Key? key,
    required this.planName,
    required this.price,
    required this.features,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              planName,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              price,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: features
                  .map((feature) => Padding(
                padding: EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  children: [
                    Icon(Icons.check_circle, color: Colors.green),
                    SizedBox(width: 5),
                    Text(feature),
                  ],
                ),
              ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
