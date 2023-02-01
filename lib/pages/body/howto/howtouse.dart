import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HowToUse extends StatefulWidget {
  
  const HowToUse({super.key});
  @override
  State<HowToUse> createState() => _MyWidgetState();
}
  hexColor(String colorhercode) {
    // ignore: prefer_interpolation_to_compose_strings
    String colornew = '0xff' + colorhercode;
    colornew = colornew.replaceAll('#', '');
    int colorint = int.parse(colornew);
    return colorint;
  }
// ignore: non_constant_identifier_names

class _MyWidgetState extends State<HowToUse> {
  bool isLastPage = false;

  final controller = PageController();

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }
    hexColor(String colorhercode) {
    // ignore: prefer_interpolation_to_compose_strings
    String colornew = '0xff' + colorhercode;
    colornew = colornew.replaceAll('#', '');
    int colorint = int.parse(colornew);
    return colorint;
  }
  bool isvisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: 
      Colors.white
      // Color(hexColor('#55C596'))
      ,
      body: Container(
        padding: const EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: controller,
          onPageChanged:(index) {
                      setState(() => isLastPage = index == 2);
          },

          children: [
            Container(
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/howtouse/1stStep.png',
                  width: MediaQuery.of(context).size.width,
                  ),
                  SizedBox(height: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const[
                       Text('Step 1',
                      style: TextStyle(
                        fontFamily: 'Segoe UI',
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                      ),
                      SizedBox(height: 5,),
                       Text('Click the scan button.',
                      style: TextStyle(
                        fontFamily: 'Segoe UI',
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.normal
                      ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 60.0, right: 60),
                        child: Divider(
                          color: Colors.black,
                        ),
                      ),
                      Text('Pindutin ang Scan button.',
                      style: TextStyle(
                        fontFamily: 'Segoe UI',
                        color: Colors.black,
                        fontSize: 15,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.normal
                      ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
              Container(
              child: Column(
                 crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/howtouse/2ndStep.png',
                   width: MediaQuery.of(context).size.width,
                  ),
                  SizedBox(height: 20,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const[
                       Text('Step 2',
                      style: TextStyle(
                        fontFamily: 'Segoe UI',
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                      ),
                      SizedBox(height: 5,),
                       Padding(
                         padding: EdgeInsets.only(left: 30.0, right: 30),
                         child: Text('Select camera or gallery and take a photo of any nearby plants or flowers.',
                         textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Segoe UI',
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.normal
                      ),
                      ),
                       ),
                      Padding(
                        padding: EdgeInsets.only(left: 20.0, right: 20),
                        child: Divider(
                          color: Colors.black,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 30.0, right: 30),
                        child: Text('Pumili kung camera/gallery at kuhaan ng litrato ang halaman/bulaklak na malapit sa iyo.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Segoe UI',
                          color: Colors.black,
                          fontSize: 15,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.normal
                        ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/howtouse/4thStep.png',
                  width: MediaQuery.of(context).size.width,
                  ),
                  SizedBox(height: 20,),
                   Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const[
                       Text('Step 3',
                      style: TextStyle(
                        fontFamily: 'Segoe UI',
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                      ),
                      SizedBox(height: 5,),
                       Padding(
                         padding: EdgeInsets.only(left: 30.0, right: 30),
                         child: Text('After taking a photo it will display the information of herbal.',
                         textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Segoe UI',
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.normal
                      ),
                      ),
                       ),
                      Padding(
                        padding: EdgeInsets.only(left: 20.0, right: 20),
                        child: Divider(
                          color: Colors.black,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 30.0, right: 30),
                        child: Text('Pagkatapos kuhaan ng litrato agad nitong ipapakita ang pangalan at impormasyon.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Segoe UI',
                          color: Colors.black,
                          fontSize: 15,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.normal
                        ),
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
      bottomSheet: 
      isLastPage ? TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1)),
          primary: Colors.white,
          backgroundColor: Color(hexColor('#55C596')),
          minimumSize: const Size.fromHeight(80)
        ),
        onPressed: () =>  Navigator.pop(context),
        child: Text('Get Started',
        style: TextStyle(fontSize: 24),)) :
      
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 1),
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(child: const Text('SKIP',
            style: TextStyle(
               color: Color.fromARGB(255, 37, 136, 95)
            ),
            ),
            onPressed: () =>
              Navigator.pop(context),
            
            ),
            Center(child: SmoothPageIndicator(controller: controller, count: 3,
            effect: WormEffect(
              spacing: 16,
              dotColor: Color.fromARGB(255, 149, 165, 150),
              activeDotColor: Color.fromARGB(255, 2, 136, 114)
            ),
            onDotClicked: (index)=> controller.animateToPage(
              index, duration: const Duration(milliseconds: 500), curve: Curves.easeIn),
            )
            ),
             TextButton(child: const Text('NEXT',
             style: TextStyle(
              color: Color.fromARGB(255, 37, 136, 95)
            ),
             ),
            onPressed: () => controller.nextPage(
              duration: const Duration(milliseconds: 500), 
              curve: Curves.easeInOut),
            )
          ],
        ),
      ),
    );
}

 AppBar buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Color.fromARGB(255, 255, 255, 255),
          size: 30,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      actions: [
      ],
    );
  }
}
