import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  TextEditingController _controllerConsumoAlcool = TextEditingController();
  TextEditingController _controllerConsumoGasolina = TextEditingController();
  String _textoResultado = "";

  void _calcular() {
    double? precoAlcool = double.tryParse(_controllerAlcool.text);
    double? precoGasolina = double.tryParse(_controllerGasolina.text);
    double? consumoAlcool = double.tryParse(_controllerConsumoAlcool.text);
    double? consumoGasolina = double.tryParse(_controllerConsumoGasolina.text);

    if (precoAlcool == null || precoGasolina == null ||
        consumoAlcool == null || consumoGasolina == null) {
      setState(() {
        _textoResultado = "Número inválido, digite números maiores que 0 e utilizando (.) ";
      });
      return;
    }

    double custoPorKmAlcool = precoAlcool / consumoAlcool;
    double custoPorKmGasolina = precoGasolina / consumoGasolina;

    if (custoPorKmAlcool < custoPorKmGasolina) {
      setState(() {
        _textoResultado = "Melhor abastecer com álcool";
      });
    } else if (custoPorKmAlcool > custoPorKmGasolina) {
      setState(() {
        _textoResultado = "Melhor abastecer com gasolina";
      });
    } else {
      setState(() {
        _textoResultado = "Pode escolher qualquer opção";
      });
    }
  }

  void _limparCampos() {
    _controllerGasolina.text = "";
    _controllerAlcool.text = "";
    _controllerConsumoGasolina.text = "";
    _controllerConsumoAlcool.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Álcool ou Gasolina"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 32),
                child: Image.asset("imagens/logo.png"),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  "Saiba qual a melhor opção para abastecimento do seu carro",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Preço Álcool, ex: 1.59"
                      ),
                      style: TextStyle(fontSize: 22),
                      controller: _controllerAlcool,
                    ),
                  ),
                  SizedBox(width: 10), // Espaçamento entre os campos
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Preço Gasolina, ex: 3.59"
                      ),
                      style: TextStyle(fontSize: 22),
                      controller: _controllerGasolina,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10), // Espaçamento entre os campos de preço e consumo
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Consumo Álcool, ex: 10.0 km/L"
                      ),
                      style: TextStyle(fontSize: 22),
                      controller: _controllerConsumoAlcool,
                    ),
                  ),
                  SizedBox(width: 10), // Espaçamento entre os campos
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Consumo Gasolina, ex: 15.0 km/L"
                      ),
                      style: TextStyle(fontSize: 22),
                      controller: _controllerConsumoGasolina,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10), // Espaçamento abaixo dos campos de consumo
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                  padding: EdgeInsets.all(15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: _calcular,
                child: Text(
                  "Calcular",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(height: 20), // Espaçamento abaixo do botão de calcular
              Text(
                _textoResultado,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
