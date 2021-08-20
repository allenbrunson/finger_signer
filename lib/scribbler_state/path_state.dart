// path_state.dart -- scribbler state that uses a Path object
// by allen brunson  august 18 2021

import "package:finger_signer/finger_signer.dart";


/******************************************************************************/
/*                                                                            */
/***  PathState class                                                       ***/
/*                                                                            */
/******************************************************************************/

class PathState implements ScribblerState
{
    // instance variables

    final path = Path();

    // constructor

    PathState();

    // ScribblerState methods

    @override void clear() {
        this.path.reset();
    }

    @override void draw(Canvas canvas, Size size, Color color) {
        canvas.drawPath(this.path, paintStroke(color));
    }

    @override void panStart(Offset offset) {
        this.path.moveTo(offset.dx, offset.dy);
    }

    @override void panUpdate(Offset offset) {
        this.path.lineTo(offset.dx, offset.dy);
    }
}


/******************************************************************************/
/*                                                                            */
/***  PathState class                                                       ***/
/*                                                                            */
/******************************************************************************

overview
--------

this is what i consider to be the proper way to implement state for the
Scribbler widget: simply delegate the task to a Path object, which already
does everything you need, and more. notice how all the api implementation
methods are nice clean one-liners.

*/
