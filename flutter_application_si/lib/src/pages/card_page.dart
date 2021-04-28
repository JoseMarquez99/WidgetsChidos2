import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Card Page'),
        ),
        body: _lista());
  }

  Widget _cardt1() {
    return Card(
      margin: EdgeInsets.only(top: 10),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(
              Icons.gamepad,
              color: Colors.cyanAccent,
              size: 34,
            ),
            title: Text(
              'Spetsnaz',
              style: TextStyle(fontSize: 20),
            ),
            subtitle: Text(
              'José Ángel Márquez Rodríguez\nAndrés Martínez Sierra',
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
          ),
          Row(
            children: <Widget>[
              FlatButton(
                child: Text('Aceptar'),
                onPressed: () {},
              ),
              FlatButton(
                child: Text('Cancelar'),
                onPressed: () {},
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _cardt2(String direccion) {
    final card = Container(
        child: Column(children: <Widget>[
      FadeInImage(
        image: NetworkImage(direccion),
        placeholder: AssetImage('assets/jar-loading.gif'),
        fadeInDuration: Duration(milliseconds: 500),
        height: 300.0,
        fit: BoxFit.cover,
      ),
      Container(
        padding: EdgeInsets.all(10.0),
        child: Text('Auto chido'),
      )
    ]));

    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: card,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                spreadRadius: 5,
                offset: Offset(2.0, 10.0))
          ],
          color: Colors.white),
    );
  }

  Widget _cardt3() {
    return Card(
      color: Colors.green,
      child: Column(
        children: <Widget>[
          ListTile(
              leading: Icon(
                Icons.car_rental,
                color: Colors.white,
                size: 30,
              ),
              title: Text(
                'Rentar Vehículo',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontFamily: 'sans-serif-medium',
                ),
              )),
        ],
      ),
    );
  }

  Widget _lista() {
    //FutureBuilder
    return FutureBuilder(
      future: _getList(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        //print('builder');
        print(snapshot.data);
        return ListView(
          children: _listaCards(snapshot.data, context),
        );
      },
    );
  }

  Future<List> _getList() {
    return Future.value([
      'https://www.eluniversal.com.mx/sites/default/files/koenigsegg-regera-aero-package.jpg',
      'https://www.bugatti.com/fileadmin/_processed_/sei/p79/se-image-87ab1d01e71ba5723834d218715a8f72.webp',
      'https://www.bugatti.com/fileadmin/_processed_/sei/p80/se-image-b515b2d9e6eb46f3788659178381cbcb.webp'
    ]);
  }

  List<Widget> _listaCards(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];

    for (int i = 0; i < data.length; i++) {
      opciones
        ..add(_cardt1())
        ..add(_cardt2(data[i]))
        ..add(_cardt3())
        ..add(Divider());
    }
    return opciones;
  }
}
