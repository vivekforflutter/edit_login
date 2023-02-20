

// ignore_for_file: constant_identifier_names




import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:image_picker/image_picker.dart';
enum Gender{
  Male,
  Female
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

bool isSwitchOn = true;
bool isSwitched = false;
bool isEnabled = false;

class _LoginScreenState extends State<LoginScreen> {


  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final gendercontroller = TextEditingController();
  final ageController = TextEditingController();
  final locationController = TextEditingController();


  Gender gender = Gender.Male;
  bool enableEdit = false;
  bool isShow = true;
  String selectedDate = "";
  File? uploadImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: enableEdit
          ? Padding(
              padding: const EdgeInsets.all(20),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  SizedBox(
                    width: 110,
                    height: 35,
                    child: CustomButton(title: 'CANCEL', backgrndColor: Colors.white, foregrndColor: Colors.black)
                  ),
                  SizedBox(
                    width: 110,
                    height: 35,
                    child: CustomButton(title: 'SAVE', backgrndColor: Colors.green, foregrndColor: Colors.black)
                  ),
                ],
              ),
            )
          : null,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
                onPressed: () {
                  setState(() {
                    enableEdit = !enableEdit;
                  });
                },
                icon: const Icon(
                  Icons.edit,
                  size: 35,
                  color: Colors.green,
                )),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 18, right: 18, top: 5),
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Divider(
                    color: Colors.black12,
                    thickness: 1,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Edit Profile",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Stack(
                      children: [
                        Container(
                          width: 300,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 3.0),
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: const [
                              BoxShadow(
                                  blurRadius: 10,
                                  color: Colors.grey,
                                  )
                            ],
                          ),
                          child:  Container(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            height: 100,
                            width: 120,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle
                            ),
                            child: uploadImage == null
                                ? Image.asset('assets/images/emmanda.png') // set a placeholder image when no photo is set
                                : Image.file(uploadImage!,fit: BoxFit.cover,),
                          ),
                        ),
                        Positioned(
                            top: 50,
                            right: 80,
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white, width: 3),
                                shape: BoxShape.circle,
                              ),
                              child: InkWell(
                                onTap: () {
                                  _modalBottomSheetMenu();

                                },
                                child: const CircleAvatar(
                                  backgroundColor: Colors.green,
                                  child: Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )),

                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  customTextField('Full Name', 'Dor Alex',nameController,(){}),
                  customTextField('Phone Number', '+91727771548',phoneController,(){}),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'Gender',
                    style:  TextStyle(
                        fontSize: 17, fontWeight: FontWeight.bold, color: Colors.grey),
                  ),
                  TextFormField(
                    controller: gendercontroller,
                    decoration: InputDecoration(
                      suffixIcon: DropdownButton<Gender>(
                       underline: const Divider(
                         color: Colors.white,
                       ),
                          isExpanded:true,
                          value: gender,
                          onChanged: (Gender? newValue) {
                            setState(() {
                              gender = newValue!;
                            });
                          },
                          items: Gender.values.map((Gender classType) {
                            return DropdownMenuItem<Gender>(
                                value: classType,
                                child: Text(classType.name.toString()));
                          }).toList()
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  customTextField('Age', '24',ageController,(){
                    _selectDate(context);
                  }),
                  customTextField('Location', 'New Town',locationController,(){}),
                  const SizedBox(
                    height: 20,
                  ),
                  if (enableEdit) ...[
                    const CustomHeading(
                      headingTitle: 'Notification',
                      headingIcon: Icons.notification_add_outlined,
                    ),
                    const CustomNotification(
                      subTitle1: 'Push notifications',
                      subTitle2: 'Email notifications',
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const CustomHeading(
                      headingTitle: 'Support',
                      headingIcon: Icons.person_outline,
                    ),
                    const Divider(
                      color: Colors.black12,
                      thickness: 1,
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    support('About Healers and teachers', () {
                      Navigator.pop(context);
                    }),
                    support('Get Help', () {
                      Navigator.pop(context);
                    }),
                    support('Send us feedback', () {
                      Navigator.pop(context);
                    }),
                    support('Rate our app', () {
                      Navigator.pop(context);
                    }),
                    const SizedBox(
                      height: 25,
                    ),
                    const CustomHeading(headingTitle: 'Security',headingIcon: Icons.security,),
                    const Divider(
                      color: Colors.black12,
                      thickness: 1,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    security('change Password', () {
                      Navigator.pop(context);
                    }),

                    security('Deactivate your account', () {
                      Navigator.pop(context);
                    }),
                    // if(enableEdit)
                    const SizedBox(
                      height: 20,
                    ),
                    const Center(
                      child: CustomButton(title: 'SIGN OUT', backgrndColor: Colors.white, foregrndColor: Colors.black,

                      ),
                    )
                  ],
                ],
              ),
        ),
      ),
    );
  }
  void _modalBottomSheetMenu(){
    showModalBottomSheet(
        context: context,
        builder: (builder){
          return  Container(
            height: 150.0,
            color: Colors.transparent, //could change this to Color(0xFF737373),
            //so you don't have to change MaterialApp canvasColor
            child:  Container(
                decoration:  const BoxDecoration(
                    color: Colors.white,
                    borderRadius:  BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                        onPressed: () {
                          pickImage(source:ImageSource.gallery);
                          Navigator.pop(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Icon(Icons.image_outlined),
                            Text("Pick Gallery"),
                          ],
                        )),
                  ),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                        onPressed: () {
                          pickImage(source: ImageSource.camera);
                          Navigator.pop(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Icon(Icons.camera_alt_outlined),
                            Text("Pick Camera"),
                          ],
                        )),
                  ),
                ],
              ),
              ),
          );
        }
    );
  }



  Future pickImage( {required ImageSource source}) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if(image == null) return;
      setState(() {
        uploadImage = File(image.path);
      });
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }




///-------------------Function to open calender and calculate age---------------------///

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1990, 1),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        final birthdayYear = picked.year;
        final date2Year = DateTime.now().year;
        int year = date2Year - birthdayYear;
        selectedDate = "$year years";
        ageController.text = selectedDate;

      });
    }
  }

  Widget support(String title, void Function()? onPressed) {
    return InkWell(
      onTap: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
                size: 20,
              ))
        ],
      ),
    );
  }

  Widget security(String title, void Function()? onPressed) {
    return InkWell(
      onTap: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
                size: 20,
              ))
        ],
      ),
    );
  }

  Widget customTextField(String title, String text,dynamic mycontroller,void Function()? onPressed) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
              fontSize: 17, fontWeight: FontWeight.bold, color: Colors.grey),
        ),
        TextField(
          onTap: onPressed,
          controller: mycontroller,
          readOnly: enableEdit,
          decoration: InputDecoration(
            hintText: text,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

}

class CustomHeading extends StatelessWidget {
  final dynamic headingIcon;
  final String headingTitle;
  const CustomHeading({super.key, this.headingIcon, required this.headingTitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          headingIcon,
          color: Colors.green,
          size: 30,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          headingTitle,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class CustomNotification extends StatefulWidget {
  final String subTitle1;
  final String subTitle2;

  const CustomNotification({
    super.key,
    required this.subTitle1,
    required this.subTitle2,
  });

  @override
  State<CustomNotification> createState() => _CustomNotificationState();
}

class _CustomNotificationState extends State<CustomNotification> {
  void toggleSwitch(bool value) {
    if(isSwitched == false)
    {
      setState(() {
        isSwitched = true;
      });
    }
    else
    {
      setState(() {
        isSwitched = false;
      });
    }
  }
  void toggleMaterial(bool value) {
    if(isEnabled == false)
    {
      setState(() {
        isEnabled = true;
      });
    }
    else
    {
      setState(() {
        isEnabled = false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          color: Colors.black12,
          thickness: 1,
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.subTitle1,
              style: TextStyle(fontSize: 17, color: Colors.grey.withOpacity(1)),
            ),
            Switch(
              onChanged: toggleMaterial,
              value: isEnabled,
              activeColor: Colors.white,
              activeTrackColor: Colors.green,
              inactiveThumbColor: Colors.redAccent,
              inactiveTrackColor: Colors.black,)
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.subTitle2,
              style: TextStyle(fontSize: 17, color: Colors.grey.withOpacity(1)),
            ),
            Switch(
              onChanged: toggleSwitch,
              value: isSwitched,
              activeColor: Colors.white,
              activeTrackColor: Colors.green,
              inactiveThumbColor: Colors.redAccent,
              inactiveTrackColor: Colors.black,)
          ],
        ),
      ],
    );
  }
}

class CustomButton extends StatelessWidget{
  final String title;
  final dynamic backgrndColor;
  final dynamic foregrndColor;
  const CustomButton({super.key, required this.title, required this.backgrndColor, required this.foregrndColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        backgroundColor: backgrndColor,
        foregroundColor: foregrndColor,
        side: const BorderSide(
          color: Colors.black,
        ),
      ),
      child:  Text(
        title,
        style: const TextStyle(fontSize: 16),
      ),
    );

  }}



