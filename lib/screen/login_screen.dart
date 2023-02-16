import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

bool isSwitchOn = true;
bool isSwitched = true;

class _LoginScreenState extends State<LoginScreen> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final genderController = TextEditingController();
  final ageController = TextEditingController();
  final locationController = TextEditingController();
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
                          child: const CircleAvatar(
                            radius: 50,
                            backgroundImage:
                                AssetImage('assets/images/emmanda.png',),
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
                                onTap: () {},
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
                  customTextField('Full Name', 'Dor Alex',nameController),
                  customTextField('Phone Number', '+91727771548',phoneController),
                  customTextField('Gender', 'Male',genderController),
                  customTextField('Age', '24',ageController),
                  customTextField('Location', 'New Town',locationController),
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

  Widget customTextField(String title, String text,dynamic mycontroller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
              fontSize: 17, fontWeight: FontWeight.bold, color: Colors.grey),
        ),
        TextField(
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
              widget.subTitle2,
              style: TextStyle(fontSize: 17, color: Colors.grey.withOpacity(1)),
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

