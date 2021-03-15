import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multilevel_drawer/multilevel_drawer.dart';
import 'package:postapp/AdminPage.dart';
import 'package:postapp/ConsultarMora.dart';
import 'package:postapp/MemberPage.dart';
import 'package:postapp/NewPage.dart';
import 'package:postapp/PdfPage.dart';
import 'package:postapp/authentication/bloc/authentication_bloc.dart';
import 'package:postapp/main.dart';
import 'package:postapp/util/token_check.dart';

class MenuLateral extends StatefulWidget {
  @override
  _MenuLateralState createState() => _MenuLateralState();
}

class _MenuLateralState extends State<MenuLateral> {
  List<String> texts = [
    'Indicadores 1',
    'indicadores 2',
    'Consultar Mora',
    'Cerrar Sesion',
  ];

  List<String> texts1 =[
    'Submenu 1',
    'Submenu 2',
  ];

  List<bool> isHighlighted = [true, false, false, false];

  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: Column(
        children: [
          Container(
            child: UserAccountsDrawerHeader(
              accountName: Text("EJEMPLO MENU"),
              accountEmail: Text("info@newcapital.cl"),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUcZMeU0qVeUGBZEa__Q635wOgm9AG-NDfjg&usqp=CAU"),
                    fit: BoxFit.cover),
                color: Colors.white,
              ),
            ),
          ),
         Column(
           children: [
             ListTile(title: Text("Indicadores 1"), onTap: (){
               Navigator.push(
                 context,
                 MaterialPageRoute(
                     builder: (BuildContext context) =>
                         AdminPage()),
               );
             },),
             ExpansionTile(title: Text("Indicadores 2"),
             children: [
               ListTile(title: Text("Submenu 1"), onTap: (){
                 Navigator.push(
                   context,
                   MaterialPageRoute(
                       builder: (BuildContext context) => NewPage()),
                 );
               },),
               ListTile(title: Text("Submenu 2"),),
             ],),
             ListTile(title: Text("Consultar Mora"), onTap: (){
               Navigator.push(
                 context,
                 MaterialPageRoute(
                     builder: (BuildContext context) =>
                         consultarMora()),
               );
             },),
             ListTile(title: Text("Cerrar Sesion"), onTap: (){
               BlocProvider.of<AuthenticationBloc>(context)
                   .add(PushLoginPage());
             },),
           ],
         ),
         /* Container(
            height: MediaQuery.of(context).size.height / 3,
            child: ListView.builder(
              /* children: <Widget>[
               /* new UserAccountsDrawerHeader(
                  accountName: Text("EJEMPLO MENU", style: TextStyle(color: Colors.black),),
                  accountEmail: Text("info@newcapital.cl", style: TextStyle(color: Colors.black),),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUcZMeU0qVeUGBZEa__Q635wOgm9AG-NDfjg&usqp=CAU"),
                        fit: BoxFit.cover),
                  ),
                ),*/
                Ink(
                  color: Colors.yellow[600],
                  child: new ListTile(
                    title: Text(
                      "Indicadores 1",
                      style: TextStyle(color: Colors.black),
                    ),
                    onTap: () {
                      tokensito(token: token, context: context, home: true);
                    },
                  ),
                ),
                new ListTile(
                  title: Text("Indicadores 2"),
                  onTap: () {
                    tokensito(token: token, context: context);
                  },
                ),
                new ListTile(
                  title: Text("Consultar Mora"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => consultarMora()),
                    );
                  },
                ),
                new ListTile(
                  title: Text("Cerrar Sesion"),
                  onTap: () {
                    BlocProvider.of<AuthenticationBloc>(context).add(PushLoginPage());
                  },
                ),
              ],*/
              itemCount: texts.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    for (int i = 0; i < isHighlighted.length; i++) {
                      setState(() {
                        if (index == i) {
                          isHighlighted[index] = true;
                          if (index == 0) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      AdminPage()),
                            );
                          } else if (index == 1) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) => NewPage()),
                            );
                          } else if (index == 2) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      consultarMora()),
                            );
                          } else if (i == 3) {
                            BlocProvider.of<AuthenticationBloc>(context)
                                .add(PushLoginPage());
                          }
                        } else {
                          //the condition to change the highlighted item
                          isHighlighted[i] = false;
                        }
                      });
                    }
                  },
                  child: Container(
                    color: isHighlighted[index]
                        ? Colors.yellow.shade600
                        : Colors.white,

                    child: ListTile(
                      title: Text(texts[index]),
                      /*children: [
                        ListTile( title: Text("Submenu 1"), onTap: (){},),
                        ListTile( title: Text("Submenu 2"), onTap: (){},),
                      ],*/
                    ),
                  ),
                );
              },
            ),
          ),*/
        ],
      ),
    );
  }
}
/*
class MenuLateral1 extends StatelessWidget {

  List<String> texts = ['Indicadores 1', 'indicadores 2', 'Consultar Mora', 'Cerrar Sesion'];

  List<bool> isHighlighted = [true, false, false];

  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
             /* children: <Widget>[
               /* new UserAccountsDrawerHeader(
                  accountName: Text("EJEMPLO MENU", style: TextStyle(color: Colors.black),),
                  accountEmail: Text("info@newcapital.cl", style: TextStyle(color: Colors.black),),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUcZMeU0qVeUGBZEa__Q635wOgm9AG-NDfjg&usqp=CAU"),
                        fit: BoxFit.cover),
                  ),
                ),*/
                Ink(
                  color: Colors.yellow[600],
                  child: new ListTile(
                    title: Text(
                      "Indicadores 1",
                      style: TextStyle(color: Colors.black),
                    ),
                    onTap: () {
                      tokensito(token: token, context: context, home: true);
                    },
                  ),
                ),
                new ListTile(
                  title: Text("Indicadores 2"),
                  onTap: () {
                    tokensito(token: token, context: context);
                  },
                ),
                new ListTile(
                  title: Text("Consultar Mora"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => consultarMora()),
                    );
                  },
                ),
                new ListTile(
                  title: Text("Cerrar Sesion"),
                  onTap: () {
                    BlocProvider.of<AuthenticationBloc>(context).add(PushLoginPage());
                  },
                ),
              ],*/
              itemCount: texts.length,
              itemBuilder: (_, index){
                return GestureDetector(
                  onTap: (){
                    for(int i = 0; i < isHighlighted.length; i++){
                      setState(() {
                        if (index == i) {
                          isHighlighted[index] = true;
                        } else {                               //the condition to change the highlighted item
                          isHighlighted[i] = false;
                        }
                      });
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
*/
