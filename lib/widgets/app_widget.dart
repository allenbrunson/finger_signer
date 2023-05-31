// app_widget.dart -- main app widget
// by allen brunson  august 17 2021

import "package:finger_signer/finger_signer.dart";


/******************************************************************************/
/*                                                                            */
/***  AppWidget class                                                       ***/
/*                                                                            */
/******************************************************************************/

class AppWidget extends StatelessWidget
{
    // constructor

    const AppWidget({super.key});

    // public instance methods

    @override Widget build(BuildContext context) {
        return this._materialApp();
    }

    // private instance methods

    MaterialApp _materialApp() {
        final text = appTitle();
        final view = HomeWidget(title:text);
        return MaterialApp(debugShowCheckedModeBanner:false, home:view,
         theme:this._themeData(), title:text);
    }

    ThemeData _themeData() {
        return ThemeData(primarySwatch:Colors.blue);
    }
}


/******************************************************************************/
/*                                                                            */
/***  AppWidget support functions                                           ***/
/*                                                                            */
/******************************************************************************/

String appTitle() {
    return "Finger-Signing Demo";
}
