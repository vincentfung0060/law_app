import 'package:flutter/material.dart';
import 'package:law_app/model/law.dart';
import 'package:law_app/model/state.dart';
import 'package:law_app/state_widget.dart';
import 'package:law_app/ui/widgets/law_image.dart';
import 'package:law_app/ui/widgets/law_title.dart';
import 'package:law_app/utils/store.dart';

class IngredientsView extends StatelessWidget {
  final List<String> ingredients;

  IngredientsView(this.ingredients);

  @override
  Widget build(BuildContext context) {
    List<Widget> children = new List<Widget>();
    ingredients.forEach((item) {
      children.add(
        new Row(
          children: <Widget>[
            new Icon(Icons.done),
            new SizedBox(width: 5.0),
            new Text(item),
          ],
        ),
      );
      // Add spacing between the lines:
      children.add(
        new SizedBox(
          height: 5.0,
        ),
      );
    });
    return ListView(
      padding: EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 75.0),
      children: children,
    );
  }
}
class ContentView extends StatefulWidget {
  final List<String> subTitle;
  final List<String> content;

  ContentView(this.subTitle,this.content);
  @override
  _ContentViewState createState()=>_ContentViewState();
}
class _ContentViewState extends State<ContentView> {
    List<Widget> _content = [];

List<Widget> initDetails()
{
List<Widget> textElements = List<Widget>();
    widget.subTitle.forEach((item) {
      textElements.add(
        GestureDetector(
        onTap: () {
        List<String> tempContentList = new List();
        tempContentList.add(widget.content[widget.subTitle.indexOf(item)]);
          setState((){
          _content = getUpdatedDetails(widget.subTitle.indexOf(item));
        });
  },
  child: Text(
    item,
  style: TextStyle(
    fontFamily: 'Merriweather',
    fontSize: 15.0,
    color: const Color(0xFF807A6B),
    decoration: TextDecoration.underline,
  ),
  ),
),
        
      );
      // Add spacing between the lines:
      textElements.add(
        SizedBox(
          height: 20.0,
        ),
      );
    });
    return textElements;
}

List<Widget> getUpdatedDetails(position)
{
  List<Widget> textElements = List<Widget>();
  //Add the back button
  textElements.add(
        GestureDetector(
        onTap: () {
          setState((){
          _content = initDetails();
        });
  },
  child: Text(
    "back",
    style: Theme.of(context).textTheme.display1,
    ),
),
        
      );
      textElements.add(
        SizedBox(
          height: 20.0,
        ),
      );

  textElements.add(
    Text(
    widget.content[position],
    )
  );
      return textElements;
}

  @override
  void initState() {
    super.initState();
    _content = initDetails();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 75.0),
      children: _content,
    );
  }
}

class DetailScreen extends StatefulWidget {
  final Law law;
  final bool inFavorites;

  DetailScreen(this.law, this.inFavorites);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  ScrollController _scrollController;
  bool _inFavorites;
  StateModel appState;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
    _scrollController = ScrollController();
    _inFavorites = widget.inFavorites;
  }

  @override
  void dispose() {
    // "Unmount" the controllers:
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _toggleInFavorites() {
    setState(() {
      _inFavorites = !_inFavorites;
    });
  }

  @override
  Widget build(BuildContext context) {
    appState = StateWidget.of(context).state;

    return Scaffold(
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (BuildContext context, bool innerViewIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: Colors.white,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                background: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    LawImage(widget.law.imageURL),
                    LawTitle(widget.law, 25.0),
                  ],
                ),
              ),
              expandedHeight: 280.0,
              pinned: true,
              floating: true,
              elevation: 2.0,
              forceElevated: innerViewIsScrolled,
            )
          ];
        },
        body: TabBarView(
          children: <Widget>[
            new ContentView(widget.law.subTitle, widget.law.content),
          ],
          controller: _tabController,
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     updateFavorites(appState.user.uid, widget.law.id).then((result) {
      //       // Toggle "in favorites" if the result was successful.
      //       if (result) _toggleInFavorites();
      //     });
      //   },
      //   child: Icon(
      //     _inFavorites ? Icons.favorite : Icons.favorite_border,
      //     color: Theme.of(context).iconTheme.color,
      //   ),
      //   elevation: 2.0,
      //   backgroundColor: Colors.white,
      // ),
    );
  }
}