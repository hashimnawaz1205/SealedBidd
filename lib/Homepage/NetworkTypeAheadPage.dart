import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sealed_bidd/Models/categoriesApi.dart';

TextEditingController textController = TextEditingController();
String newval = textController.value.toString();

String newSetCity = '';

class NetworkTypeAheadPage extends StatelessWidget {
  const NetworkTypeAheadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return TypeAheadField<Categories?>(
      hideSuggestionsOnKeyboardHide: false,
      textFieldConfiguration: TextFieldConfiguration(
        controller: textController,
        textInputAction: TextInputAction.go,
        onSubmitted: (value) async {
          newval = await value.toString();
          print('go was hit !');
          print(newval);
          if (newval == '') {
            print('');
            // Navigator.of(context).push(
            //   MaterialPageRoute(
            //     builder: (BuildContext context) => detailpage(curl: curl),
            //   ),
            // );
          }
          if (newval != '') {
            // curl = newval;
            // print(curl);
            // Navigator.of(context).push(
            //   MaterialPageRoute(
            //     builder: (BuildContext context) => detailpage(curl: curl),
            //   ),
            // );
          }
        },
        decoration: InputDecoration(
          hintStyle: GoogleFonts.workSans(),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: 'Search here ...',
        ),
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
    );
  }
}
