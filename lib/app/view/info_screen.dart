import 'package:advance_exam_one/app/controller/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  AppProvider? providerF;
  AppProvider? providerT;

  @override
  Widget build(BuildContext context) {
    // int index = ModalRoute.of(context)!.settings.arguments as int;
    int index=0;
    providerF = Provider.of<AppProvider>(context, listen: false);
    providerT = Provider.of<AppProvider>(context, listen: true);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Product Info",
          style: TextStyle(
              letterSpacing: 1,
              color: Colors.black,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              "${providerF!.appModal.data![index].productPhotos![0]}",
              height: 150,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            Text(
              "${providerF!.appModal.data![index].productTitle}",
              style:
                  TextStyle(letterSpacing: 1, color: Colors.black, fontSize: 15),
            ),
            Row(
              children: [
                Text(
                  "\$",
                  style: TextStyle(color: Colors.orange, fontSize: 15),
                ),
                SizedBox(width: 3),
                providerF!.appModal.data![index].typicalPriceRange == null
                    ? Text(
                        "00.00",
                        style: TextStyle(
                            letterSpacing: 1, color: Colors.black, fontSize: 15),
                      )
                    : Text(
                        "${providerF!.appModal.data![index].typicalPriceRange![0]}",
                        style: TextStyle(
                            letterSpacing: 1, color: Colors.black, fontSize: 15),
                      ),
              ],
            ),
            Row(
              children: [
                ElevatedButton(onPressed: () {
                  showDialog(context: context, builder: (context) {
                    return AlertDialog(
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Product Total Review"),
                          Text("${providerF!.appModal.data![index].productNumReviews}"),
                        ],
                      ),
                      title: Text("Product Review"),
                    );
                  },);
                }, child: Text(
                  'Review'
                )),
                Spacer(),
                ElevatedButton(onPressed: () {
                  showDialog(context: context, builder: (context) {
                    return AlertDialog(
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("${providerF!.appModal.data![index].offer!.storeName}"),
                          Text("${providerF!.appModal.data![index].offer!.storeRating}"),
                          Text("${providerF!.appModal.data![index].offer!.price}"),
                          Text("${providerF!.appModal.data![index].offer!.tax}"),
                          Text("${providerF!.appModal.data![index].offer!.shipping}"),
                        ],
                      ),
                      title: Text("Product Offers"),
                    );
                  },);
                }, child: Text(
                    'Offers'
                ))
              ],

            ),
            SizedBox(height: 10)
          ],
        ),
      ),
    ));
  }
}
