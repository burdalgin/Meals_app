import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters-screen';

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

bool _showVegetarian =
    false; //для switch не нужно обьявлять переменную в Build если нужна возможность переключать

class _FiltersScreenState extends State<FiltersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter meals'),
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: Text('FILTERS'),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: <Widget>[
              Text('Dont show Vegetarian meals'),
              Switch(
                  value: _showVegetarian,
                  onChanged: (value) {
                    setState(() {
                      _showVegetarian = value;
                    });
                  }),
            ],
          ),
          TextButton.icon(
            onPressed: () {
              Navigator.of(context).pop(_showVegetarian);
            },
            icon: Icon(Icons.filter_alt_outlined),
            label: Text('Confirm?'),
          ),
        ],
      ),
    );
  }
}
