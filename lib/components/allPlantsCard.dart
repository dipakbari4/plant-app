import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant/components/responsive.dart';

class AllPlantsCard extends StatelessWidget {
  final String plantName;
  final String imageUrl;
  final String cost;
  const AllPlantsCard(
    this.plantName,
    this.imageUrl,
    this.cost, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 1.5 * SizeConfig.widthMultiplier,
      ),
      child: Card(
        child: Container(
          height: 25 * SizeConfig.heightMultiplier,
          width: 40 * SizeConfig.widthMultiplier,
          child: Stack(
            children: [
              Center(
                child: Container(
                  height: 15 * SizeConfig.heightMultiplier,
                  width: 20 * SizeConfig.widthMultiplier,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.greenAccent,
                  ),
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      this.plantName,
                      style: GoogleFonts.lexendDeca(
                        fontWeight: FontWeight.w700,
                        fontSize: 3 * SizeConfig.textMultiplier,
                      ),
                    ),
                    Image.asset(
                      this.imageUrl,
                      height: 30 * SizeConfig.imageSizeMultiplier,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.0,
                          ),
                          child: Text(
                            '\$' + this.cost,
                            style: GoogleFonts.lexendDeca(
                              fontSize: 2 * SizeConfig.textMultiplier,
                            ),
                          ),
                        ),
                        IconButton(
                          padding: EdgeInsets.all(0),
                          icon: Icon(
                            Icons.shopping_cart_outlined,
                            color: Colors.black,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
