import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sealed_bidd/AutenticationScreens/signup.dart';
import 'package:sealed_bidd/staticData/Static.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../Homepage/bottomnavigationbar.dart';
import '../plumber/plumber.dart';

class Database extends ChangeNotifier {
  Future<void> setKey(email) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setString('email', email);
    print('Your key has been set.');
  }

  Future<void> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('email');
    print('You have been logged out.');
    notifyListeners();
  }

  Future<bool> isLoggedIn() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    if (sharedPreferences.getString('email') != null) {
      notifyListeners();
      return true;
    } else {
      notifyListeners();
      return false;
    }
  }

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

      // once you will add all the name,email etc to local sharedPrefs.
      // add_auth();
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
    // ignore: unnecessary_null_comparison
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

  Future<void> getData() async {
//for categores
    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection('Categories');
    print('yeh chal rha');
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _collectionRef.get();

    // Get data from docs and convert map to List
    MyClass.allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    notifyListeners();
    print(MyClass.allData.length);
  }

  Future<void> getCategory() async {
    //for category
    CollectionReference _collectionRefCat =
        FirebaseFirestore.instance.collection('Category');
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _collectionRefCat.get();

    // Get data from docs and convert map to List
    MyClass.Category = querySnapshot.docs.map((doc) => doc.data()).toList();
    notifyListeners();
    print('Length of Category' + MyClass.Category.length.toString());
  }

  //get specefic category
  List user = [];
  bool isLoading = false;
  Future<void> getSpecificCategory(BuildContext context, String name) async {
    final firestoreInstace = FirebaseFirestore.instance;
    firestoreInstace
        .collection("User")
        .where("Category", isEqualTo: name)
        .get()
        .then((value) => {
              user.clear(),
              value.docs.forEach((element) {
                user.add(element.data());
                if (user.isNotEmpty) {
                  print('List of user :' + user.toString());
                  notifyListeners();
                } else {
                  print('No user Find :');
                  notifyListeners();
                }
              }),
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => new Plumber()),
              ),
            });
  }

  //change password
  String pwdLength = '';
  void checkPassword(String password) {
    if (password.length >= 5) {
      //isEligible = true;
      pwdLength = '';
      notifyListeners();
    } else {
      //isEligible = false;
      pwdLength = 'Please Enter atleast 5 characters';
      notifyListeners();
    }
  }

  //google signin
  //bool isLoading = false;
  Future<void> googleSignIn(BuildContext context) async {
    print('We have reached here inside google signin.');
    final googleSignIn = GoogleSignIn();
    final googleAccount = await googleSignIn.signIn();
    if (googleAccount != null) {
      print('google account is null, show your error');
      final googleAuth = await googleAccount.authentication;
      if (googleAuth.accessToken != null && googleAuth.idToken != null) {
        try {
          await FirebaseAuth.instance.signInWithCredential(
            GoogleAuthProvider.credential(
                idToken: googleAuth.idToken,
                accessToken: googleAuth.accessToken),
          );

          // Navigator.pushReplacement(
          //   context,
          //   new MaterialPageRoute(
          //       builder: (context) => const bottomnavigationbar()),
          // );
          notifyListeners();
        } on FirebaseException catch (error) {
          print('here is amptjer statement');
          AlertDialog(
            title: Text(error.message.toString()),
          );
        } catch (error) {
          AlertDialog(
            title: Text(error.toString()),
          );
        } finally {}
      }
    }
  }

//for phone login check phone number already exist in database or not
  List user1 = [];
  Future<void> getSpecificPhone(BuildContext context, String phone) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref('Users');
    ref.orderByChild('Phone').equalTo(phone).once().then((value) => () {
          user1.clear();
          user1.add(value.snapshot.toString());
          if (user1.isNotEmpty) {
            print('List of user :' + user1.toString());
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (context) => const bottomnavigationbar()),
                (route) => false);

            notifyListeners();
          } else {
            print('No user Find :');

            notifyListeners();
          }
        });

    showDialog(
      context: context,
      builder: ((context) {
        return AlertDialog(
          elevation: 2.0,
          //backgroundColor: Colors.grey,
          title: Text("Error"),
          icon: Icon(
            Icons.error,
            color: const Color(0xFF02C908),
          ),
          content: Text("Your phone number doesnot exist. Please SignUp First"),
          actions: [
            TextButton(
              child: Text("Sign Up"),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SignUp(),
                  ),
                );
              },
            ),
          ],
        );
      }),
    );
    notifyListeners();

    // final firestoreInstace = FirebaseFirestore.instance;
    // firestoreInstace
    //     .collection("User")
    //     .where("Contact", isEqualTo: phone)
    //     .get()
    //     .then((value) => {
    //           user1.clear(),
    //           value.docs.forEach((element) {
    //             user1.add(element.data());
    //             if (user1.isNotEmpty) {
    //               print('List of user :' + user1.toString());
    //               Navigator.pushAndRemoveUntil(
    //                   context,
    //                   MaterialPageRoute(
    //                       builder: (context) => const bottomnavigationbar()),
    //                   (route) => false);

    //               notifyListeners();
    //             } else {
    //               print('No user Find :');

    //               notifyListeners();
    //             }
    //           }),
    //           showDialog(
    //             context: context,
    //             builder: ((context) {
    //               return AlertDialog(
    //                 elevation: 2.0,
    //                 //backgroundColor: Colors.grey,
    //                 title: Text("Error"),
    //                 icon: Icon(
    //                   Icons.error,
    //                   color: const Color(0xFF02C908),
    //                 ),
    //                 content: Text(
    //                     "Your phone number doesnot exist. Please SignUp First"),
    //                 actions: [
    //                   TextButton(
    //                     child: Text("Sign Up"),
    //                     onPressed: () {
    //                       Navigator.of(context).push(
    //                         MaterialPageRoute(
    //                           builder: (context) => SignUp(),
    //                         ),
    //                       );
    //                     },
    //                   ),
    //                 ],
    //               );
    //             }),
    //           ),
    //           notifyListeners(),
    //         });

    //notifyListeners();
  }

  //for searching
  // List UserData = [];
  // Future<void> getUser() async {
  //   //for category
  //   CollectionReference _collectionRefCat =
  //       FirebaseFirestore.instance.collection('User');
  //   // Get docs from collection reference
  //   QuerySnapshot querySnapshot = await _collectionRefCat.get();

  //   // Get data from docs and convert map to List
  //   UserData = querySnapshot.docs.map((doc) => doc.data()).toList();
  //   notifyListeners();
  //   print('Length of Category' + UserData.length.toString());
  // }

  // bool isTyping = false;

  // List UserData1 = [];

  // void searchData(String text) {
  //   var smallText = text.toLowerCase();

  //   UserData1.clear();
  //   UserData.forEach((element) {
  //     var letters = element.Name.split("");
  //     print('First Letter: ' + letters.first);

  //     var smallLetter = letters.first.toLowerCase();
  //     if (smallLetter.contains(smallText)) {
  //       UserData1.add(element);
  //       notifyListeners();
  //     }
  //   });

  //   isTyping = true;
  //   notifyListeners();
  // }

  //for recent search
  List<String> recent = [];
  Future<void> setrecentSearch(name) async {
    print('this here is working so far and the name is ' +
        name +
        'and the list is ' +
        recent.toString());
    recent.add(name);
    print(recent);
    print(name);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('Recent', recent);

    print(prefs.getStringList('Recent').toString());

    // prefs.setStringList("Recent", ["Ac Repair", "Plumber", "Smart Home"]); //save List
    notifyListeners();
    print('Your key has been set.');
  }

  void getRecentSearch() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> recents = prefs.getStringList('Recent') ?? [];
    if (recents != recent) {
      recent = recents;
      print(recent.toList());
    }
    notifyListeners();
  }

  Future<void> removeRecentSearch() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('Recent');
    recent.clear();
    notifyListeners();
  }

  //for city network type ahead

  double x = 0.0;
  double y = 0.0;

  getPermission() async {
    var status = await Permission.location.status;
    if (status.isDenied) {
      if (await Permission.location.request().isGranted) {
        // Either the permission was already granted before or the user just granted it.
      }

// You can request multiple permissions at once.
      Map<Permission, PermissionStatus> statuses = await [
        Permission.location,
        Permission.storage,
      ].request();
      print(statuses[Permission.location]);
      getCurrentlocation();
      getCityLocation();
      // We didn't ask for permission yet or the permission has been denied before but not permanently.
    } else {
      print('is not dnied');
    }
    notifyListeners();
  }

  void getCurrentlocation() async {
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var lastPosition = await Geolocator.getLastKnownPosition();
    x = await position.latitude;
    y = await position.longitude;
    Getlocation(x.toString(), y.toString());
    print('${lastPosition}last position');
    notifyListeners();
  }

  // var city ;
  Map<String, dynamic> _mapLocation = {};
  bool _errorLocation = false;
  String _errorMessageLocation = '';

  Map<String, dynamic> get mapLocation => _mapLocation;

  bool get errorLocation => _errorLocation;

  String get errorMessageLocation => _errorMessageLocation;

  Future<void> Getlocation(String lat, String lng) async {
    final response = await http.get(Uri.parse(
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=AIzaSyCb3U_z-owpRwGS321AP0JX09crvvQj4dw&sensor=false'));

    if (response.statusCode == 200) {
      try {
        _mapLocation = jsonDecode(response.body);
        print(_mapLocation.toString());

        _errorLocation = false;
        if (_mapLocation.isNotEmpty) {
          getCityLocation();

          // addlocation( lat , lng);

        }
      } catch (e) {
        _errorLocation = true;
        _errorMessageLocation = e.toString();
        _mapLocation = {};
      }
    } else {
      _errorLocation = true;
      _errorMessageLocation = 'Error : It could be your Internet connection.';
      _mapLocation = {};
    }
    notifyListeners();
  }

  var cityName = null ?? 'Select City';

  Future<void> getCityLocation() async {
    var gotten_city = await _mapLocation['results'][0]['address_components'][5]
            ['long_name']
        .toString();
    cityName = gotten_city;

    setrecentCity(cityName);
    print('printing city name$cityName');
    notifyListeners();
  }

  //Shared Prefernce city

  Future<void> setrecentCity(name) async {
    cityName = name;
    print(cityName.toString());
    print(name);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('RecentCity', cityName);

    print(prefs.getString('RecentCity').toString());

    notifyListeners();
    print('Your key has been set.');
  }

  void getRecentCity() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String recentsCity = prefs.getString('RecentCity') ?? '';
    if (recentsCity != cityName) cityName = recentsCity;

    notifyListeners();
  }

  Future<void> removeRecentCity() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('RecentCity');
    recent.clear();
    notifyListeners();
  }
}
