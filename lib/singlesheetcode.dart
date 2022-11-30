import 'package:flutter/material.dart';
import 'dummydata.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Appbarbooking(),
  ));
}

class Appbarbooking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.purple,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Explore'),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.user), label: 'Explore'),
          ],
        ),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              centerTitle: false,
              toolbarHeight: 60,
              backgroundColor: Colors.white,
              title: Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 10, bottom: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Hello @Athul',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    Text(
                      'Find your favourite hotel',
                      style: TextStyle(color: Colors.black, fontSize: 17),
                    ),
                  ],
                ),
              ),
              elevation: 0,
              actions: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 15.0, right: 20, bottom: 10, left: 15),
                  child: Container(
                    height: 25,
                    width: 40,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey[400]!,
                            offset: const Offset(0, 4),
                            blurRadius: 2),
                      ],
                      color: Colors.white,
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg"),
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                )
              ],
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              const SizedBox(
                height: 20,
              ),
              Container(
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, right: 20, top: 15),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(2, 7),
                              color: Colors.grey[400]!,
                              blurRadius: 3)
                        ]),
                    child: TextField(
                      decoration: InputDecoration(
                        isDense: true,
                        prefixIcon: Icon(
                          Icons.search,
                          size: 25,
                          color: Colors.grey[400],
                        ),
                        filled: true,
                        enabled: true,
                        hintText: 'Search for hotel ',
                        hintStyle: const TextStyle(color: Colors.grey),
                        fillColor: Colors.white,
                        disabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              const Text('Popular Hotels',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 5,
              ),
              Container(
                  child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      width: 10,
                    );
                  },
                  scrollDirection: Axis.horizontal,
                  itemCount: hotellist.length,
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    var hotel = hotellist[index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 10, right: 5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black12,
                                offset: Offset(2, 5),
                                blurRadius: 5,
                                spreadRadius: 1)
                          ],
                          borderRadius: BorderRadius.circular(10)),
                      width: MediaQuery.of(context).size.width * 0.44,
                      child: Column(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.13,
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10)),
                                image: DecorationImage(
                                    image: NetworkImage(hotel['image']),
                                    fit: BoxFit.cover)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  hotel['name'],
                                  style: const TextStyle(fontSize: 18),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  hotel['desc'],
                                  style: const TextStyle(
                                      fontSize: 15, color: Colors.grey),
                                  maxLines: 2,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 1),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '\$${hotel['price']} / night',
                                        style: const TextStyle(
                                            fontSize: 15, color: Colors.blue),
                                      ),
                                      Text.rich(TextSpan(
                                          style: const TextStyle(
                                              fontSize: 15, color: Colors.blue),
                                          children: [
                                            TextSpan(
                                                text:
                                                    hotel['rating'].toString()),
                                            const WidgetSpan(
                                                child: Icon(
                                              Icons.star_purple500_outlined,
                                              size: 18,
                                              color: Colors.blue,
                                            ))
                                          ]))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              )),
              const SizedBox(
                height: 20,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Hotel Packages',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    Text(
                      'View more',
                      style: TextStyle(fontSize: 15),
                    ),
                  ]),
              const SizedBox(
                height: 10,
              ),
              Container(
                child: ListView.separated(
                  itemCount: hotellist.length,
                  physics: const NeverScrollableScrollPhysics(),
                  padding:
                      const EdgeInsets.only(left: 15, right: 15, bottom: 20),
                  shrinkWrap: true,
                  itemBuilder: (context, int index) {
                    var data = hotellist[index];
                    return Container(
                        height: MediaQuery.of(context).size.height * 0.15,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(2, 3),
                                  blurRadius: 3,
                                  spreadRadius: 1)
                            ],
                            borderRadius: BorderRadius.circular(10)),
                        child: Stack(
                          children: [
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.15,
                                      width: 120,
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              bottomLeft: Radius.circular(10)),
                                          image: DecorationImage(
                                              image:
                                                  NetworkImage(data['image']),
                                              fit: BoxFit.cover)),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      data['name'],
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      data['desc'],
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: true,
                                      style: const TextStyle(
                                          fontSize: 14, color: Colors.grey),
                                    ),
                                    Text(
                                      '\$${data['price']} / night',
                                      style: const TextStyle(
                                          fontSize: 15, color: Colors.blue),
                                    ),
                                    Wrap(
                                      spacing: 15,
                                      children: const [
                                        Icon(
                                          Icons.directions_car_filled_rounded,
                                          color: Colors.blue,
                                        ),
                                        Icon(
                                          Icons.wine_bar_rounded,
                                          color: Colors.blue,
                                        ),
                                        Icon(
                                          Icons.wifi_rounded,
                                          color: Colors.blue,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    )
                                  ],
                                )
                              ],
                            ),
                            Positioned(
                              right: 0,
                              top: 55,
                              child: Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        bottomLeft: Radius.circular(10))),
                                child: Text(
                                  'Book',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          ],
                        ));
                  },
                  separatorBuilder: (context, int index) {
                    return SizedBox(
                      height: 10,
                    );
                  },
                ),
              ),
            ]))
          ],
        ));
  }
}
