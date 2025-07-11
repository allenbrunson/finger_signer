// scribbler -- finger-scribbling widget
// by allen brunson  august 18 2021

import "package:finger_signer/finger_signer.dart";


/******************************************************************************/
/*                                                                            */
/***  Scribbler class                                                       ***/
/*                                                                            */
/******************************************************************************/

class Scribbler extends StatefulWidget
{
    // final instance variables

    final ScribblerState scribblerState;

    // constructor

    const Scribbler({required this.scribblerState, super.key});

    // public instance methods

    @override State<Scribbler> createState() {
        return _ScribblerState();
    }
}

class _ScribblerState extends State<Scribbler>
{
    // private instance variables

    GlobalKey? _globalKey = null;

    // public instance methods

    @override Widget build(BuildContext context) {
        return orientationWidget(this._body);
    }

    @override void dispose() {
        this._globalKey = null;
        super.dispose();
    }

    @override void initState() {
        super.initState();
        this._globalKey = GlobalKey();
    }

    // private action methods

    Future<void> _actionCancel() async {
        await this._actionFinish(false);
    }

    void _actionClear() {
        this.widget.scribblerState.clear();
        this._stateUpdate();
    }

    Future<void> _actionSave() async {
        await this._actionFinish(true);
    }

    Future<void> _actionFinish(bool saveFile) async {
        dismissModalWidget(this.context, await this._saveFile(saveFile));
    }

    // private state methods

    Offset _offset(Offset global) {
        final data = this._globalKey!.currentContext!.findRenderObject();
        final RenderBox rbox = (data as RenderBox);
        return rbox.globalToLocal(global);
    }

    void _panStart(DragStartDetails details) {
        final offs = this._offset(details.globalPosition);
        this.widget.scribblerState.panStart(offs);
    }

    void _panStop(DragEndDetails details) {
        this.widget.scribblerState.panStop();
        this._stateUpdate();
    }

    void _panUpdate(DragUpdateDetails details) {
        final offs = this._offset(details.globalPosition);
        this.widget.scribblerState.panUpdate(offs);
        this._stateUpdate();
    }

    bool _ready() {
        return this.mounted;
    }

    void _stateUpdate() {
        if (this._ready()) this.setState((){});
    }

    // private image methods

    Future<Image> _image() async {
        final prec = PictureRecorder();
        final canv = Canvas(prec);
        final size = this._globalKey!.currentContext!.size!;
        canv.drawRect(rectFromSize(size), paintFill(Colors.white));
        this.widget.scribblerState.draw(canv, size, Colors.black);
        return pictureRecorderImage(prec, size);
    }

    Future<File?> _imageFile() async {
        final data = await imageToPNG(await this._image());
        return fileWriteBytesAsync(randomPNGpath(), data);
    }

    Future<File?> _saveFile(bool save) async {
        if (save) return this._imageFile();
        return null;
    }

    // private size methods

    double _buttonBarHeight() {
        return 60.0;
    }

    Size _buttonBarSize() {
        final bnds = dialogMaxSize();
        return Size(bnds.width, this._buttonBarHeight());
    }

    Size _scribblerSize() {
        final bnds = dialogMaxSize();
        final size = MutableSize.zero();
        size.width = bnds.width;
        size.height = min(size.width * 0.666, bnds.height);
        size.height -= (this._buttonBarHeight() + 4.0);
        return sizeFloor(size.size());
    }

    // private widget creators

    Widget _body() {
        return this._column();
    }

    Widget _buttonBar() {
        final colr = Theme.of(this.context).colorScheme.surface;
        final view = OverflowBar(children:this._buttonBarChildren());
        final sbox = SizedBox.fromSize(child:view, size:this._buttonBarSize());
        return backgroundColorWidget(sbox, colr);
    }

    List<Widget> _buttonBarChildren() {
        final list = <Widget>[];
        list.add(button("Clear", this._actionClear));
        list.add(button("Cancel", this._actionCancel));
        list.add(button("Save", this._actionSave));
        return list;
    }

    Widget _column() {
        return Column(children:this._columnChildren(),
         mainAxisAlignment:MainAxisAlignment.center,
         mainAxisSize:MainAxisSize.min);
    }

    List<Widget> _columnChildren() {
        final list = <Widget>[];
        list.add(this._scribbler());
        list.add(this._buttonBar());
        return list;
    }

    Widget _gesture(Widget child) {
        return GestureDetector(child:child, excludeFromSemantics:true,
         onPanEnd:this._panStop, onPanStart:this._panStart,
         onPanUpdate:this._panUpdate);
    }

    Widget _painter() {
        final data = this._scribblePainter();
        final view = CustomPaint(painter:data, size:this._scribblerSize());
        return RepaintBoundary(child:ClipRect(child:view), key:this._globalKey);
    }

    ScribblePainter _scribblePainter() {
        final colr = Theme.of(this.context).colorScheme.error;
        final data = this.widget.scribblerState;
        return ScribblePainter(scribblerState:data, strokeColor:colr);
    }

    Widget _scribbler() {
        const colr = Colors.white;
        final view = this._gesture(this._painter());
        return backgroundColorWidget(view, colr);
    }
}


/******************************************************************************/
/*                                                                            */
/***  Scribbler support functions                                           ***/
/*                                                                            */
/******************************************************************************/

Future<File?> showBadScribbler(BuildContext? context) async {
    final view = Scribbler(scribblerState:PointState());
    return showAlertWidget<File?>(context, view);
}

Future<File?> showGoodScribbler(BuildContext? context) async {
    final view = Scribbler(scribblerState:PathState());
    return showAlertWidget<File?>(context, view);
}

Future<void> showImageFile(BuildContext context, File? imageFile) async {
    if (await fileHasLengthAsync(imageFile)) {
        final view = imageFileDialog(context, "Scribble Image", imageFile);
        await showAlertWidget(context, view);
    }
    await deleteFileAsync(imageFile);
}


/******************************************************************************/
/*                                                                            */
/***  Scribbler class                                                       ***/
/*                                                                            */
/******************************************************************************

overview
--------

this is a fairly passable implementation of a flutter finger-signing widget. it
performs all the basic tasks that you would expect.

this class is written in such a way that it can be used to demonstrate two
different ways to implement the widget's saved state: a list of Offset objects,
versus a Path object. this adds some unneeded complexity that you would not want
to copy into a production app.

if you choose to use this widget in your own code, you should rip out the
Scribbler state member variable and replace it with a Path object.

*/
