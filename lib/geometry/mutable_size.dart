// mutable_size.dart -- MutableSize object
// by allen brunson  november 22 2018

import "package:finger_signer/finger_signer.dart";


/******************************************************************************/
/*                                                                            */
/***  MutableSize class                                                     ***/
/*                                                                            */
/******************************************************************************/

class MutableSize
{
    // instance variables

    double width;
    double height;

    // constructor

    MutableSize(this.width, this.height);

    // static constructors

    static MutableSize fromSize(Size size) {
        return MutableSize(size.width, size.height);
    }

    static MutableSize zero() {
        return fromSize(Size.zero);
    }

    // instance methods

    void removeInsets(EdgeInsets edge) {
        this.width = max(0.0, this.width - (edge.left + edge.right));
        this.height = max(0.0, this.height - (edge.top + edge.bottom));
    }

    Size size() {
        return Size(this.width, this.height);
    }
}


/******************************************************************************/
/*                                                                            */
/***  MutableSize helper functions                                          ***/
/*                                                                            */
/******************************************************************************/

MutableSize mutableSize(Size size) {
    return MutableSize.fromSize(size);
}


/******************************************************************************/
/*                                                                            */
/***  MutableSize class                                                     ***/
/*                                                                            */
/******************************************************************************

overview
--------

when you need to do complicated math to determine the final size of something,
the fact that Size is immutable is a giant pain in the ass. hello, MutableSize.

*/
