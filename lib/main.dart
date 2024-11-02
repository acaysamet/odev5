import 'package:flutter/material.dart';

void main() {
  runApp(BenimUygulamam());
}

class BenimUygulamam extends StatefulWidget {
  @override
  _BenimUygulamamDurum createState() => _BenimUygulamamDurum();
}

class _BenimUygulamamDurum extends State<BenimUygulamam> {
  bool _karanlikTema = false;
  Color _yaziRengi = Colors.purple;

  void _temayiDegistir() {
    setState(() {
      _karanlikTema = !_karanlikTema;
      _yaziRengi = _yaziRengi == Colors.purple ? Colors.orange : Colors.purple;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _karanlikTema ? _karanlikTemaOlustur() : _acikTemaOlustur(),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Tema Değiştirme Uygulaması',
            style: TextStyle(color: _yaziRengi),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Şu anki tema: ${_karanlikTema ? 'Karanlık' : 'Açık'}',
                style: TextStyle(color: _yaziRengi),
              ),
              SizedBox(height: 20),
              _karanlikTema
                  ? ElevatedButton(
                      onPressed: _temayiDegistir,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                      ),
                      child: Text('Karanlık Tema Butonu'),
                    )
                  : OutlinedButton(
                      onPressed: _temayiDegistir,
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.blue, width: 2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: EdgeInsets.all(16),
                      ),
                      child: Text('Açık Tema Butonu'),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  ThemeData _acikTemaOlustur() {
    return ThemeData(
      primarySwatch: Colors.blue,
      brightness: Brightness.light,
    );
  }

  ThemeData _karanlikTemaOlustur() {
    return ThemeData(
      primarySwatch: Colors.red,
      brightness: Brightness.dark,
    );
  }
}
