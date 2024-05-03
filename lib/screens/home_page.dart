import 'package:flutter/material.dart';
import 'package:glucosense/Components/resusable_card.dart';
import 'package:glucosense/navigation_bar/nav_bar.dart';
import 'package:glucosense/reusable_widgets/signIn_signUp_buttons.dart';

import '../resources/styles.dart';
import '../reusable_widgets/logo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int sleep_hr = 2;
  int meal_hr = 3;
  int weight = 50;
  int age = 25;
  bool medicationvalue = false;
  bool gendervalue = false;
  int gender = 0;
  int medication = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        drawer: const NavBar(),
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: const Text(
            'Dashboard',
            style: BoldTextStyle,
          ),
        ),
        body: Container(
          decoration: bgDecoration(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(3, 1, 3, 0),
                child: Row(
                  children: [
                    Expanded(
                      child: ReusableCard(
                          kInactivecardcolor,
                          Padding(
                            padding: const EdgeInsets.fromLTRB(5, 5, 5, 15),
                            child: Column(
                              children: [
                                const Text(
                                  'Last Meal (hrs)',
                                  style: labelTextStyle,
                                ),
                                Text(
                                  meal_hr.toString(),
                                  style: SliderTextstyle,
                                ),
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    RoundIconButton(
                                      Icons.arrow_downward_outlined,
                                      () {
                                        setState(() {
                                          meal_hr--;
                                        });
                                      },
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    RoundIconButton(
                                      Icons.arrow_upward_outlined,
                                      () {
                                        setState(() {
                                          meal_hr++;
                                        });
                                      },
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )),
                    ),
                    // Expanded(
                    //   child: ReusableCard(
                    //       kInactivecardcolor,
                    //       Padding(
                    //         padding: const EdgeInsets.fromLTRB(5, 5, 5, 15),
                    //         child: Column(
                    //           children: [
                    //             const Text(
                    //               'Weight (kg)',
                    //               style: labelTextStyle,
                    //             ),
                    //             Text(
                    //               weight.toString(),
                    //               style: SliderTextstyle,
                    //             ),
                    //             Row(
                    //               children: [
                    //                 const SizedBox(
                    //                   width: 10,
                    //                 ),
                    //                 RoundIconButton(
                    //                   Icons.arrow_downward_outlined,
                    //                   () {
                    //                     setState(() {
                    //                       weight--;
                    //                     });
                    //                   },
                    //                 ),
                    //                 const SizedBox(
                    //                   width: 20,
                    //                 ),
                    //                 RoundIconButton(
                    //                   Icons.arrow_upward_outlined,
                    //                   () {
                    //                     setState(() {
                    //                       weight++;
                    //                     });
                    //                   },
                    //                 ),
                    //               ],
                    //             )
                    //           ],
                    //         ),
                    //       )),
                    // ),
                    Expanded(
                      child: ReusableCard(
                        kInactivecardcolor,
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 5, 5, 15),
                          child: Column(
                            children: [
                              const Text(
                                'Age (yrs)',
                                style: labelTextStyle,
                              ),
                              Text(
                                age.toString(),
                                style: SliderTextstyle,
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  RoundIconButton(
                                    Icons.arrow_downward_outlined,
                                    () {
                                      setState(() {
                                        age--;
                                      });
                                    },
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  RoundIconButton(
                                    Icons.arrow_upward_outlined,
                                    () {
                                      setState(() {
                                        age++;
                                      });
                                    },
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(3, 1, 3, 0),
                child: Row(
                  children: [
                    Expanded(
                      child: ReusableCard(
                          kInactivecardcolor,
                          Padding(
                            padding: const EdgeInsets.fromLTRB(5, 5, 5, 15),
                            child: Column(
                              children: [
                                const Text(
                                  'Sleep (hrs)',
                                  style: labelTextStyle,
                                ),
                                Text(
                                  sleep_hr.toString(),
                                  style: SliderTextstyle,
                                ),
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    RoundIconButton(
                                      Icons.arrow_downward_outlined,
                                      () {
                                        setState(() {
                                          sleep_hr--;
                                        });
                                      },
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    RoundIconButton(
                                      Icons.arrow_upward_outlined,
                                      () {
                                        setState(() {
                                          sleep_hr++;
                                        });
                                      },
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )),
                    ),
                    Expanded(
                      child: ReusableCard(
                        kInactivecardcolor,
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 5, 5, 15),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 23,
                              ),
                              const Text(
                                'Medications',
                                style: labelTextStyle,
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text('NO', style: labelTextStyle),
                                  Switch(
                                    value: medication == 1,
                                    onChanged: (value) {
                                      setState(() {
                                        medication = value ? 1 : 0;
                                      });
                                    },
                                    inactiveTrackColor: Colors.blueGrey,
                                    activeTrackColor: Colors.blueGrey,
                                    inactiveThumbColor: Colors.white,
                                  ),
                                  const Text(
                                    'YES',
                                    style: labelTextStyle,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 23,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(3, 1, 3, 0),
                child: Row(
                  children: [
                    Expanded(
                      child: ReusableCard(
                        kInactivecardcolor,
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 5, 5, 15),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 23,
                              ),
                              const Text(
                                'Gender',
                                style: labelTextStyle,
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Icon(
                                    Icons.male,
                                    color: Colors.white,
                                    size: 65,
                                  ),
                                  Switch(
                                    value: gender == 1,
                                    onChanged: (value) {
                                      setState(() {
                                        gender = value ? 1 : 0;
                                      });
                                    },
                                    inactiveTrackColor: Colors.blue,
                                    activeTrackColor: Colors.red,
                                    inactiveThumbColor: Colors.white,
                                  ),
                                  const Icon(
                                    Icons.female,
                                    color: Colors.white,
                                    size: 65,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ReusableCard(
                  kInactivecardcolor,
                  const Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Reading',
                          style: ResultTextStyle,
                        ),
                        // Text(
                        //   '______',
                        //   style: TitleTextStyle,
                        // )
                      ],
                    ),
                  ),
                ),
              ),
              // const SizedBox(
              //   height: 50,
              // ),

              FirebaseButton(context, 'Calculate', () {}),
              // const SizedBox(
              //   height: 50,
              // ),

              // BottomButton(
              //   'Calculate',
              //   () {
              //     // CalculatorBrain calc = CalculatorBrain(height, weight);
              //     //
              //     // Navigator.pushNamed(context, Argumentpassing.routeName,
              //     //     arguments: ArgumentsIMC(
              //     //         calc.CalculateBMI(),
              //     //         calc.GetResults(),
              //     //         calc.GetInterpretation()));
              //   },
              // ),
            ],
          ),
        ));
  }
}

// const Center(
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Text(
// "ID CREATION DATE: ${FirebaseAuth.instance.currentUser?.metadata.creationTime?.day}/${FirebaseAuth.instance.currentUser?.metadata.creationTime?.month}/${FirebaseAuth.instance.currentUser?.metadata.creationTime?.year}"),
// const SizedBox(
// height: 10,
// ),
// Image.network(FirebaseAuth.instance.currentUser!.photoURL!),
// const SizedBox(
// height: 10,
// ),
// Text("${FirebaseAuth.instance.currentUser?.displayName}"),
// const SizedBox(
// height: 10,
// ),
// Text("${FirebaseAuth.instance.currentUser?.email}"),
// const SizedBox(
// height: 10,
// ),
// ElevatedButton(
// child: Text('LOGOUT'),
// onPressed: () async {
// await FirebaseServices_Google().SignOutWithGoogle();
// FirebaseAuth.instance.signOut().then((value) {
// Navigator.push(context,
// MaterialPageRoute(builder: (context) => signInScreen()));
// }).onError((error, stackTrace) {
// print('Signed out from the home screen');
// });
// },
// ),
// ],
// ),
// ),
