import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class SearchBar extends StatefulWidget {
  final Function onSubmit;
  final String? term;

  const SearchBar({super.key, required this.onSubmit, this.term});
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    String title = "Search...";
    if (widget.term != null && widget.term!.isNotEmpty) {
      title = widget.term!;
    }
    return Container(
      child: Center(
        child: SizedBox(
          width: 250,
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: widget.term == null || widget.term!.isEmpty ? 250 : 200,
                height: 80,
                child: FloatingSearchBar(
                  automaticallyImplyBackButton: false,
                  backgroundColor: Color.fromARGB(255, 75, 75, 75),
                  iconColor: Colors.yellow,
                  body: Container(
                    color: Colors.black,
                    height: 80,
                  ),
                  transition: CircularFloatingSearchBarTransition(),
                  physics: BouncingScrollPhysics(),
                  title: Text(
                    title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  leadingActions: null,
                  hint: 'Search and find out...',
                  actions: [
                    FloatingSearchBarAction.searchToClear(),
                  ],
                  onSubmitted: (query) {
                    widget.onSubmit(query);
                  },
                  builder:
                      (BuildContext context, Animation<double> transition) {
                    return Container();
                  },
                ),
              ),
              widget.term == null || widget.term!.isEmpty
                  ? Container()
                  : Container(
                      padding: EdgeInsets.only(bottom: 10),
                      child: IconButton(
                          onPressed: () {
                            widget.onSubmit('');
                          },
                          icon: Icon(
                            EvaIcons.close,
                            size: 30,
                          )),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
