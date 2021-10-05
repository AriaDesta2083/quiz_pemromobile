import 'package:flutter/material.dart';
import 'package:quiz_aria/models/item.dart';

class CardItem extends StatelessWidget {
  final Items item;
  CardItem(this.item);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(12),
      color: Colors.green[300],
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Image.asset(
              'assets/image/${item.image}',
              width: 150,
              height: 170,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: 170,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(item.nama,
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text('Rp ${item.harga}/Barang',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                Text('${item.quantity}',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                Container(
                  alignment: Alignment.center,
                  width: 100,
                  height: 30,
                  color: Colors.green,
                  child: Text(
                    'Lihat Detail',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
