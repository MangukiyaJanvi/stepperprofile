import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stepperprofile/screens/home/provider/home_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeProvider? hfalse;
  HomeProvider? htrue;

  @override
  Widget build(BuildContext context) {
    hfalse = Provider.of<HomeProvider>(context, listen: false);
    htrue = Provider.of<HomeProvider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
        ),
        body: Stepper(
          onStepTapped: (value) {
            hfalse!.change(value);
          },
          currentStep: htrue!.i,
          onStepContinue: () {
            hfalse!.oncontinue();
          },
          onStepCancel: () {
            hfalse!.oncancle();
          },
          steps: [
            Step(
              title: Text('Profile Picture'),
              content: Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade200,
                      shape: BoxShape.circle
                    ),
                    child: Icon(Icons.person,size: 100,color: Colors.blue.shade800,),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
            Step(
              title: Text('Name'),
              content: Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.name,
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                      icon: Icon(Icons.person_outline_rounded),
                      label: Text('Full Name'),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            Step(
              title: Text('Phone'),
              content: Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      icon: Icon(Icons.call),
                      label: Text('Contact Number'),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
            Step(
              title: Text('Email'),
              content: Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      icon: Icon(Icons.mail_outline),
                      label: Text('Email id'),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
            Step(
              title: Text('Date Of Birth'),
              content: Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                          '${htrue!.currentdate.year}-${htrue!.currentdate.month}-${htrue!.currentdate.day}'),
                      IconButton(
                          onPressed: () async {
                            DateTime? date = await showDatePicker(
                              context: context,
                              initialDate: hfalse!.currentdate,
                              firstDate: DateTime(1950),
                              lastDate: DateTime(2030),
                            );
                            hfalse!.setdate(date!);
                          },
                          icon: Icon(Icons.edit)),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
            Step(
              title: Text('Gender'),
              content: Column(
                children: [
                  RadioListTile(
                    title: Text("Male"),
                    value: "male",
                    groupValue: hfalse!.gender,
                    onChanged: (value) {
                      htrue!.chagegender(value!);
                    },
                  ),
                  RadioListTile(
                    title: Text("Female"),
                    value: "female",
                    groupValue: hfalse!.gender,
                    onChanged: (value) {
                      htrue!.chagegender(value!);
                    },
                  ),
                ],
              ),
            ),
            Step(
              title: Text('Current Location'),
              content: Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.streetAddress,
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                      icon: Icon(Icons.location_on_outlined),
                      label: Text('Location'),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
            Step(
              title: Text('Nationalities'),
              content: Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                      icon: Icon(Icons.flag),
                      label: Text('Nationalities'),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
            Step(
              title: Text('Religion'),
              content: Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                      icon: Icon(Icons.ac_unit_outlined),
                      label: Text('Religion'),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
            Step(
              title: Text('Languages'),
              content: Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                      icon: Icon(Icons.language_outlined),
                      label: Text('Languages'),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
            Step(
              title: Text('BioGraphy'),
              content: Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                      icon: Icon(Icons.add_box_outlined),
                      label: Text('BioGraphy'),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
