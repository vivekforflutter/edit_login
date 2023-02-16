import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isSwitchOn = true;
  bool isSwitched = true;
  bool enableEdit = false;
  bool isShow = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: enableEdit
          ? Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 110,
                    height: 35,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        primary: Colors.white,
                        onPrimary: Colors.black,
                        side: const BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      child: const Text(
                        'CANCEL',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 110,
                    height: 35,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        primary: Colors.green,
                        onPrimary: Colors.black,
                        side: const BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      child: const Text(
                        'SAVE',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            )
          : null,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
          child: Stack(
            children: [
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
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 3.0),
                        color: Colors.white.withOpacity(0.2),
                        shape: BoxShape.circle,
                        boxShadow: const [
                          BoxShadow(
                              blurRadius: 20,
                              color: Colors.grey,
                              spreadRadius: 4)
                        ],
                      ),
                      child: const CircleAvatar(
                        radius: 50,
                        backgroundImage:
                            AssetImage('assets/images/emmanda.png'),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                 customTextField('Full Name','Dor Alex'),
                  customTextField('Phone Number','+91727771548'),
                  customTextField('Gender', 'Male'),
                  customTextField('Age', '24'),
                  customTextField('Location', 'New Town'),

                  const SizedBox(
                    height: 20,
                  ),

                  if (enableEdit) ...[
                    Row(
                      children: const [
                        Icon(
                          Icons.notification_add_outlined,
                          color: Colors.green,
                          size: 30,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Notifications",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
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
                          "Push notifications",
                          style: TextStyle(
                              fontSize: 17, color: Colors.grey.withOpacity(1)),
                        ),
                        FlutterSwitch(
                          value: isSwitchOn,
                          activeColor: Colors.green,
                          height: 25,
                          width: 45,
                          onToggle: (value) {
                            setState(() {
                              isSwitchOn = value;
                            });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Email notifications",
                          style: TextStyle(
                              fontSize: 17, color: Colors.grey.withOpacity(1)),
                        ),
                        FlutterSwitch(
                          value: isSwitched,
                          activeColor: Colors.green,
                          height: 25,
                          width: 45,
                          onToggle: (value) {
                            setState(() {
                              isSwitched = value;
                            });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.person_outline,
                          color: Colors.green,
                          size: 30,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Support",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
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
                    Row(
                      children: const [
                        Icon(
                          Icons.security,
                          color: Colors.green,
                          size: 30,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Security",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
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
                    Center(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          primary: Colors.white,
                          onPrimary: Colors.black,
                          side: const BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        child: const Text(
                          'SIGN OUT',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
              Positioned(
                  top: 140,
                  right: 110,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 3),
                      shape: BoxShape.circle,
                    ),
                    child: const  CircleAvatar(
                      backgroundColor: Colors.green,
                      child: Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget support(String title, void Function()? onPressed) {
    return Row(
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
    );
  }
  Widget security(String title, void Function()? onPressed) {
    return Row(
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
    );
  }
  Widget customTextField(String title,String text){
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style:const  TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Colors.grey),
        ),
        TextField(
          readOnly: enableEdit,
          decoration:  InputDecoration(
            hintText: text,
          ),
        ),
        const SizedBox(
          height: 20,
        ),

      ],
    );
  }
  Widget customDivider(title,customIcon){
    return Column(
      children: [
        Row(
          children:  [
            Icon(
              customIcon,
              color: Colors.green,
              size: 30,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              title,
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const Divider(
          color: Colors.black12,
          thickness: 1,
        ),
      ],

    );
  }
}
