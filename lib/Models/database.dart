import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:image_picker/image_picker.dart';

class Database extends ChangeNotifier {
  // for obscure text  (login page)
  bool ishidenPassword = true;
  void obscureviewPassword() {
    if (ishidenPassword == false) {
      ishidenPassword = true;
      notifyListeners();
    } else {
      ishidenPassword = false;
      notifyListeners();
    }
  }

  //for checkbox (login)
  bool val = false;
  void isChecked() {
    if (val == false) {
      val = true;
      notifyListeners();
    } else {
      val = false;
      notifyListeners();
    }
  }

  //for radiobutton (category name list)

  int selectedRd = 0;
  void setselectedRd(int val) {
    selectedRd = val;
    notifyListeners();
  }

//for rating(filter by)
  int selectedRadio = 0;
  void setselectedRadio(int val) {
    selectedRadio = val;
    notifyListeners();
  }

  //register

  String error = '';

  Future<bool> signUp(String email, String password) async {
    var fireauth = FirebaseAuth.instance;
    try {
      fireauth.createUserWithEmailAndPassword(email: email, password: password);
      // return email.toString();
      return true;
    } on FirebaseAuthException catch (e) {
      error = e.message.toString();
      print(error);
      notifyListeners();
      return false;
      // return e;
    } catch (e) {
      String error = e.toString();
      print('error message' + error);
      notifyListeners();
      return false;
      // return e;
    }
  }

  //for dropdown(booking)
  String? role;
  bool ispending = true;
  List<String> listItem = ["Pending", "Completed"];

  void selectedDropdown(String value) {
    if (value == 'Pending') {
      role = value;
      ispending = true;
      notifyListeners();
    } else {
      role = value;
      ispending = false;
      notifyListeners();
    }
    notifyListeners();
  }

  //for datetime(bookservice1)
  bool isTaped = false;
  String Date = '';

  void selectedDateTime(BuildContext context) {
    isTaped = true;
    DatePicker.showDatePicker(context,
        showTitleActions: true,
        //minTime: DateTime(2018, 3, 5),
        //maxTime: DateTime(2019, 6, 7),
        theme: DatePickerTheme(
            headerColor: Color(0xFF02C908),
            backgroundColor: Colors.white,
            itemStyle: TextStyle(
                color: Color(0xFF02C908),
                fontWeight: FontWeight.bold,
                fontSize: 18),
            doneStyle: TextStyle(color: Colors.white, fontSize: 16)),
        onChanged: (date) {}, onConfirm: (date) {
      Date = date.toString();
      print('confirm $Date');
      notifyListeners();
    }, currentTime: DateTime.now(), locale: LocaleType.en);

    notifyListeners();
  }

  //for appatment cleaning(bookservice2)
  int counter = 0;
  bool isClicked = false;
  bool arrowleft = false;
  bool arrowright = false;
  void add() {
    arrowright = true;
    arrowleft = false;
    counter++;
    notifyListeners();
  }

  void subtract() {
    arrowleft = true;
    arrowright = false;

    if (counter <= 0)
      counter = 0;
    else
      counter--;
    notifyListeners();
  }
//book prevoius button (bookservice2)

  bool bookButton = true;
  bool previousButton = true;
  void Book() {
    bookButton = true;
    previousButton = false;
    notifyListeners();
  }

  void Previous() {
    bookButton = false;
    previousButton = true;
    notifyListeners();
  }

//slider (homepage)
  int activeIndex = 0;

  void indicator(int index) {
    activeIndex = index;
    notifyListeners();
  }

  //slider1 (homepage)
  int activeIndex1 = 0;

  void indicator1(int index) {
    activeIndex1 = index;
    notifyListeners();
  }

  // String initial_city = 'Select City';
  // String initial_city1 = 'Select City';

  // // void setCity(city) async {
  // //   SharedPreferences prefs = await SharedPreferences.getInstance();
  // //   String selectedCity = (prefs.getString('initial_city') ?? 'islamabad');
  // //   selectedCity = city.toString();
  // //   notifyListeners();
  // }

  // String selectedCity = 'Select City';
  // Future<String> SetCityForSearchbar(city) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   //Return String
  //   await prefs.setString('city', city);
  //   // String stringValue = (prefs.getString('initial_city') ?? 'Islamabad');
  //   initial_city = city.toString();
  //   notifyListeners();
  //   return initial_city;
  // }

  //signup image

  File? Profilepicture;

  Future<void> setProfileImage(img) async {
    Profilepicture = img;

    print('Profile picture Updating' + Profilepicture.toString());

    notifyListeners();
  }

  String image = '';
  String filePath = '';

  bool isUpload = false;

  void pickImage() async {
    ImagePicker imagePicker = ImagePicker();
    //XFile? file = await imagePicker.pickImage(source: ImageSource.camera);
    var file = await ImagePicker().pickImage(source: ImageSource.gallery);
    print('${file?.path}');
    filePath = '${file?.path}';
    setProfileImage(File(file!.path));
    if (file == null) return;

    String uniqueNameFile = DateTime.now().microsecondsSinceEpoch.toString();
    //Get  a reference to get a root
    Reference referenceRoot = FirebaseStorage.instance.ref().child('Images');

    //create a reference for the image to be stored
    Reference referenceImageToUpload = referenceRoot.child(uniqueNameFile);

    //handle error
    try {
      //Store the File

      await referenceImageToUpload.putFile(File(filePath));

      //success :get the download url

      image = await referenceImageToUpload.getDownloadURL();

      notifyListeners();
    } catch (error) {
      print(error.toString());
    }
    notifyListeners();
  }
}
