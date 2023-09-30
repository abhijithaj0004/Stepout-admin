import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stepoutadminapp/constants/constant.dart';
import 'package:stepoutadminapp/constants/constantswdget/constant_container.dart';
import 'package:stepoutadminapp/pages/accounts_page.dart';
import 'package:stepoutadminapp/pages/add_brands_page.dart';
import 'package:stepoutadminapp/pages/productpage/add_products.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});
  late Stream<QuerySnapshot> brandName;
  final firestore = FirebaseFirestore.instance.collection('brand_list');

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    brandName = firestore.snapshots();
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AccountPage(),
                        ));
                  },
                  icon: const Icon(
                    Icons.person,
                    color: Colors.black,
                  ))
            ],
            leading: const StepOutImg(),
            title: Text(
              'Dashboard',
              style: GoogleFonts.itim(
                  textStyle: TextStyle(color: Colors.black, fontSize: 25)),
            )),
        body: StreamBuilder<QuerySnapshot>(
          stream: brandName,
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return Text('something went wrong');
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Text('loading');
            } else {
              QuerySnapshot querySnapshot = snapshot.data;
              List<QueryDocumentSnapshot> document = querySnapshot.docs;
              List<Map> items = document
                  .map((e) => {'name': e['name'], 'image': e['image']})
                  .toList();

              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    Map thisItem = items[index];
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          MainContainer(
                            height: size.width * 0.2,
                            child: Image.network(
                              thisItem['image'],
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          kWidth20,
                          Text(
                            thisItem['name'],
                            style: GoogleFonts.itim(
                                textStyle: TextStyle(fontSize: 30)),
                          ),
                        ],
                      ),
                    );
                  },
                ),
               
              );
            }
          },
        ),
      
        floatingActionButton: SpeedDial(
          animatedIcon: AnimatedIcons.menu_close,
          children: [
            SpeedDialChild(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AddProductsPage(),
                  ));
                },
                child: Icon(Icons.trolley),
                label: 'Add Products'),
            SpeedDialChild(
                onTap: () {
                  
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AddBrandPage(),
                  ));
                },
                child: Icon(Icons.branding_watermark_outlined),
                label: 'Add Brand')
          ],
        ));
  }
}
