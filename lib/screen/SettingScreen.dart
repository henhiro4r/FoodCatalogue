import 'package:flutter/material.dart';
import 'package:foodcatalogue/navigation/NavigationDrawer.dart';

class SettingScreen extends StatefulWidget {
  static const routeName = '/setting';

  final Function setPref;
  final Map<String, bool> currentFilters;

  SettingScreen(this.currentFilters, this.setPref);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];
    super.initState();
  }

  Widget _switchTile(String title, String description, bool state, Function onClick) {
    return SwitchListTile(
      title: Text(title),
      value: state,
      subtitle: Text(description),
      onChanged: onClick,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedPref = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.setPref(selectedPref);
            },
          ),
        ],
      ),
      drawer: NavigationDrawer(),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                _switchTile(
                  'Gluteen Free',
                  'Only show gluteen free food',
                  _glutenFree,
                      (clicked) {
                    setState(
                          () {
                        _glutenFree = clicked;
                      },
                    );
                  },
                ),
                _switchTile(
                  'Lactose Free',
                  'Only show lactose free food',
                  _lactoseFree,
                      (clicked) {
                    setState(
                          () {
                        _lactoseFree = clicked;
                      },
                    );
                  },
                ),
                _switchTile(
                  'Vegetarian Free',
                  'Only show vegetarian free food',
                  _vegetarian,
                      (clicked) {
                    setState(
                          () {
                        _vegetarian = clicked;
                      },
                    );
                  },
                ),
                _switchTile(
                  'Vegan Free',
                  'Only show vegan free food',
                  _vegan,
                      (clicked) {
                    setState(
                          () {
                        _vegan = clicked;
                      },
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
