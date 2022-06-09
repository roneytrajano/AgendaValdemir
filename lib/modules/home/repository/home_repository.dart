import 'package:agenda_do_valdemir/models/horarios.dart';
import 'package:dio/dio.dart';

class HomeRepository{
  Future<List<Horarios>> getHorarios({required DateTime date }) async {
    try
    {
      List<Horarios> horarios = [];
      // arrumar a data passada na api
      var response = await Dio().get('https://roney-lima.outsystemscloud.com/AgendadovaldemirCoreDB/rest/Horarios/PegarHorariosDia?Dia=2022-03-30');
      print(response.data);

      if(response.data.toString() == "[]"){
        return horarios;
      }

      response.data.forEach((element){
        horarios.add(Horarios.fromJson(element));
      });

      return horarios;
    }catch(e)
    {
      return [];
    }
  }
}