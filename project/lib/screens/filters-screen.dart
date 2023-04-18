import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters-screen';

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

bool _filterVegeterian =
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
              Text('Show only Vegetarian meals'),
              Switch(
                  value: _filterVegeterian,
                  onChanged: (value) {
                    setState(() {
                      _filterVegeterian = value;
                    });
                  }),
            ],
          ),
          TextButton.icon(
            onPressed: () {
              Navigator.of(context).pop(_filterVegeterian);
            },
            icon: Icon(Icons.filter_alt_outlined),
            label: Text('Confirm?'),
          ),
        ],
      ),
    );
  }
}
