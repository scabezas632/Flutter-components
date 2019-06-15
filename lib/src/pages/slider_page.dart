import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  SliderPage({Key key}) : super(key: key);

  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _sliderValue = 100.0;
  bool _bloquearCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('Slider'),
       ),
       body: Container(
         padding: EdgeInsets.only(top: 50.0),
         child: Column(
           children: <Widget>[
             _crearSlider(),
             _crearCheckbox(),
             _crearSwitch(),
             Expanded(child: _crearImagen())
           ],
         ),
       ),
    );
  }

  Widget _crearSlider() {

    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamaño de la imagen',
      value: _sliderValue,
      min: 0.0,
      max: 400.0,
      onChanged: (_bloquearCheck) ? null : (value) {   
        setState(() {
         _sliderValue = value; 
        });
      },
    );

  }

  Widget _crearImagen() {

    return Image(
      image: NetworkImage('https://upload.wikimedia.org/wikipedia/en/8/87/Batman_DC_Comics.png'),
      width: _sliderValue,
      fit: BoxFit.contain,
    );

  }

  Widget _crearCheckbox() {

    // return Checkbox(
    //   value: _bloquearCheck,
    //   onChanged: (value) {
    //     setState(() {
    //      _bloquearCheck = value; 
    //     });
    //   },
    // );
    return CheckboxListTile(
      title: Text('Bloquear Slider'),
      value: _bloquearCheck,
      onChanged: (value) {
        setState(() {
         _bloquearCheck = value; 
        });
      },
    );

  }

  _crearSwitch() {

    return SwitchListTile(
      title: Text('Bloquear Slider'),
      value: _bloquearCheck,
      onChanged: (value) {
        setState(() {
         _bloquearCheck = value; 
        });
      },
    );

  }
}