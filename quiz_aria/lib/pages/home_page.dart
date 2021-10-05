import 'package:flutter/material.dart';
import 'package:quiz_aria/models/item.dart';
import 'package:quiz_aria/widgets/card_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _listItem = [
    Items(
        id: 1,
        nama: 'Mouse Gaming',
        harga: 500000,
        quantity: 2,
        deks: 'dnsasdnak asdjnaskdja jsadnaksjdn asdjasdkhaksd asdasda',
        image: 'razer1.png'),
    Items(
        id: 2,
        nama: 'Keyboard Gaming',
        harga: 800000,
        quantity: 1,
        deks: 'dnsasdnak asdjnaskdja jsadnaksjdn asdjasdkhaksd sdasads',
        image: 'razer2.png'),
    Items(
        id: 3,
        nama: 'Headset Gaming',
        harga: 200000,
        quantity: 3,
        deks: 'dnsasdnak asdjnaskdja jsadnaksjdn asdjasdkhaksd saasf',
        image: 'razer3.png'),
  ];
  @override
  Widget build(BuildContext context) {
    int total = 0;
    for (var i = 0; i < _listItem.length; i++) {
      total += _listItem[i].harga * _listItem[i].quantity;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Keranjang Belanja',
        ),
        backgroundColor: Colors.green,
      ),
      bottomNavigationBar: Container(
        height: 70,
        color: Colors.green,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('TOTAL',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            Text('RP $total',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      body: ListView(
          children: _listItem
              .map((item) => InkWell(
                    onTap: () async {
                      var result = await Navigator.of(context)
                          .pushNamed('/detail', arguments: {
                        'item': item,
                      });

                      _handleNavResult(result, item);
                    },
                    child: CardItem(Items(
                        id: item.id,
                        nama: item.nama,
                        harga: item.harga,
                        quantity: item.quantity,
                        deks: item.deks,
                        image: item.image)),
                  ))
              .toList()),
    );
  }

  void _handleNavResult(Object? result, Items item) {
    if (result != null) {
      var resultMap = result as Map<String, Object>;
      if (resultMap.containsKey('quantity')) {
        var quantity = resultMap['quantity'];
        if (quantity is int) {
          int _quantity = quantity;
          var index = _listItem.indexOf(item);
          if (index >= 0) {
            setState(() {
              _listItem[index] = Items(
                  id: item.id,
                  nama: item.nama,
                  harga: item.harga,
                  quantity: _quantity,
                  deks: item.deks,
                  image: item.image);
            });
          }
        }
      }
    }
  }
}
