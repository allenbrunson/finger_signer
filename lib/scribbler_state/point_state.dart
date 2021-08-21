// point_state.dart -- scribbler state that uses a list of points
// by allen brunson  august 18 2021

import "package:finger_signer/finger_signer.dart";


/******************************************************************************/
/*                                                                            */
/***  PointState class                                                      ***/
/*                                                                            */
/******************************************************************************/

class PointState implements ScribblerState
{
    // instance variables

    List<Offset> list = [];

    // constructor

    PointState();

    // ScribblerState methods

    @override void clear() {
        this.list = [];
    }

    @override void draw(Canvas canvas, Size size, Color color) {
        final data = paintStroke(color);
        for (int indx = 0; indx < (this.list.length - 1); indx++) {
            final pnt1 = this.list.elementAt(indx + 0);
            final pnt2 = this.list.elementAt(indx + 1);
            canvas.drawLine(pnt1, pnt2, data);
        }
    }

    @override void panStart(Offset offset) {
        list.add(offset);
    }

    @override void panStop() {
        // nothing to do
    }

    @override void panUpdate(Offset offset) {
        list.add(offset);
    }
}


/******************************************************************************/
/*                                                                            */
/***  PointState class                                                      ***/
/*                                                                            */
/******************************************************************************

overview
--------

this is a poor implementation of the state needed for the Scribbler widget.

do not use the code in this class for anything serious! its entire reason for
existing is for me to debunk it, and show you a better way. please read the
associated blog entry for more details.

*/
