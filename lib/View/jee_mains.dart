import 'package:board_paper/View/pdf_viewer_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../Controller/jeemains_controller.dart';

class JeeMainsPage extends StatefulWidget {
  const JeeMainsPage({super.key});

  @override
  State<JeeMainsPage> createState() => _JeeMainsPageState();
}

class _JeeMainsPageState extends State<JeeMainsPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<JeeMainsController>().getJeeMainsAPIData();
    });
  }

  final bodyColor = const LinearGradient(
    colors: [Color(0xffFFFFFF), Color(0xffF6AC43)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  @override
  Widget build(BuildContext context) {
    final jeeData = context.watch<JeeMainsController>().jeeMainsUserData;
    final mq = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(gradient: bodyColor),
          child: Stack(
            children: [
              Positioned(
                child: Image.asset(
                  "assets/jee_header.png",
                  fit: BoxFit.fill,
                  width: mq.width,
                ),
              ),
              Positioned(
                top: mq.height * 0.22,
                left: mq.width * 0.2,
                child: Image.asset(
                  "assets/jeemains.png",
                  height: 32,
                  width: mq.width,
                ),
              ),
              Positioned(
                top: mq.height * 0.27,
                left: 0,
                right: 0,
                bottom: 0,
                child: jeeData.isEmpty
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        padding: EdgeInsets.symmetric(
                          horizontal: mq.width * 0.05,
                          vertical: mq.height * 0.02,
                        ),
                        itemCount: jeeData.length,
                        itemBuilder: (context, index) {
                          final item = jeeData[index];
                          return Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: mq.height * 0.01,
                            ),
                            child: Card(
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: mq.width * 0.05,
                                  vertical: mq.height * 0.01,
                                ),
                                title: Text(
                                  "${item.year}",
                                  style: TextStyle(
                                    fontSize: mq.width * 0.05,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black87,
                                  ),
                                ),
                                trailing: SizedBox(
                                  height: mq.height * 0.08,
                                  width: mq.width * 0.15,
                                  child: Image.asset(
                                    "assets/download.png",
                                    color: const Color(0xffF6AC43),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                onTap: () {
                                  Get.to(PdfViewerPage(pdfUrl: "${item.file}"));
                                },
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
