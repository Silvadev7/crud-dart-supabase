import 'package:crud_supabase/conexao.dart';
import 'dart:io';

Future<void> update(
  int id,
  String marca,
  String modelo,
  int ano,
  double valor,
  int quilometragem,
) async{
  
  final supabase = conexao();

  final veiculos = await supabase

  .from("veiculos")


  .update({
    "marca":marca,
    "modelo":modelo,
    "ano": ano,
    "valor":valor,
    "quilometragem":quilometragem
  })


  .eq("id", id)


  .select()
  .single();

  }

