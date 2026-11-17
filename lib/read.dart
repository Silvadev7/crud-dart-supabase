import 'package:crud_supabase/conexao.dart';

Future<void> read() async {
  final supabase = conexao();

  final veiculos = await supabase
      .from("veiculos")

      .select("id, marca, modelo, ano, valor, quilometragem")
   
      .order('id');

  if (veiculos.isEmpty) {
    print("Nenhum veiculo cadastrado");
    return;
  }

  for (final veiculo in veiculos) {
    print("ID: ${veiculo['id']}");
    print("MARCA: ${veiculo['marca']}");
    print("MODELO: ${veiculo['modelo']}");
    print("ANO: ${veiculo['ano']}");
    print("VALOR: ${veiculo['valor']}");
    print("QUILOMETRAGEM: ${veiculo['quilometragem']}");
    print('');
  }
}
