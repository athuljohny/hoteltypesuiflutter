import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'bookingbar.dart';
import 'search.dart';
import 'popularhotels.dart';
import 'hotelpackage.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.purple,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Explore'),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.user), label: 'Explore'),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10, top: 10),
        child: CustomScrollView(
          slivers: [
            Appbarbooking(),
            SliverList(
                delegate: SliverChildListDelegate(
              [
                const SizedBox(
                  height: 20,
                ),
                SearchBar(),
                const SizedBox(
                  height: 20,
                ),
                const Text('Popular Hotels', style: TextStyle(fontSize: 15)),
                const SizedBox(
                  height: 5,
                ),
                const PopularHotels(),
                const SizedBox(
                  height: 20,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Hotel Packages', style: TextStyle(fontSize: 15)),
                      Text(
                        'View more',
                        style: TextStyle(fontSize: 7),
                      ),
                    ]),
                const SizedBox(
                  height: 10,
                ),
                const HotelPackage(),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
