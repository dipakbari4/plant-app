import 'package:plant/model/all_plants.dart';

void main() async {
  fetchAllPlants().then((value) => print(value.allPlants));
}
