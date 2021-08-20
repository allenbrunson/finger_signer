// scribble_painter -- scribble painter object
// by allen brunson  august 18 2021

import "package:finger_signer/finger_signer.dart";


/******************************************************************************/
/*                                                                            */
/***  ScribblePainter class                                                 ***/
/*                                                                            */
/******************************************************************************/

class ScribblePainter extends CustomPainter
{
    // final instance variables

    final ScribblerState scribblerState;
    final Color strokeColor;

    // constructor

    ScribblePainter({required this.scribblerState,
     required this.strokeColor});

    // public instance methods

    @override void paint(Canvas canvas, Size size) {
        this.scribblerState.draw(canvas, size, this.strokeColor);
    }

    @override bool shouldRepaint(ScribblePainter oldDelegate) {
        return true;
    }
}
