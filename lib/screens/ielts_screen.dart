import 'package:flutter/material.dart';
import 'package:poly_language/screens/constant.dart';


class IELTSScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        iconTheme: IconThemeData(
          color: Colors.white, // Change the color of the leading icon to white
        ),
        title: Text("IELTS",style: TextStyle(
          color: Colors.white
        ),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Filter"),
                  Text("Sort"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Featured Courses"),
            ),
            FeaturedCourseWidget(),
            SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                ),
                itemCount: 6, // Change this as per your requirement
                itemBuilder: (context, index) {
                  return ProductWidget(
                    productName: "Product ${index + 1}",
                    price: "\$${(index + 1) * 10}",
                    status: "Available",
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FeaturedCourseWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.grey[200],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            "https://via.placeholder.com/150",
            height: 100,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage("https://via.placeholder.com/50"),
                ),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Project Name"),
                    Text("Star Rating"),
                    Text("Time"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProductWidget extends StatelessWidget {
  final String productName;
  final String price;
  final String status;

  const ProductWidget({
    Key? key,
    required this.productName,
    required this.price,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(productName),
            Text(price),
            Text(status),
          ],
        ),
      ),
    );
  }
}
