import 'package:agenda_do_valdemir/modules/horarios/repository/horarios_repository.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class HomeController{

  HomeController(this.date);

  var isLoading = false.obs;
  var horarios = [].obs;
  DateTime date = DateTime.now();

  void getHorarios() async {
    isLoading.value = true;

    HorariosRepository repository = HorariosRepository();
    //print(date);
    horarios.value = await repository.getHorarios(date: date);

    isLoading.value = false;
  }
}