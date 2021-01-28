import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant/components/responsive.dart';
import 'package:plant/services/auth.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Urban ',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w500,
                        fontSize: 7 * SizeConfig.textMultiplier,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: 'Roots',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w500,
                        fontSize: 7 * SizeConfig.textMultiplier,
                        color: Color(0xff17CEAD),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Image.asset('assets/images/plant.png'),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.heightMultiplier,
                  horizontal: 5 * SizeConfig.widthMultiplier,
                ),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Color(0xff17CEAD),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                primary: Color(0xff17CEAD),
              ),
              onPressed: () {
                final provider =
                    Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.login();
                print('Login Button pressed');
              },
              child: Text(
                'Login with google',
                style: GoogleFonts.lexendDeca(
                  fontWeight: FontWeight.bold,
                  fontSize: 2.5 * SizeConfig.textMultiplier,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
