import 'package:advance_exam_one/app/controller/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashScreen extends StatefulWidget {
  const DashScreen({Key? key}) : super(key: key);

  @override
  State<DashScreen> createState() => _DashScreenState();
}

class _DashScreenState extends State<DashScreen> {
  AppProvider? providerF;
  AppProvider? providerT;

  @override
  Widget build(BuildContext context) {
    providerF = Provider.of<AppProvider>(context, listen: false);
    providerT = Provider.of<AppProvider>(context, listen: true);
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              leading: Center(
                child: Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.black,
                  size: 20,
                ),
              ),
              centerTitle: true,
              title: Container(
                height: 35,
                width: 250,
                child: TextField(
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      hintText: "Search",
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.black38,
                          )),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.black,
                          ))),
                ),
              ),
              actions: [
                Center(
                  child: InkWell(
                    onTap: () {
                      providerF!.getJson();
                    },
                    child: Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(5)),
                        child: Icon(
                          Icons.search,
                          size: 20,
                          color: Colors.black,
                        )),
                  ),
                ),
                SizedBox(width: 10)
              ],
            ),
            body: providerT!.mainList.isEmpty
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, mainAxisExtent: 350),
                    itemBuilder: (context, index) => show(index),
                    itemCount: providerT!.mainList.length,
                  )));
  }

  Widget show(int index) {
    return InkWell(
onTap: () {
  Navigator.pushNamed(context, 'info',arguments: index);
},
      child: Container(
        height: 350,
        width: 150,
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(border: Border.all(color: Colors.black54)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 5),
              Icon(
                Icons.favorite_border,
                color: Colors.black,
              ),
              SizedBox(height: 10),
              Image.network(
                "${providerF!.appModal.data![index].productPhotos![0]}",
                height: 150,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
              Spacer(),
              Text(
                "${providerF!.appModal.data![index].productTitle}",
                style: TextStyle(
                    letterSpacing: 1, color: Colors.black, fontSize: 15),
              ),
              Spacer(),
              Row(
                children: [
                  Text(
                    "\$",
                    style: TextStyle(color: Colors.orange, fontSize: 15),
                  ),
                  SizedBox(width: 3),
                  providerF!.appModal.data![index].typicalPriceRange== null
                      ? Text(
                          "00.00",
                          style: TextStyle(
                              letterSpacing: 1,
                              color: Colors.black,
                              fontSize: 15),
                        )
                      : Text(
                          "${providerF!.appModal.data![index].typicalPriceRange![0]}",
                          style: TextStyle(
                              letterSpacing: 1,
                              color: Colors.black,
                              fontSize: 15),
                        ),
                ],
              ),
              SizedBox(height: 5)
            ],
          ),
        ),
      ),
    );
  }
}
