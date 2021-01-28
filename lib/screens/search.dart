import 'package:flutter/material.dart';
import 'package:plant/components/searchCard.dart';
import 'package:plant/components/responsive.dart';
import 'package:plant/components/searchTextField/plantSearchField.dart';
import 'package:plant/components/searchTextField/textFieldButton.dart';
import 'package:plant/model/all_plants.dart';

class SearchPlants extends StatefulWidget {
  @override
  _SearchPlantsState createState() => _SearchPlantsState();
}

class _SearchPlantsState extends State<SearchPlants> {
  List<AllPlants> _plants = [];
  List<AllPlants> _filteredPlants = [];

  @override
  void initState() {
    fetchAllPlants().then((value) {
      setState(() {
        _filteredPlants = _plants = value.allPlants;
      });
    });
    super.initState();
  }

  // _filteredPlants.length ! = 0;

  // show the list item;
  // SHow all the data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 5 * SizeConfig.heightMultiplier),
                child: ListView.builder(
                    itemCount: _filteredPlants.length,
                    scrollDirection: Axis.vertical,
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                      vertical: 3 * SizeConfig.heightMultiplier,
                      horizontal: 3 * SizeConfig.widthMultiplier,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      // return ListTile(
                      //   title: Text),
                      // );
                      return SearchCard(
                        _filteredPlants[index].image,
                        _filteredPlants[index].name,
                        _filteredPlants[index].cost,
                      );
                    }),
              ),
              PlantSearchTextField(
                onChanged: (String searchQuery) {
                  searchQuery = searchQuery.toLowerCase();
                  setState(() {
                    print(searchQuery);
                    _filteredPlants.clear();

                    _filteredPlants = _plants
                        .where((plant) => plant.name.contains(searchQuery))
                        .toList();
                  });
                },
                suffixIcon: TextFieldButton(
                  onPressed: () => Navigator.pop(context),
                  highlightColor: Colors.blueAccent.withOpacity(.15),
                  child: Icon(
                    Icons.close,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
