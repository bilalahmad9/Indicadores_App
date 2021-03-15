import 'package:flutter/material.dart';
import 'package:postapp/AdminPage.dart';

class consultarMora extends StatefulWidget {

  @override
  _consultarMoraState createState() => _consultarMoraState();
}

class _consultarMoraState extends State<consultarMora> {
 // const PrimaryColor = const Color(0xFFfccf03);

  final _text = TextEditingController();
  bool _validate = false;

  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFfccf03),
        title: Text("Consultar Mora", style: TextStyle(fontSize: 25, color: Colors.black),),
        centerTitle: true,
       /* leading: FlatButton(
          child: Icon(Icons.arrow_back, color: Colors.white,),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => AdminPage()));
          },
        ),*/
      ),

      body: Center(
        child: Column(
          children: [
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
              child: _buildTextField(),
            ),
            SizedBox(height: 10),
            RaisedButton(
              child: Text("Consultar", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
              color: Colors.yellow.shade600,
              onPressed: (){
                setState(() {
                  _text.text.isEmpty ? _validate = true : _validate = false;
                });
              },
              elevation: 5.0,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField() {
    //final maxLines = 3;

    return Container(
      padding: EdgeInsets.only(left: 12.0, right: 12.0, top: 12.0),
      //height: maxLines * 24.0,
      child: TextField(
        controller: _text,
        //maxLines: maxLines,

        decoration: InputDecoration(
          hintText: "Introduzca el rut a consultar",
          fillColor: Colors.grey[300],
          errorText: _validate ? 'No puede dejar el cuadro en blanco' : null,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        keyboardType: TextInputType.text,
      ),
    );
  }

}
