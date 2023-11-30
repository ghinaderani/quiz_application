import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc/src/bloc_listener.dart';
import 'package:test_quiz/bloc/add_question_bloc.dart';
import 'package:test_quiz/model/model_add.dart';

class AddQuestion extends StatefulWidget {
  @override
  State<AddQuestion> createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {
  TextEditingController AddController = TextEditingController();
  List<bool> isTrue = [];
  List<TextEditingController> AnswerControllers = [];
  int ListController = 5;
  bool ShowAdd = true;
  bool ShowContainer = true;
  bool ShowTextfeild = false;
  bool ShowText = false;
  void addtextfeild() {
    setState(() {
      ShowTextfeild = !ShowTextfeild;
    });
  }

  void removeAdd() {
    setState(() {
      ShowAdd = false;
    });
  }

  void addtext() {
    setState(() {
      ShowText = !ShowText;
    });
  }

  void removeContainer() {
    setState(() {
      ShowContainer = false;
    });
  }

  // @override
  @override
  void initState() {
    super.initState();
    for (int i = 0; i < ListController; i++) {
      AnswerControllers.add(TextEditingController());
    }
    for (int j = 0; j < 5; j++) {
      isTrue.add(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddQuestionBloc(),
      child: Builder(builder: (context) {
        return Scaffold(
          body: Container(
            decoration: BoxDecoration(
              color: Color(0xff8D376F),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                tileMode: TileMode.clamp,
                colors: [
                  Color(0xffDA8BD9),
                  Color(0xffF3BD6B),
                ],
              ),
            ),
            child: Column(
              children: [
                BlocListener<AddQuestionBloc, AddQuestionState>(
                  listener: (data, state) {
                    if (state is Success) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.green,
                          content: Text(" Your question  has added !"),
                        ),
                      );
                    } else if (state is Error) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(" Your question  has not added !"),
                        ),
                      );
                    } else if (state is Offline) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.blue,
                          content: Text("You are offline !"),
                        ),
                      );
                    }
                    ;
                  },
                  child: Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(padding: const EdgeInsets.only(top: 51)),
                          Container(
                            height: 55,
                            width: 281,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15)),
                            child: TextFormField(
                              controller: AddController,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                  ),
                                  disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                  ),
                                  hintText: "Add Question",
                                  hintStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400)),
                                      validator: (value) {
                            if (value!.isEmpty) {
                              return 'please enter the value';
                            }
                            else {
                              return null;
                            }
                          },
                            ),
                          ),
                          Padding(padding: const EdgeInsets.only(top: 60)),
                          Align(
                            alignment: Alignment.center,
                            child: Row(
                              children: [
                                Padding(padding: const EdgeInsets.only(left: 90)),
                                Container(
                                  height: 55,
                                  width: 281,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: TextFormField(
                                    controller: AnswerControllers[0],
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide:
                                            BorderSide(color: Colors.transparent),
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide:
                                            BorderSide(color: Colors.transparent),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide:
                                            BorderSide(color: Colors.transparent),
                                      ),
                                      hintText: "Add Answer A",
                                      hintStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    validator: (value) {
                            if (value!.isEmpty) {
                              return 'please enter the value';
                            }
                            else {
                              return null;
                            }
                          },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 50),
                                ),
                                Checkbox(
                                    focusColor: Color(0xffDA8BD9),
                                    activeColor: Color(0xff8D376F).withOpacity(0.6),
                                    checkColor: Colors.white,
                                    value: isTrue[0],
                                    onChanged: (bool? val) {
                                      setState(() {
                                        isTrue[0] = !isTrue[0];
                                      });
                                    }),
                              ],
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(top: 30)),
                          Align(
                            alignment: Alignment.center,
                            child: Row(
                              children: [Padding(padding: const EdgeInsets.only(left: 140)),
                                Container(
                                  height: 55,
                                  width: 281,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: TextFormField(
                                    controller: AnswerControllers[1],
                                    decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(15),
                                          borderSide:
                                              BorderSide(color: Colors.transparent),
                                        ),
                                        disabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(15),
                                          borderSide:
                                              BorderSide(color: Colors.transparent),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(15),
                                          borderSide:
                                              BorderSide(color: Colors.transparent),
                                        ),
                                        hintText: "Add Answer B",
                                        hintStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400)),
                                            validator: (value) {
                            if (value!.isEmpty) {
                              return 'please enter the value';
                            }
                            else {
                              return null;
                            }
                          },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 50),
                                ),
                                Checkbox(
                                    focusColor: Color(0xffDA8BD9),
                                    activeColor: Color(0xff8D376F).withOpacity(0.6),
                                    checkColor: Colors.white,
                                    value: isTrue[1],
                                    onChanged: (bool? val) {
                                      setState(() {
                                        isTrue[1] = !isTrue[1];
                                      });
                                    }),
                                Padding(
                                  padding: const EdgeInsets.only(left: 50),
                                ),
                                if (ShowContainer)
                                  Container(
                                    height: 30,
                                    width: 30,
                                    color: Color(0xff8D376F),
                                    child: Center(
                                      child: IconButton(
                                        onPressed: () {
                                          removeContainer();
                                          addtextfeild();
                                        },
                                        icon: Row(mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.add,
                                              color: Color(0xffF3BD6B),
                                              size: 10,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          if (ShowTextfeild)
                            Padding(
                              padding: const EdgeInsets.only(top: 30),
                              child: Align(
                                alignment: Alignment.center,
                                child: Row(
                                  children: [Padding(padding: const EdgeInsets.only(left: 140)),
                                    Container(
                                      height: 55,
                                      width: 281,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(15)),
                                      child: TextFormField(
                                        controller: AnswerControllers[2],
                                        decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              borderSide: BorderSide(
                                                  color: Colors.transparent),
                                            ),
                                            disabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              borderSide: BorderSide(
                                                  color: Colors.transparent),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              borderSide: BorderSide(
                                                  color: Colors.transparent),
                                            ),
                                            hintText: "Add Answer C",
                                            hintStyle: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400)),
                                                validator: (value) {
                            if (value!.isEmpty) {
                              return 'please enter the value';
                            }
                            else {
                              return null;
                            }
                          },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 50),
                                    ),
                                    Checkbox(
                                        focusColor: Color(0xffDA8BD9),
                                        activeColor:
                                            Color(0xff8D376F).withOpacity(0.6),
                                        checkColor: Colors.white,
                                        value: isTrue[2],
                                        onChanged: (bool? val) {
                                          setState(() {
                                            isTrue[2] = !isTrue[2];
                                          });
                                        }),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 50),
                                    ),
                                    if (ShowAdd)
                                      Container(
                                        height: 30,
                                        width: 30,
                                        color: Color(0xff8D376F),
                                        child: IconButton(
                                          onPressed: () {
                                            removeAdd();
                                            addtext();
                                          },
                                          icon: Row(mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.add,
                                                color: Color(0xffF3BD6B),
                                                size: 10,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          if (ShowText)
                            Padding(
                              padding: const EdgeInsets.only(top: 30),
                              child: Align(
                                alignment: Alignment.center,
                                child: Row(
                                  children: [Padding(padding: const EdgeInsets.only(left: 150)),
                                    Container(
                                      height: 55,
                                      width: 281,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(15)),
                                      child: TextFormField(
                                        controller: AnswerControllers[3],
                                        decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              borderSide: BorderSide(
                                                  color: Colors.transparent),
                                            ),
                                            disabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              borderSide: BorderSide(
                                                  color: Colors.transparent),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              borderSide: BorderSide(
                                                  color: Colors.transparent),
                                            ),
                                            hintText: "Add Answer D",
                                            hintStyle: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400)),
                                                validator: (value) {
                            if (value!.isEmpty) {
                              return 'please enter the value';
                            }
                            else {
                              return null;
                            }
                          },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 50),
                                    ),
                                    Checkbox(
                                        focusColor: Color(0xffDA8BD9),
                                        activeColor:
                                            Color(0xff8D376F).withOpacity(0.6),
                                        checkColor: Colors.white,
                                        value: isTrue[3],
                                        onChanged: (bool? val) {
                                          setState(() {
                                            isTrue[3] = !isTrue[3];
                                          });
                                        }),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 50),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          Padding(
                            padding: const EdgeInsets.only(top: 50),
                          ),
                          InkWell(
                            onTap: () {
                              context.read<AddQuestionBloc>().add(
                                    Postbloc(
                                      Asks: ModelAdd(
                                        answers: List.generate(
                                            AnswerControllers.length,
                                            (index) => Reply(
                                                answer:
                                                    AnswerControllers[index].text,
                                                isCorrect: isTrue[index])),
                                        question: AddController.text,
                                        // answers:
                                        //make answers bloc
                                      ),
                                    ),
                                  );
                            },
                            child: Container(
                              height: 59,
                              width: 281,
                              decoration: BoxDecoration(
                                color: Color(0xff8D376F),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Center(
                                  child: Text(
                                "Coniform",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              )),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
