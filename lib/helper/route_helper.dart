
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/provider/app_provider.dart';
import 'package:project/style.dart';
import 'package:provider/provider.dart';

class RouteHelper {
  RouteHelper._();
  static RouteHelper routeHelper = RouteHelper._();


  showCustomalert(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(
                "هل أنت متأكد من الخروج  ؟",
                style: categorieslist,
              ),
              actions: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: primaryColor),
                    onPressed: () {
                      Provider.of<AppProvider>(context, listen: false).logout();
                    },
                    child: Text('نعم',style: GoogleFonts.cairo(fontSize: 13 , fontWeight: FontWeight.bold),)),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(primary: primaryColor),
                    child: Text('لا',style: GoogleFonts.cairo(fontSize: 13 , fontWeight: FontWeight.bold),))
              ],
            ));
  }

  showCustomDialougloading(
    BuildContext context,
    String title,
  ) {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text(
              title,
              style: dialogTitle,
            ),
            actions: <Widget>[
              CupertinoDialogAction(
                  isDefaultAction: true,
                  child: CupertinoActivityIndicator(
                    color: primaryColor,
                  )),
            ],
          );
        });
  }

  showCustomDialougError(BuildContext context, String title) {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text(
              title,
              style: dialogTitle,
            ),
            actions: <Widget>[
              CupertinoDialogAction(
                isDefaultAction: true,
                child: Text(
                  "نعم",
                  style: categorieslist,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                  // Provider.of<AuthProvider>(context , listen:  false).logout();
                },
              ),
            ],
          );
        });
  }
  

  showCustomDialougError2(BuildContext context, String title) {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text(
              title,
              style: dialogTitle,
            ),
            actions: <Widget>[
              CupertinoDialogAction(
                isDefaultAction: true,
                child: Text(
                  "نعم",
                  style: categorieslist,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  // Provider.of<AuthProvider>(context , listen:  false).logout();
                },
              ),
            ],
          );
        });
  }

  showCustomDialoug2(BuildContext context, String title,{Function funn}) {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text(
              title,
              style: dialogTitle,
            ),
            actions: <Widget>[
              CupertinoDialogAction(
                isDefaultAction: true,
                child: Text(
                  "نعم",
                  style: categorieslist,
                ),
                onPressed: () {
                  //Navigator.of(context).pop();
                  funn();
                },
              ),
            ],
          );
        });
  }
  
}
