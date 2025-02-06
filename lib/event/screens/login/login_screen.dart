import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:evently/event/screens/home/home_screen.dart';
import 'package:evently/event/utl/app_assets.dart';
import 'package:evently/event/utl/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "/login";

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  OutlineInputBorder Border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: AppColors.gray));

  TextStyle Style = TextStyle(fontSize: 16, fontWeight: FontWeight.w500);

  final _formKey = GlobalKey<FormState>();

  var passwordController = TextEditingController();
  var emailController = TextEditingController();

  bool ObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
          child: Container(
        margin: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                  margin: EdgeInsets.only(bottom: 24),
                  width: MediaQuery.of(context).size.width * 0.34,
                  height: MediaQuery.of(context).size.height * 0.22,
                  child: Image.asset(AppAssets.appVerticalLogoImage)),
              TextFormField(
                controller: emailController,
                // validator: (value) => ValidEmail(value),
                style: Style,
                decoration: InputDecoration(
                  hintText: 'email',
                  // Placeholder text
                  border: Border,
                  enabledBorder: Border,
                  focusedBorder: Border,
                  hintStyle: Style,
                  prefixIcon: Container(
                      margin: const EdgeInsets.symmetric(vertical: 14),
                      child: ImageIcon(
                        AssetImage(AppAssets.email),
                        color: AppColors.gray,
                      )),
                ),
                cursorColor: AppColors.white,
              ),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                obscureText: ObscureText,
                controller: passwordController,
                // validator: (value) =>  ValidPassword(value),
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                    hintText: 'password',
                    // Placeholder text
                    border: Border,
                    enabledBorder: Border,
                    focusedBorder: Border,
                    hintStyle:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    prefixIcon: Container(
                        margin: const EdgeInsets.symmetric(vertical: 14),
                        child: ImageIcon(
                          AssetImage(AppAssets.password),
                          color: AppColors.gray,
                        )),
                    suffixIcon: IconButton(
                      icon: Icon(
                        ObscureText
                            ? Icons.visibility_off // When hidden
                            : Icons.visibility, // When visible
                      ),
                      onPressed: () {
                        setState(() {
                          ObscureText = !ObscureText; // Toggle the visibility
                        });
                      },
                    )),
                cursorColor: AppColors.white,
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      textAlign: TextAlign.end,
                      "Forget Password?",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: AppColors.purple, // Color of the text
                        fontSize: 14, // Font size
                        fontWeight: FontWeight.bold, // Font weight
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 24),
                width: MediaQuery.of(context).size.width,
                height: 56,
                child: ElevatedButton(
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: AppColors.white, // Text color
                      fontSize: 16, // Font size
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.purple,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(16), // Rounded corners
                    ),
                  ),
                  onPressed: () => onPressLogin(),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account ? "),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      textAlign: TextAlign.end,
                      "Create account",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: AppColors.purple, // Color of the text
                        fontSize: 16, // Font size
                        fontWeight: FontWeight.bold, // Font weight
                      ),
                    ),
                  ),
                ],
              ),
              Center(
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: AppColors.purple, // Color of the line
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "Or",
                        style: TextStyle(
                          color: AppColors.purple, // Color of the text
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: AppColors.purple,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 24),
                width: MediaQuery.of(context).size.width,
                height: 56,
                child: ElevatedButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(AppAssets.google),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Login with google",
                        style: TextStyle(
                          color: AppColors.purple, // Text color
                          fontSize: 16, // Font size
                        ),
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        // Rounded corners
                        side: BorderSide(color: AppColors.purple)),
                  ),
                  onPressed: () async {
                    try {
                      UserCredential userCredential =
                          await signInWithGoogle(context);
                      signInWithGoogle(context);
                      print(
                          "Signed in as: ${userCredential.user?.displayName}");
                    } catch (e) {
                      print("Error signing in: $e");
                    }
                  },
                ),
              ),
              Container(
                  width: MediaQuery.of(context).size.width * 0.18,
                  height: MediaQuery.of(context).size.height * 0.035,
                  child: AnimatedToggleSwitch.rolling(
                    style: ToggleStyle(backgroundColor: Colors.transparent),
                    current: "ar",
                    values: ["ar", "en"],
                    iconBuilder: (value, foreground) {
                      if (value == "ar") {
                        return CircleAvatar(
                          backgroundImage: AssetImage(AppAssets.AR),
                        );
                      } else {
                        return CircleAvatar(
                          backgroundImage: AssetImage(AppAssets.ENG),
                        );
                      }
                    },
                  )),
            ],
          ),
        ),
      )),
    );
  }

  // String ValidEmail(String? value){
  //     if (value == null || value.isEmpty) {
  //       return 'Please enter an email address';
  //     }
  //     final emailRegex = RegExp(
  //         r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  //     if (!emailRegex.hasMatch(value)) {
  //       return 'Invalid email format';
  //     }
  //     return "";
  // }
  // String ValidPassword(String? value){
  //     if (value == null || value.isEmpty) {
  //       return 'Please enter a password';
  //     }
  //     if (value.length < 8) {
  //       return 'Password must be at least 8 characters';
  //     }
  //     if (!RegExp(r'[A-Z]').hasMatch(value)) {
  //       return 'Password must contain at least one uppercase letter';
  //     }
  //     if (!RegExp(r'[a-z]').hasMatch(value)) {
  //       return 'Password must contain at least one lowercase letter';
  //     }
  //     if (!RegExp(r'[0-9]').hasMatch(value)) {
  //       return 'Password must contain at least one number';
  //     }
  //     if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
  //       return 'Password must contain at least one special character';
  //     }
  //     return "";
  // }
  onPressLogin() async {
    if (!_formKey.currentState!.validate()) return;
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
      print('Logged in successfully: ${credential.user?.email}');
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  Future<UserCredential> signInWithGoogle(BuildContext context) async {
    try {
      print("Starting Google Sign-In...");

      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        print("Google Sign-In Aborted by User.");
        return Future.error("Google Sign-In Aborted");
      }

      print("Google User: ${googleUser.email}");

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      print(
          "Firebase Authentication Successful for: ${userCredential.user?.email}");

      // Ensure the widget is still mounted before navigation
      if (context.mounted) {
        print("Navigating to HomeScreen...");
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      } else {
        print("Context is no longer valid, skipping navigation.");
      }

      return userCredential;
    } catch (e) {
      print("Error signing in with Google: $e");
      return Future.error(e);
    }
  }
}
