import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters-screen';
  final Function setFilter;

  FiltersScreen(this.setFilter);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _isVegeterian =
      false; //для switch не нужно обьявлять переменную в Build если нужна возможность переключать
  bool _isGlutenFree = false;
  bool _isVegan = false;
  bool _isLactoseFree = false;

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
            child: Center(
              child: Text('FILTERS'),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
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
            },
            icon: Icon(Icons.filter_alt_outlined),
            label: Text('Confirm?'),
          ),
        ],
      ),
    );
  }
}
