import 'dart:io';

void main() {
  int andarAtual = 1;
  bool continuar = true;

  void exibirMenu() {
    print('\n--- Menu ---');
    print('1 - Subir para um andar superior');
    print('2 - Descer para um andar inferior');
    print('3 - Verificar andar atual');
    print('4 - Sair');
    print('Escolha uma opção: ');
  }

  void moverElevador(int destino) {
    if (destino > andarAtual) {
      for (int i = andarAtual; i <= destino; i++) {
        print('Subindo... Andar $i');
      }
      andarAtual = destino;
      print('Elevador chegou ao andar $andarAtual.');
    } else if (destino < andarAtual) {

      for (int i = andarAtual; i >= destino; i--) {
        print('Descendo... Andar $i');
      }
      andarAtual = destino;
      print('Elevador chegou ao andar $andarAtual.');
    } else {
      print('O elevador já está no andar $andarAtual.');
    }
  }

  while (continuar) {
    exibirMenu();
    String? opcao = stdin.readLineSync();

    switch (opcao) {
      case '1':
        print('Digite o andar para o qual deseja subir (entre 1 e 10):');
        int? andarDestino = int.tryParse(stdin.readLineSync()!);
        if (andarDestino != null && andarDestino > andarAtual && andarDestino <= 10) {
          moverElevador(andarDestino);
        } else {
          print('Opção inválida. Lembre-se que o elevador só pode subir até o andar 10.');
        }
        break;
      case '2':
        print('Digite o andar para o qual deseja descer (entre 1 e o andar atual):');
        int? andarDestino = int.tryParse(stdin.readLineSync()!);
        if (andarDestino != null && andarDestino < andarAtual && andarDestino >= 1) {
          moverElevador(andarDestino);
        } else {
          print('Opção inválida. Lembre-se que o elevador só pode descer até o andar 1.');
        }
        break;
      case '3':
        print('O elevador está no andar $andarAtual.');
        break;
      case '4':
        continuar = false;
        print('Saindo do simulador...');
        break;
      default:
        print('Opção inválida. Tente novamente.');
    }
  }
}
