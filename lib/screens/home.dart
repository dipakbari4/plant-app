import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant/components/responsive.dart';
import 'package:plant/components/popularPlantCard.dart';
import 'package:plant/components/allPlantsCard.dart';
import 'package:plant/components/searchTextField/plantSearchField.dart';
import 'package:plant/model/plants_class.dart';
import 'package:plant/screens/search.dart';
import 'package:plant/services/auth.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<PopularPlants> futurePlants;
  final GoogleSignInProvider auth = new GoogleSignInProvider();
  @override
  void initState() {
    super.initState();
    futurePlants = fetchPlants();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        leading: InkWell(
          onTap: () {
            print('Menu tapped.');
          },
          splashColor: Colors.transparent,
          hoverColor: Colors.transparent,
          focusColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Image.asset(
            'assets/images/menu.png',
          ),
        ),
        actions: [
          CircleAvatar(
            backgroundImage: provider.getUserImage(),
          ),
          IconButton(
            onPressed: () {
              provider.logout();
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 5 * SizeConfig.widthMultiplier),
            child: RichText(
              text: TextSpan(
                text: 'Ola\n',
                style: GoogleFonts.montserrat(
                  fontSize: 5 * SizeConfig.textMultiplier,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: provider.getCurrentUser(),
                    style: GoogleFonts.lexendDeca(
                        fontSize: 3 * SizeConfig.textMultiplier,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 5 * SizeConfig.widthMultiplier,
              vertical: 3 * SizeConfig.heightMultiplier,
            ),
            child: Text(
              'Popular Plants',
              textAlign: TextAlign.left,
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w700,
                fontSize: 3 * SizeConfig.textMultiplier,
              ),
            ),
          ),
          Container(
            height: 35 * SizeConfig.heightMultiplier,
            child: FutureBuilder<PopularPlants>(
              future: futurePlants,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data.plants.length,
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                      vertical: 3 * SizeConfig.heightMultiplier,
                      horizontal: 3 * SizeConfig.widthMultiplier,
                    ),
                    itemBuilder: (BuildContext context, int index) =>
                        PopularCard(
                      snapshot.data.plants[index].name,
                      snapshot.data.plants[index].image,
                      snapshot.data.plants[index].cost,
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return Center(
                  child: Container(
                    height: 50,
                    width: 50,
                    child: CircularProgressIndicator(),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 5 * SizeConfig.widthMultiplier,
            ),
            child: GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchPlants(),
                ),
              ),
              child: AbsorbPointer(
                child: PlantSearchTextField(),
              ),
            ),
          ),
          // AllPlantsCard('Plant Name', 'assets/plants/peace_lily.png', '50'),
          
        ],
      ),
    );
  }
}
