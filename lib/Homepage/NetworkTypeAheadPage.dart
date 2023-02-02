import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sealed_bidd/Models/categoriesApi.dart';
import 'package:sealed_bidd/plumber/plumber.dart';
import 'package:sealed_bidd/staticData/Static.dart';

import '../Models/database.dart';

TextEditingController textController = TextEditingController();
String newval = textController.value.toString();

String newSetCity = '';

class NetworkTypeAheadPage extends StatelessWidget {
  const NetworkTypeAheadPage({super.key});

  @override
  Widget build(BuildContext context) {
    var dbclass = context.read<Database>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TypeAheadField<Categories?>(
        // hideSuggestionsOnKeyboardHide: true,
        textFieldConfiguration: TextFieldConfiguration(
          autofocus: true,
          controller: textController,
          textInputAction: TextInputAction.go,
          decoration: InputDecoration(
            fillColor: Colors.black,
            focusColor: Colors.black,
            contentPadding: const EdgeInsets.all(5.0),
            hintStyle: GoogleFonts.montserrat(),
            // border: InputBorder.none,
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12))),
            focusedBorder: InputBorder.none,
            hintText: 'Search here ...',
          ),
          // onSubmitted: (value) async {
          //   newval = await value.toString();
          //   dbclass.searchData(value);

          //   if (newval.isNotEmpty) {
          //     String user = newval;
          //     MyClass.userName = newval.toString();

          //     print('User :' + user.toString());

          //     await dbclass.getSpecificCategory(context, user);
          //   }
          // },
        ),
        suggestionsCallback: CategoriesApi.getUserSuggestions,
        itemBuilder: (context, Categories? suggestion) {
          final user = suggestion!;

          return ListTile(
            title: Text(user.name),
          );
        },
        noItemsFoundBuilder: (context) => const SizedBox(
          height: 50,
          child: Center(
            child: Text(
              'No Category Found.',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
        onSuggestionSelected: (Categories? suggestion) {
          final categories = suggestion!;
          MyClass.userName = categories.name.toString();

          //Shared Preference for recent search
          dbclass.setrecentSearch(categories.name);
          //check search category
          dbclass.getSpecificCategory(context, categories.name);
          // curl = user.name.toString();

          // if (curl.isEmpty) {
          //   // curl = "?city=" + getCity().toString();
          //   print(curl);
          //   Navigator.of(context).push(
          //     MaterialPageRoute(
          //       builder: (BuildContext context) => detailpage(curl: curl),
          //     ),
          //   );
          // }
          // if (curl.isNotEmpty) {
          //   print(curl);
          //   Navigator.of(context).push(
          //     MaterialPageRoute(
          //       builder: (BuildContext context) => detailpage(curl: curl),
          //     ),
          //   );
          // }

          ScaffoldMessenger.of(context)
            ..removeCurrentSnackBar()
            ..showSnackBar(SnackBar(
              content: Text('Selected Category: ${categories.name}'),
            ));
        },
      ),
    );
  }
}
