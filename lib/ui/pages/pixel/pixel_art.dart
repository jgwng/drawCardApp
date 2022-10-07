import 'package:flutter/material.dart';

class PixelArt extends StatefulWidget{
  @override
  _PixelArtState createState() => _PixelArtState();
}

class _PixelArtState extends State<PixelArt>{

  GlobalKey gridKey = new GlobalKey();

  List<List<String>> gridState = [
    ["", "", "", "", "", "", "", "", "", ""],
    ["", "", "", "", "", "", "", "", "", ""],
    ["", "", "", "", "", "", "", "", "", ""],
    ["", "", "", "", "", "", "", "", "", ""],
    ["", "", "", "", "", "", "", "", "", ""],
    ["", "", "", "", "", "", "", "", "", ""],
    ["", "", "", "", "", "", "", "", "", ""],
    ["", "", "", "", "", "", "", "", "", ""],
    ["", "", "", "", "", "", "", "", "", ""],
    ["", "", "", "", "", "", "", "", "", ""],
  ];


  Widget _buildBody() {
    int gridStateLength = gridState.length;
    return Column(children: <Widget>[
      AspectRatio(aspectRatio: 1.0,
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: GridView.builder(
          key: gridKey,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: gridStateLength,
            //childAspectRatio: 8.0 / 11.9
          ),
          itemBuilder: _buildGridItems,
          itemCount: gridStateLength * gridStateLength,
        ),
      ),)
    ]);
  }

  Widget _buildGridItems(BuildContext context, int index) {
    int gridStateLength = gridState.length;
    int x, y = 0;
    x = (index / gridStateLength).floor();
    y = (index % gridStateLength);
    GlobalKey gridItemKey = new GlobalKey();

    return GestureDetector(
      onTapDown: (details) {
        RenderBox _box = gridItemKey.currentContext?.findRenderObject() as RenderBox;
        RenderBox _boxGrid = gridKey.currentContext?.findRenderObject() as RenderBox;

        Offset position = _boxGrid.localToGlobal(Offset.zero); //this is global position
        double gridLeft = position.dx;
        double gridTop = position.dy;

        double gridPosition = details.globalPosition.dy - gridTop;

        //Get item position
        int indexX = (gridPosition / _box.size.width).floor().toInt();
        int indexY = ((details.globalPosition.dx - gridLeft) / _box.size.width).floor().toInt();
        if (gridState[indexX][indexY] == "Y") {
          gridState[indexX][indexY] = "";
        } else {
          gridState[indexX][indexY] = "Y";
        }

        setState(() {});
      },
      onVerticalDragUpdate: (details) {
        selectItem(gridItemKey, details);
      },
      onHorizontalDragUpdate: (details) {
        selectItem(gridItemKey, details);
      },
      child: GridTile(
        key: gridItemKey,
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 0.5)),
          child: Center(
            child: _buildGridItem(x, y),
          ),
        ),
      ),
    );
  }

  void selectItem(GlobalKey<State<StatefulWidget>> gridItemKey, var details) {
    var _boxItem = gridItemKey.currentContext!.findRenderObject() as RenderBox;
    var _boxMainGrid = gridKey.currentContext!.findRenderObject() as RenderBox;
    Offset position = _boxMainGrid.localToGlobal(Offset.zero); //this is global position
    double gridLeft = position.dx;
    double gridTop = position.dy;

    double gridPosition = details.globalPosition.dy - gridTop;

    //Get item position
    int rowIndex = (gridPosition / _boxItem.size.width).floor().toInt();
    int colIndex = ((details.globalPosition.dx - gridLeft) / _boxItem.size.width).floor().toInt();
    gridState[rowIndex][colIndex] = "Y";

    setState(() {});
  }

  Widget _buildGridItem(int x, int y) {
    switch (gridState[x][y]) {
      case '':
        return Text('');
      case 'Y':
        return Container(
          color: Colors.green,
        );
      case 'N':
        return Container(
          color: Colors.white,
        );
      default:
        return Text(gridState[x][y].toString());
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pixel Art Test'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            _buildBody(),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  _gridItemTapped(int x, int y) {
    print("x is $x and Y is $y");
  }
  
}