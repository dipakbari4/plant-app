import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant/components/responsive.dart';

class SearchCard extends StatefulWidget {
  final String imageUrl, title, cost;
  const SearchCard(this.imageUrl, this.title, this.cost);
  @override
  _SearchCardState createState() => _SearchCardState();
}

class _SearchCardState extends State<SearchCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 10 * SizeConfig.heightMultiplier,
        width: 90 * SizeConfig.widthMultiplier,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              widget.imageUrl,
              height: 7 * SizeConfig.heightMultiplier,
            ),
            RichText(
              text: TextSpan(
                  text: widget.title + '\n',
                  style: GoogleFonts.lexendDeca(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 2 * SizeConfig.textMultiplier,
                  ),
                  children: [
                    TextSpan(
                      text: '\$' + widget.cost,
                      style: GoogleFonts.lexendDeca(
                        fontWeight: FontWeight.w500,
                        fontSize: 1.5 * SizeConfig.textMultiplier,
                      ),
                    )
                  ]),
            ),
            IconButton(
              icon: Icon(Icons.shopping_cart_outlined),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
