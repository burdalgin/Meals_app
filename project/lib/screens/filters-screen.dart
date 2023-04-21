import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters-screen';
  final Function setFilter;
  final Map<String, bool> currentFilterStatus;

  FiltersScreen(this.setFilter, this.currentFilterStatus);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _isVegeterian =
      false; //для switch не нужно обьявлять переменную в Build если нужна возможность переключать
  bool _isGlutenFree = false;
  bool _isVegan = false;
  bool _isLactoseFree = false;

  @override
  void
      initState() //перезаписывает инициализированные значения на установленные в  _buildSwitchListTile
  {
    _isGlutenFree = widget.currentFilterStatus['gluten'] as bool;
    _isLactoseFree = widget.currentFilterStatus['lactose'] as bool;
    _isVegan = widget.currentFilterStatus['vegan'] as bool;
    _isVegeterian = widget.currentFilterStatus['vegeterian'] as bool;
    super.initState();
  }

  Widget _buildSwitchListTile(
      String title, bool currentValue, Function(bool) updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter meals'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            // flex: 2,
            height: 250,
            child: ListView(
              children: <Widget>[
                _buildSwitchListTile('Show only vegeterian', _isVegeterian,
                    (newValue) {
                  setState(() {
                    _isVegeterian = newValue;
                  });
                }),
                _buildSwitchListTile(
                    'Show only Gluteen free meals', _isGlutenFree, (newValue) {
                  setState(() {
                    _isGlutenFree = newValue;
                  });
                }),
                _buildSwitchListTile('Show only lactose free', _isLactoseFree,
                    (newValue) {
                  setState(() {
                    _isLactoseFree = newValue;
                  });
                }),
                _buildSwitchListTile('Show only vegan', _isVegan, (newValue) {
                  setState(() {
                    _isVegan = newValue;
                  });
                }),
              ],
            ),
          ),
          TextButton.icon(
            onPressed: () {
              final selectedFilters = {
                'gluten': _isGlutenFree,
                'lactose': _isLactoseFree,
                'vegan': _isVegan,
                'vegeterian': _isVegeterian,
              };

              widget.setFilter(selectedFilters);
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.filter_alt_outlined),
            label: Text('Save filters?'),
          ),
        ],
      ),
    );
  }
}
