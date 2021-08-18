import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  //const FilterScreen({Key? key}) : super(key: key);
static const routeName ='/filters';
final Function saveFilters;
final Map<String, bool> currentFilters;
FiltersScreen(this.currentFilters, this.saveFilters);
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree =false;

  @override
  initState(){
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          title: Text('Filters'),
          actions: [
            IconButton(icon:Icon(Icons.save), onPressed:(){
              final selectedFilters = {
               'glutenFree' : _glutenFree,
                'lactoseFree' :_lactoseFree,
                'vegan' : _vegan,
              'vegetarian' : _vegetarian
              };
              widget.saveFilters(selectedFilters);
            }
            ),
          ],
        ),
        drawer: MainDrawer(),
        body:  Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text('Adjust your meal selection',
              style:  Theme.of(context).textTheme.title,),
            ),
            Expanded(
                child: ListView(
                  children: [
                    SwitchListTile(
                        title: Text('Gluten Free'),
                        value:_glutenFree, onChanged:(newValue){
                          setState(() {
                            _glutenFree = newValue;
                          });
                    },
                    subtitle: Text('Only Gluten free meals'),
                    ),
                    SwitchListTile(
                      title: Text('Lactose Free'),
                      value:_lactoseFree, onChanged:(newValue){
                      setState(() {
                        _lactoseFree = newValue;
                      });
                    },
                      subtitle: Text('Only include Lactose free meals'),
                    ),
                    SwitchListTile(
                      title: Text('Vegetarian'),
                      value:_vegetarian, onChanged:(newValue){
                      setState(() {
                        _vegetarian = newValue;
                      });
                    },
                      subtitle: Text('Only include Vegetarian  meals'),
                    ),
                    SwitchListTile(
                      title: Text('Vegan'),
                      value:_vegan, onChanged:(newValue){
                      setState(() {
                        _vegan = newValue;
                      });
                    },
                      subtitle: Text('Only include vegan meals'),
                    ),
                    // _buildSwitchListTile(
                    //     'Vegan', 'Only vegan free meals are included',
                    //     _vegan,
                    //         ( bool newValue){
                    //       setState(() {
                    //         _vegan = newValue;
                    //       });
                    //     }
                    // ),
                  ],
                ),),
          ],
        ),
      );

  }
}
