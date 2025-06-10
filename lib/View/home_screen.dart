import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Widgets/course_selection_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'jee_advanced.dart';
import 'jee_mains.dart';
import 'mhcet.dart';
import 'neet.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final bodyGradient = const LinearGradient(
    colors: [Color(0xffE25454), Color(0xff5C2AC1)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(gradient: bodyGradient),
          child: Stack(
            children: [
              Image.asset(
                "assets/header.png",
                width: mq.width,
                fit: BoxFit.fill,
              ),
              Positioned(
                top: mq.height * 0.07,
                left: mq.width * 0.57 - (mq.height * 0.25 / 1.7),
                child: Image.asset(
                  "assets/logo.png",
                  height: mq.height * 0.25,
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                left: mq.width * 0.04,
                top: mq.height * 0.35,
                child: Text(
                  "12TH STD QUESTION PAPERS",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: mq.height * 0.022,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Positioned(
                top: mq.height * 0.38,
                left: 0,
                right: 0,
                bottom: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 10.0,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () => Get.to(JeeMainsPage()),
                          child: courseSelectionCard(
                            context,
                            primaryIcon: FontAwesomeIcons.atom,
                            primaryIconColor: const Color(0xFFC77700),
                            title: "JEE Mains",
                            description: "Original question papers & answers",
                            cardColor: const Color(0xFFFFDB7A),
                            secondaryIcon: FontAwesomeIcons.personHiking,
                            secondaryIconColor: const Color(0xFFC77700),
                          ),
                        ),
                        InkWell(
                          onTap: () => Get.to(JeeAdvanced()),

                          child: courseSelectionCard(
                            context,
                            primaryIcon: FontAwesomeIcons.lightbulb,
                            primaryIconColor: const Color(0xFFC04F4F),
                            title: "JEE Advanced",
                            description: "Free Question Papers",
                            cardColor: const Color(0xFFFF8E8E),
                            secondaryIcon: FontAwesomeIcons.cloudArrowUp,
                            secondaryIconColor: const Color(0xFFC04F4F),
                          ),
                        ),
                        InkWell(
                          onTap: () => Get.to(MhCetPage()),
                          child: courseSelectionCard(
                            context,
                            primaryIcon: FontAwesomeIcons.graduationCap,
                            primaryIconColor: const Color(0xFF3F77B0),
                            title: "MH-CET",
                            description: "Past year papers & solutions.",
                            cardColor: const Color(0xFF90C2F6),
                            secondaryIcon: FontAwesomeIcons.bookOpenReader,
                            secondaryIconColor: const Color(0xFF3F77B0),
                          ),
                        ),
                        InkWell(
                          onTap: () => Get.to(NeetPage()),
                          child: courseSelectionCard(
                            context,
                            primaryIcon: FontAwesomeIcons.dna,
                            primaryIconColor: const Color(0xFF7CB841),
                            title: "NEET",
                            description: "Latest Question papers available",
                            cardColor: const Color(0xFFC0EEA3),
                            secondaryIcon: FontAwesomeIcons.dna,
                            secondaryIconColor: const Color(0xFF7CB841),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
