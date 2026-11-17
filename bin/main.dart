import 'package:crud_supabase/conexao.dart';
import 'package:crud_supabase/create.dart';
import 'package:crud_supabase/read.dart';
import 'package:crud_supabase/update.dart';
import 'package:crud_supabase/delete.dart';
import 'dart:io';

Future<void> main() async {
  final supabase = conexao();

  try {
    while (true) {
      print('');
      print("[1] adicionar\n[2]listar\n[3]atualizar\n[4]deletar\n[5]sair");
      int user = int.parse(stdin.readLineSync()!);

      try {
        //Create
        if (user == 1) {
          print("marca: ");
          String marca = stdin.readLineSync()!;

          print("modelo: ");
          String modelo = stdin.readLineSync()!;

          print("ano: ");
          int ano = int.parse(stdin.readLineSync()!);

          print("valor: ");
          double valor = double.parse(stdin.readLineSync()!);

          print("quilometragem: ");
          int quilometragem = int.parse(stdin.readLineSync()!);
          print('');

          try {
            await create(marca, modelo, ano, valor, quilometragem);
            print("veiculo adicionado com sucesso: $modelo");
            print('');
          } catch (e) {
            print(e);
          }
        }

        
        //Read
        else if (user == 2) {
          print('');
          try {
            await read();
          } catch (e) {
            print(e);
          }
        }


        //Update
        else if (user == 3) {
          print("Digite o ID do veiculo que deseja alterar: ");
          int id = int.parse(stdin.readLineSync()!);

          print("Marca: ");
          String marca = stdin.readLineSync()!;

          print("Modelo: ");
          String modelo = stdin.readLineSync()!;

          print("ano: ");
          int ano = int.parse(stdin.readLineSync()!);

          print("valor: ");
          double valor = double.parse(stdin.readLineSync()!);

          print("quilometragem: ");
          int quilometragem = int.parse(stdin.readLineSync()!);

          try {
            await update(id, marca, modelo, ano, valor, quilometragem);
          } catch (e) {
            print("ocorreu um erro: $e");
          }
        }


        //Delete
        else if (user == 4) {
          print("Digite o ID do veiculo a ser excluido: ");
          int id = int.parse(stdin.readLineSync()!);

          try {
            await delete(id);
          } catch (e) {
            print("ocorreu um erro: $e");
          }
        } else if (user == 5) {
          break;
        } else {
          print("opção invalida");
        }
      } catch (e) {
        print("ocorreu um erro: $e");
      }
    }
  } finally {
    await supabase.dispose();
    print("conexão encerrada..");
  }
}
