import 'package:app_store/core/model/api_manger/getAllProdect.dart';
import 'package:app_store/core/services/all_product_services.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.routeName,
      routes: {HomePage.routeName: (context) => HomePage()},
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          actions: [
            IconButton(onPressed: () {}, icon: Icon(FontAwesomeIcons.cartPlus))
          ],
          title: Center(
              child: Text(
            'New Trend',
            style: TextStyle(
                color: Colors.black, fontSize: 22, fontWeight: FontWeight.w500),
          )),
          backgroundColor: Colors.white,
        ),
        body: CustomCardGridView());
  }
}

class CustomCardItem extends StatelessWidget {
  CustomCardItem({required this.products, super.key});

  GetAllProdect products;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                blurRadius: 40,
                color: Colors.grey.withOpacity(0.1),
                blurStyle: BlurStyle.outer,
                // blurStyle: BlurStyle.solid,
                offset: Offset(10, 10),
                spreadRadius: 10)
          ]),
          // height: 130,
          // width: 220,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
              // vertical: 16
            ),
            child: Card(
              // shadowColor: Colors.lightGreen,
              elevation: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    products.title!.substring(0, 6),
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        r'$' '${products.price.toString()}',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.w500),
                      ),
                      Icon(
                        Icons.favorite,
                        color: Colors.red,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
            right: 40,
            bottom: 85,
            child: Image.network(
              products.image!,
              height: 100,
              width: 100,
            ))
      ],
    );
  }
}

class CustomCardGridView extends StatelessWidget {
  const CustomCardGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(right: 10, left: 10, top: 65),
        child: FutureBuilder<List<GetAllProdect>>(
          future: AllProductServices.getProduct(),
          builder: (contex, snapshot) {
            if (snapshot.hasData) {
              List<GetAllProdect> products = snapshot.data!;
              return GridView.builder(
                itemCount: products.length,
                clipBehavior: Clip.none,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 50,
                    crossAxisSpacing: 10,
                    childAspectRatio: 1.3),
                itemBuilder: (context, index) {
                  return CustomCardItem(
                    products: products[index],
                  );
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}
