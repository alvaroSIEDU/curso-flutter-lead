import 'package:flutter/material.dart';

import 'calculadora_controller.dart';

void main() => runApp(Calculadora());

class Calculadora extends StatelessWidget {
  final calculadoraController = CalculadoraController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                children: <Widget>[
                  Numeros(calculadoraController.onPrimeiroNumeroEscolhido),
                  Divider(),
                  Operacoes(calculadoraController.onOperacaoEscolhida),
                  Divider(),
                  Numeros(calculadoraController.onSegundoNumeroEscolhido),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      // BotaoCalcular(
                      //     calculadoraController.todasOpcoesForamEscolhidas
                      //         ? calculadoraController.onClickBotao
                      //         : null),
                      BotaoZerar(calculadoraController.onClickBotaoZerar)
                    ],
                  ),
                  Divider(),
                  Row(
                    children: <Widget>[
                      Text(
                        'Operação: ',
                        style: TextStyle(fontSize: 28),
                      ),
                      calculadoraController.primeiroNumero != -1
                          ? Text(
                              calculadoraController.primeiroNumero.toString(),
                              style: TextStyle(fontSize: 28),
                            )
                          : SizedBox.shrink(),
                      calculadoraController.operacaoEscolhida != ''
                          ? Text(
                              calculadoraController.operacaoEscolhida,
                              style: TextStyle(fontSize: 28),
                            )
                          : SizedBox.shrink(),
                      calculadoraController.segundoNumero != -1
                          ? Text(
                              calculadoraController.segundoNumero.toString(),
                              style: TextStyle(fontSize: 28),
                            )
                          : SizedBox.shrink(),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        'Resultado: ',
                        style: TextStyle(fontSize: 28),
                      ),
                      calculadoraController.resultado != -1
                          ? Text(
                              calculadoraController.resultado
                                  .toStringAsFixed(2),
                              style: TextStyle(fontSize: 28),
                            )
                          : SizedBox.shrink(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BotaoZerar extends StatelessWidget {
  BotaoZerar(this.onClickBotao);

  final VoidCallback onClickBotao;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.blue,
      onPressed: onClickBotao,
      child: Text(
        'Zerar',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }
}

class BotaoCalcular extends StatelessWidget {
  BotaoCalcular(this.onClickBotao);

  final VoidCallback onClickBotao;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.blue,
      onPressed: onClickBotao,
      child: Text(
        'Calcular',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }
}

class Operacoes extends StatelessWidget {
  Operacoes(this.onOperacaoEscolhida);

  final Function(String) onOperacaoEscolhida;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        GestureDetector(
          onTap: () => onOperacaoEscolhida('+'),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Text(
                '+',
                style: TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () => onOperacaoEscolhida('-'),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Text(
                '-',
                style: TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () => onOperacaoEscolhida('*'),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Text(
                '*',
                style: TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () => onOperacaoEscolhida('/'),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Text(
                '/',
                style: TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () => onOperacaoEscolhida('%'),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Text(
                '%',
                style: TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Numeros extends StatelessWidget {
  Numeros(this.onNumeroEscolhido);

  final Function(int) onNumeroEscolhido;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: getNumeros(),
    );
  }

  List<Widget> getNumeros() {
    List<Widget> numeros = [];

    for (int i = 0; i < 10; i++) {
      numeros.add(
        GestureDetector(
          onTap: () => onNumeroEscolhido(i),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Text(
                i.toString(),
                style: TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      );
    }
    return numeros;
  }
}
