import 'package:final_project_tpm_pizza/ui/page_list_dessert.dart';
import 'package:final_project_tpm_pizza/ui/page_list_pizza.dart';
import 'package:final_project_tpm_pizza/ui/time_converter.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: GridView.count(
            padding: const EdgeInsets.all(25.0),
            crossAxisCount: 2,
            children: <Widget>[
              Card(
                margin: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => PageListPizza())
                    );
                  },
                  splashColor: Colors.orangeAccent,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[ //tidak ada null
                        Icon(Icons.local_pizza_outlined, size: 70, color: Colors.orangeAccent),
                        //Image.network('https://en.wikipedia.org/wiki/Neapolitan_pizza#/media/File:Eq_it-na_pizza-margherita_sep2005_sml.jpg', fit: BoxFit.contain,),
                        Text('Pizza', style: TextStyle(fontSize: 16.0)),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                margin: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => PageListDessert())
                    );
                  },
                  splashColor: Colors.redAccent,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[ //tidak ada null
                        Icon(Icons.cake, size: 70, color: Colors.redAccent),
                        //Image.network('https://en.wikipedia.org/wiki/Neapolitan_pizza#/media/File:Eq_it-na_pizza-margherita_sep2005_sml.jpg', fit: BoxFit.contain,),
                        Text('Dessert', style: TextStyle(fontSize: 16.0)),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                margin: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: (){},
                  splashColor: Colors.green,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[ //tidak ada null
                        Icon(Icons.money, size: 70, color: Colors.green),
                        //Image.network('https://en.wikipedia.org/wiki/Neapolitan_pizza#/media/File:Eq_it-na_pizza-margherita_sep2005_sml.jpg', fit: BoxFit.contain,),
                        Text('Currency Converter', style: TextStyle(fontSize: 16.0)),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                margin: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => TimeConverter())
                    );
                  },
                  splashColor: Colors.blue,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[ //tidak ada null
                        Icon(Icons.access_time_outlined, size: 70, color: Colors.blue),
                        //Image.network('https://en.wikipedia.org/wiki/Neapolitan_pizza#/media/File:Eq_it-na_pizza-margherita_sep2005_sml.jpg', fit: BoxFit.contain,),
                        Text('Time Converter', style: TextStyle(fontSize: 16.0)),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}

