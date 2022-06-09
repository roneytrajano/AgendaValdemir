import 'package:agenda_do_valdemir/models/horarios.dart';
import 'package:agenda_do_valdemir/modules/home/repository/home_repository.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class HomeController{
  var isLoading = false.obs;
  var horarios = [].obs;
  DateTime date = DateTime.now();

  void getHorarios() async {
    isLoading.value = true;

    HomeRepository repository = HomeRepository();
    horarios.value = await repository.getHorarios(date: date);

    isLoading.value = false;
  }
}