import 'package:flutter/material.dart';

showAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        title: Text(
          "My title",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22.0,
          ),
        ),
        content: Container(
          height: 150.0,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      "This is my message.",
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                children: [
                  Expanded(
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color: Colors.red,
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Expanded(
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color: Colors.blue,
                      child: Text(
                        "Ok",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}

// import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';

// class FilterAlert extends StatefulWidget {
//   @override
//   _FilterAlertState createState() => _FilterAlertState();
// }

// class _FilterAlertState extends State<FilterAlert> {
//   String _selectedCountry = 'USA';
//   String _selectedStatus = 'available';
//   int _selectedCategory = 1;
//   String _selectedRentalTerm = 'monthly';
//   String _selectedBuildingType = 'apartment';
//   String _selectedDirection = 'east';
//   int _selectedRooms = 3;
//   int _selectedToilets = 2;
//   int _selectedMinPrice = 1;
//   int _selectedMaxPrice = 10000;

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: Text('Filter'),
//       content: Container(
//         width: double.maxFinite,
//         child: SingleChildScrollView(
//           child: Column(
//             children: <Widget>[
//               // Country
//               Container(
//                 margin: EdgeInsets.only(bottom: 10),
//                 child: DropdownButton<String>(
//                   value: _selectedCountry,
//                   onChanged: (newValue) {
//                     setState(() {
//                       _selectedCountry = newValue!;
//                     });
//                   },
//                   items: <String>['USA', 'UK', 'Japan', 'China']
//                       .map<DropdownMenuItem<String>>((String value) {
//                     return DropdownMenuItem<String>(
//                       value: value,
//                       child: Text(value),
//                     );
//                   }).toList(),
//                 ),
//               ),
//               // Status
//               Container(
//                 margin: EdgeInsets.only(bottom: 10),
//                 child: DropdownButton<String>(
//                   value: _selectedStatus,
//                   onChanged: (newValue) {
//                     setState(() {
//                       _selectedStatus = newValue!;
//                     });
//                   },
//                   items: <String>['available', 'unavailable']
//                       .map<DropdownMenuItem<String>>((String value) {
//                     return DropdownMenuItem<String>(
//                       value: value,
//                       child: Text(value),
//                     );
//                   }).toList(),
//                 ),
//               ),
//               // Category
//               Container(
//                 margin: EdgeInsets.only(bottom: 10),
//                 child: DropdownButton<int>(
//                   value: _selectedCategory,
//                   onChanged: (newValue) {
//                     setState(
//                       () {
//                         _selectedCategory = newValue!;
//                       },
//                     );
//                   },
//                   items: <int>[1, 2, 3, 4, 5].map<DropdownMenuItem<int>>(
//                     (int value) {
//                       return DropdownMenuItem<int>(
//                         value: value,
//                         child: Text(value.toString()),
//                       );
//                     },
//                   ).toList(),
//                 ),
//               ),
//               // Rental Term
//               Container(
//                 margin: EdgeInsets.only(bottom: 10),
//                 child: DropdownButton<String>(
//                   value: _selectedRentalTerm,
//                   onChanged: (newValue) {
//                     setState(
//                       () {
//                         _selectedRentalTerm = newValue!;
//                       },
//                     );
//                   },
//                   items: <String>['monthly', 'annually']
//                       .map<DropdownMenuItem<String>>(
//                     (String value) {
//                       return DropdownMenuItem<String>(
//                         value: value,
//                         child: Text(value),
//                       );
//                     },
//                   ).toList(),
//                 ),
//               ),
// // Building Type
//               Container(
//                 margin: EdgeInsets.only(bottom: 10),
//                 child: DropdownButton<String>(
//                   value: _selectedBuildingType,
//                   onChanged: (newValue) {
//                     setState(
//                       () {
//                         _selectedBuildingType = newValue!;
//                       },
//                     );
//                   },
//                   items: <String>['apartment', 'house', 'villa']
//                       .map<DropdownMenuItem<String>>(
//                     (String value) {
//                       return DropdownMenuItem<String>(
//                         value: value,
//                         child: Text(value),
//                       );
//                     },
//                   ).toList(),
//                 ),
//               ),
// // Property Direction
//               Container(
//                 margin: EdgeInsets.only(bottom: 10),
//                 child: DropdownButton<String>(
//                   value: _selectedDirection,
//                   onChanged: (newValue) {
//                     setState(
//                       () {
//                         _selectedDirection = newValue!;
//                       },
//                     );
//                   },
//                   items: <String>['east', 'west', 'north', 'south']
//                       .map<DropdownMenuItem<String>>(
//                     (String value) {
//                       return DropdownMenuItem<String>(
//                         value: value,
//                         child: Text(value),
//                       );
//                     },
//                   ).toList(),
//                 ),
//               ),
// // Number of Rooms
//               Container(
//                 margin: EdgeInsets.only(bottom: 10),
//                 child: DropdownButton<int>(
//                   value: _selectedRooms,
//                   onChanged: (newValue) {
//                     setState(
//                       () {
//                         _selectedRooms = newValue!;
//                       },
//                     );
//                   },
//                   items: <int>[1, 2, 3, 4, 5].map<DropdownMenuItem<int>>(
//                     (int value) {
//                       return DropdownMenuItem<int>(
//                         value: value,
//                         child: Text(value.toString()),
//                       );
//                     },
//                   ).toList(),
//                 ),
//               ),
// // Number of Toilets
//               Container(
//                 margin: EdgeInsets.only(bottom: 10),
//                 child: DropdownButton<int>(
//                   value: _selectedToilets,
//                   onChanged: (newValue) {
//                     setState(
//                       () {
//                         _selectedToilets = newValue!;
//                       },
//                     );
//                   },
//                   items: <int>[1, 2, 3, 4, 5].map<DropdownMenuItem<int>>(
//                     (int value) {
//                       return DropdownMenuItem<int>(
//                         value: value,
//                         child: Text(value.toString()),
//                       );
//                     },
//                   ).toList(),
//                 ),
//               ),
// // Price Range
//               Container(
//                 margin: EdgeInsets.only(bottom: 10),
//                 child: Row(
//                   children: <Widget>[
//                     Container(
//                       width: 100,
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
