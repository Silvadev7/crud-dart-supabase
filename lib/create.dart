import 'package:crud_supabase/conexao.dart';

Future<void> create(
  String marca,
  String modelo,
  int ano,
  double valor,
  int quilometragem,
) async {
  final supabase = conexao();
  final veiculo = await supabase
      .from("veiculos")
      .insert({
        'marca': marca,
        'modelo': modelo,
        'ano': ano,
        'valor': valor,
        'quilometragem': quilometragem,
      })
      .select()
      .single();
}
