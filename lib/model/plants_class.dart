import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<PopularPlants> fetchPlants() async {
  final response = await http.get('https://api.npoint.io/83efe53c741461463f5d');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return PopularPlants.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class PopularPlants {
  List<Plants> plants;

  PopularPlants({this.plants});

  PopularPlants.fromJson(Map<String, dynamic> json) {
    if (json['plants'] != null) {
      plants = new List<Plants>();
      json['plants'].forEach((v) {
        plants.add(new Plants.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.plants != null) {
      data['plants'] = this.plants.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Plants {
  int id;
  String name;
  String image;
  String cost;
  Description description;

  Plants({this.id, this.name, this.image, this.cost, this.description});

  Plants.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    cost = json['cost'];
    description = json['description'] != null
        ? new Description.fromJson(json['description'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['cost'] = this.cost;
    if (this.description != null) {
      data['description'] = this.description.toJson();
    }
    return data;
  }
}

class Description {
  String about;
  Caretips caretips;

  Description({this.about, this.caretips});

  Description.fromJson(Map<String, dynamic> json) {
    about = json['about'];
    caretips = json['caretips'] != null
        ? new Caretips.fromJson(json['caretips'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['about'] = this.about;
    if (this.caretips != null) {
      data['caretips'] = this.caretips.toJson();
    }
    return data;
  }
}

class Caretips {
  String sunLight;
  String water;
  String temperature;
  String poisonous;
  String pests;

  Caretips(
      {this.sunLight,
      this.water,
      this.temperature,
      this.poisonous,
      this.pests});

  Caretips.fromJson(Map<String, dynamic> json) {
    sunLight = json['sun light'];
    water = json['water'];
    temperature = json['temperature'];
    poisonous = json['poisonous'];
    pests = json['pests'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sun light'] = this.sunLight;
    data['water'] = this.water;
    data['temperature'] = this.temperature;
    data['poisonous'] = this.poisonous;
    data['pests'] = this.pests;
    return data;
  }
}
