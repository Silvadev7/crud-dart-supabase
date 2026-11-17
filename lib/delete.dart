import 'package:crud_supabase/conexao.dart';
import 'dart:io';

Future<void> delete(id) async{
  final supabase = conexao();

    final veiculo = await supabase

    .from("veiculos")

    .delete()

    .eq("id", id)
    
    .select()
    .single();

    print("veiculo excluido com sucesso");
  }