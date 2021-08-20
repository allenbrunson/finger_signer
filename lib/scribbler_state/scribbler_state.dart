// scribbler_state.dart -- scribbler state abstract base class
// by allen brunson  august 18 2021

import "package:finger_signer/finger_signer.dart";


/******************************************************************************/
/*                                                                            */
/***  ScribblerState class                                                  ***/
/*                                                                            */
/******************************************************************************/

abstract class ScribblerState
{
    void clear();
    void draw(Canvas canvas, Size size, Color color);
    void panStart(Offset offset);
    void panUpdate(Offset offset);
}


/******************************************************************************/
/*                                                                            */
/***  ScribblerState class                                                  ***/
/*                                                                            */
/******************************************************************************

overview
--------

this class establishes the interface that all state objects must provide. the
whole purpose of this demo app is to pit one implementation of this api against
a different one.

*/
