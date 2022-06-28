import 'package:agenda_do_valdemir/Utils/HexColor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/components/menu.dart';
import 'horarios_controller.dart';

class HorariosScreen extends StatelessWidget {
  const HorariosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    controller.getHorarios();
    return Scaffold(
      appBar: AppBar(
        title: Text('Horários'),
        centerTitle: true,
        leading: BackButton(
            onPressed: () {Get.offAndToNamed('/calendar');}
        ),
      ),
      //drawer: const Menu(),
      body: Container(
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: controller.horarios.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  // Text(controller.horarios.value[index].label.toString()),
                  // Text(controller.horarios.value[index].situacao),
                  // Checkbox(value: controller.horarios.value[index].situacao == 'Confirmado', onChanged: (bool? value) {} ),
                  SizedBox(
                    width: 300,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 150,
                              alignment: Alignment.center,
                              child: Text(
                                controller.horarios.value[index].label.toString(),
                                style: const TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const Text('  '),
                            Container(
                              width: 105,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 3, horizontal: 5),
                              decoration: BoxDecoration(
                                color: HexColor(
                                    controller.horarios.value[index].corSituacao),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                controller.horarios.value[index].situacao,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        }),
      ),
    );
  }
}
