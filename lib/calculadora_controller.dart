import 'package:mobx/mobx.dart';
part 'calculadora_controller.g.dart';

class CalculadoraController = CalculadoraControllerBase
    with _$CalculadoraController;

abstract class CalculadoraControllerBase with Store {
  @observable
  int primeiroNumero = -1;
  @observable
  int segundoNumero = -1;
  @observable
  String operacaoEscolhida = '';
  @observable
  double resultado = -1;

  @action
  bool todasOpcoesForamEscolhidas() {
    return primeiroNumero != -1 &&
        segundoNumero != -1 &&
        operacaoEscolhida != '';
  }

  @action
  void onClickBotao() {
    if (operacaoEscolhida == '+') {
      resultado = (primeiroNumero + segundoNumero).toDouble();
    } else if (operacaoEscolhida == '-') {
      resultado = (primeiroNumero - segundoNumero).toDouble();
    } else if (operacaoEscolhida == '*') {
      resultado = (primeiroNumero * segundoNumero).toDouble();
    } else if (operacaoEscolhida == '/') {
      resultado = (primeiroNumero / segundoNumero).toDouble();
    } else if (operacaoEscolhida == '%') {
      resultado = (primeiroNumero % segundoNumero).toDouble();
    }
  }

  @action
  void onClickBotaoZerar() {
    primeiroNumero = -1;
    segundoNumero = -1;
    operacaoEscolhida = '';
    resultado = -1;
  }

  @action
  void onPrimeiroNumeroEscolhido(int numero) {
    primeiroNumero = numero;
  }

  @action
  void onSegundoNumeroEscolhido(int numero) {
    segundoNumero = numero;
  }

  @action
  void onOperacaoEscolhida(String operacao) {
    operacaoEscolhida = operacao;
  }
}
