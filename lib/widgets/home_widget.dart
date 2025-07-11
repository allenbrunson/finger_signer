// home_widget -- first page widget
// by allen brunson  august 17 2021

import "package:finger_signer/finger_signer.dart";


/******************************************************************************/
/*                                                                            */
/***  HomeWidget class                                                      ***/
/*                                                                            */
/******************************************************************************/

class HomeWidget extends StatefulWidget
{
    // final instance variables

    final String title;

    // constructor

    const HomeWidget({required this.title, super.key});

    // public instance methods

    @override State<HomeWidget> createState() {
        return _HomeWidgetState();
    }
}

class _HomeWidgetState extends State<HomeWidget>
{
    // public instance methods

    @override Widget build(BuildContext context) {
        return orientationWidget(this._body);
    }

    // button press functions

    Future<void> _badWidget() async {
        final file = await showBadScribbler(this.context);
        await showImageFile(this.context, file);
    }

    Future<void> _goodWidget() async {
        final file = await showGoodScribbler(this.context);
        await showImageFile(this.context, file);
    }

    // private widget creators

    Widget _body() {
        final text = this.widget.title;
        return simpleScaffold(this.context, text, this._bodyInner());
    }

    Widget _bodyInner() {
        const colr = Colors.grey;
        final view = SafeArea(child:this._surface());
        return backgroundColorWidget(view, colr);
    }

    Widget _buttonColumn() {
        return Column(children:this._buttonList(),
         crossAxisAlignment:CrossAxisAlignment.center,
         mainAxisAlignment:MainAxisAlignment.center,
         mainAxisSize:MainAxisSize.max);
    }

    List<Widget> _buttonList() {
        final list = <Widget>[];
        list.add(button("Bad Scribble Widget", this._badWidget));
        list.add(button("Good Scribble Widget", this._goodWidget));
        return list;
    }

    Widget _surface() {
        return Center(child:this._buttonColumn());
    }
}
