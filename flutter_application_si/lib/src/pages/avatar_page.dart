import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Avatar Page'),
          actions: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 10),
              child: CircleAvatar(
                child: Text('Spetsnaz'),
                backgroundColor: Colors.red,
              ),
            ),
            Container(
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://acroadtrip.blob.core.windows.net/catalogo-imagenes/l/RT_V_6213c932dec740f39d8d5b522fc74eae.jpg'),
              ),
            )
          ],
        ),
        body: Center(
          child: FadeInImage(
            image: NetworkImage(
                'https://acroadtrip.blob.core.windows.net/catalogo-imagenes/l/RT_V_6213c932dec740f39d8d5b522fc74eae.jpg'),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ));
  }
}
