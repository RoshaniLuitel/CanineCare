import 'package:canine_care/screens/login.dart';
import 'package:canine_care/screens/register.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:canine_care/navigation/main.dart';
Future main() async{
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool('showHome')?? false;

  runApp(MyApp(showHome: showHome));
}

class MyApp extends StatelessWidget {
  final bool showHome;

  const MyApp({
    Key? key,
    required this.showHome,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.teal,
          scaffoldBackgroundColor: Colors.white,
          textTheme: const TextTheme(
              bodyText2: TextStyle(fontSize: 17)
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              primary: Colors.teal,
              textStyle: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        home: showHome ? OnboardingPage() : OnboardingPage(),
      );
}
class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}
class _OnboardingPageState extends State<OnboardingPage>{


  final controller = PageController();
  bool isLastPage = false;
  @override
  void dispose(){
    controller.dispose();

    super.dispose();
  }
  Widget buildPage({
    required Color color,
    required String urlImage,
    required String title,
    required String subtitle,

  }) =>
      Container(
        color: color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              urlImage,
              fit: BoxFit.cover,
              width: double.infinity,

            ),
            const SizedBox(height: 80),
            Text(
              title,
              style: TextStyle(
                color: Colors.teal,
                fontSize: 35,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.symmetric(),
              alignment: Alignment.bottomRight,
              child: Text(
                  subtitle,
                  style: const TextStyle(color: Colors.black38,
                  fontSize: 20, fontWeight: FontWeight.w600,)
              ),
            ),
          ],
        ),
      );
  @override
  Widget build(BuildContext context) => Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 30),
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() => isLastPage = index == 2);
          },
          children:[
            buildPage(
                color: Colors.white,
                urlImage: 'assets/grooming.png',
                title: 'Groom your dogs!',
                subtitle: 'We provide grooming services for your dogs. Book your appointment today.',
            ),
            buildPage(
                color: Colors.white,
                urlImage: 'assets/train.png',
                title: 'Train your dogs!',
                subtitle: 'We provide  various training services for your dogs. Visit us.',
            ),
            buildPage(
              color: Colors.white,
              urlImage: 'assets/adoption.png',
              title: 'Adopt Me!',
              subtitle: 'We provide different breeds of dogs for adoption. You can also put up your dogs for adoption.',
            ),

      ]),
  ),
            bottomSheet: isLastPage
          ?TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          primary: Colors.white,
          backgroundColor: Colors.teal,
          minimumSize: const Size.fromHeight(50),
        ),
           child: const Text(
          'Get Started',
          style: TextStyle(fontSize: 15),

        ),
        onPressed: () async{
          //navigate to homepage
          final prefs = await SharedPreferences.getInstance();
          prefs.setBool('showHome', true);

          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => MyLogin()),
          );
        },

      )
          : Container(
        padding: const EdgeInsets.all(10),
        height: 50,
             child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              child: const Text('SKIP'),
              onPressed: () => controller.jumpToPage(2),
            ),
            TextButton(
              child: Text('NEXT'),
              onPressed: () => controller.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              ),
            ),
          ],
        ),
      )  );

}


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal,
        body: Center(
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 100),
                Text(
                  "Contact Us",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15 ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 150),
                      TextField(
                        decoration: InputDecoration(
                          filled: true,
                          hintText: "Name:",
                          fillColor: Colors.white,
                          border: InputBorder.none,
                        ),
                      ),
                      SizedBox(height: 8),
                      TextField(
                        decoration: InputDecoration(
                          filled: true,
                          hintText: "Email:",
                          fillColor: Colors.white,
                          border: InputBorder.none,
                        ),
                      ),
                      SizedBox(height: 8),
                      TextField(
                        maxLines: 7 ,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Message:",
                          border: InputBorder.none,
                        ),
                      ),
                      SizedBox(height: 8),
                      MaterialButton(
                          height: 60,
                          minWidth: double.infinity,
                          color: Colors.black,
                          onPressed:(){},
                          child: Text("SUBMIT",style:TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ))
                      )
                    ],
                  ))]
            )

    )
    );}


}
