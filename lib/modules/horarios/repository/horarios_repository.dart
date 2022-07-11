import 'package:agenda_do_valdemir/models/horarios.dart';
import 'package:agenda_do_valdemir/models/sucess.dart';
import 'package:dio/dio.dart';

class HorariosRepository{

  Future<List<Horarios>> getHorarios({required DateTime date }) async {
    try
    {
      List<Horarios> horarios = [];
      // arrumar a data passada na api
      var response = await Dio().get('https://roney-lima.outsystemscloud.com/AgendadovaldemirCoreDB/rest/Horarios/PegarHorariosDia?Dia=$date');
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

  Future<Sucess> setHorario({required DateTime date, required int clienteId, required int horarioId }) async {
    try
    {
      Dio dio = Dio();
      //dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers['Dia'] = date;
      dio.options.headers['ClienteId'] = clienteId;
      dio.options.headers['HorarioId'] = horarioId;

      var response = await dio.put('https://roney-lima.outsystemscloud.com/AgendadovaldemirCoreDB/rest/Horarios/SolicitarUmHorario');
      
      return Sucess.fromJson(response.data);
    }catch(e)
    {
      return Sucess(isSucess: false, message: "Erro na comunicação com o servidor!");
    }
  }
}