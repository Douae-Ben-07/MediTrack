import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool rememberMe = false;
  bool hidePassword = true;

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // COLORS
  static const Color green = Color.fromARGB(255, 15, 89, 66);
  static const Color darkGreen = Color(0xFF245C55);
  static const Color lightGreen = Color(0xFFEAF5F1);

  // IMAGES PATH
  static const String imagePath = 'assets/images/';

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // IMAGE FUNCTION
  Widget buildImage(
    String imageName, {
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
  }) {
    return Image.asset(
      '$imagePath$imageName',
      width: width,
      height: height,
      fit: fit,
      errorBuilder: (context, error, stackTrace) {
        return const Icon(
          Icons.image_not_supported,
          color: Colors.red,
          size: 30,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Stack(
          children: [
            // BOTTOM BACKGROUND
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: IgnorePointer(
                child: buildImage(
                  'backgroundcolor.png',
                  width: 700,
                  height: 900,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: buildImage(
                'backgroundcolor_h2.png',
                width: double.infinity,
                height: 100,
                fit: BoxFit.fill,
              ),
            ),

            // MEDICINES IMAGE
            Positioned(
              top: 20,
              right: 0,
              child: buildImage('medicines.png', width: 100, height: 220),
            ),
            LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),

                    child: IntrinsicHeight(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 15,
                        ),

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            const SizedBox(height: 50),
                            Center(
                              child: Column(
                                children: [
                                  buildImage(
                                    'login.png',
                                    width: 70,
                                    height: 70,
                                  ),
                                  const SizedBox(height: 0),

                                  Text(
                                    'MediTrack',
                                    style: GoogleFonts.manrope(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: const Color.fromARGB(
                                        255,
                                        9,
                                        59,
                                        53,
                                      ),
                                    ),
                                  ),

                                  const SizedBox(height: 0),

                                  Text(
                                    'Prenez soin de votre santé,\nintelligemment',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.inter(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                      color: const Color.fromARGB(
                                        255,
                                        127,
                                        133,
                                        130,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 35),

                            // WELCOME
                            Row(
                              children: [
                                Text(
                                  'Bienvenue !',
                                  style: GoogleFonts.manrope(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: darkGreen,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 0),

                            Text(
                              'Connectez-vous pour gérer vos traitements\n'
                              'et ne plus oublier vos médicaments',
                              style: GoogleFonts.inter(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(255, 3, 4, 4),
                              ),
                            ),

                            const SizedBox(height: 28),

                            // USERNAME
                            _buildField(
                              controller: usernameController,
                              hint: 'Nom d’utilisateur',
                              icon: Icons.person,
                            ),

                            const SizedBox(height: 10),

                            // PASSWORD
                            TextField(
                              controller: passwordController,
                              obscureText: hidePassword,

                              decoration: InputDecoration(
                                hintText: 'Mot de passe',

                                hintStyle: GoogleFonts.inter(fontSize: 14),

                                prefixIcon: const Icon(
                                  Icons.lock_outline,
                                  size: 20,
                                  color: Colors.black,
                                ),

                                suffixIcon: IconButton(
                                  icon: Icon(
                                    hidePassword
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    size: 19,
                                    color: Colors.black,
                                  ),

                                  onPressed: () {
                                    setState(() {
                                      hidePassword = !hidePassword;
                                    });
                                  },
                                ),

                                filled: true,
                                fillColor: const Color.fromARGB(
                                  255,
                                  237,
                                  241,
                                  240,
                                ),

                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 13,
                                ),

                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),

                            const SizedBox(height: 1),

                            // REMEMBER ME
                            Row(
                              children: [
                                Checkbox(
                                  value: rememberMe,
                                  activeColor: const Color.fromARGB(
                                    255,
                                    55,
                                    159,
                                    126,
                                  ),

                                  onChanged: (value) {
                                    setState(() {
                                      rememberMe = value ?? false;
                                    });
                                  },
                                ),
                                const SizedBox(height: 0),
                                Expanded(
                                  child: Text(
                                    'Se souvenir de moi',
                                    style: GoogleFonts.inter(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: const Color.fromARGB(
                                        255,
                                        3,
                                        103,
                                        61,
                                      ),
                                    ),
                                  ),
                                ),

                                TextButton(
                                  onPressed: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          'Fonctionnalité à ajouter',
                                        ),
                                      ),
                                    );
                                  },

                                  child: Text(
                                    'Mot de passe oublié ?',
                                    style: GoogleFonts.inter(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: const Color.fromARGB(
                                        255,
                                        20,
                                        107,
                                        80,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 30),

                            // LOGIN BUTTON
                            SizedBox(
                              width: double.infinity,
                              height: 44,

                              child: ElevatedButton.icon(
                                onPressed: () {
                                  if (usernameController.text.isEmpty ||
                                      passwordController.text.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          'Veuillez remplir tous les champs',
                                        ),
                                      ),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          'Connexion à connecter avec AuthProvider',
                                        ),
                                      ),
                                    );
                                  }
                                },

                                icon: const Icon(Icons.login, size: 17),

                                label: Text(
                                  'Se connecter',
                                  style: GoogleFonts.inter(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color.fromARGB(
                                    255,
                                    6,
                                    115,
                                    80,
                                  ),
                                  foregroundColor: Colors.white,

                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(height: 25),

                            // OR
                            Row(
                              children: [
                                Expanded(
                                  child: Divider(color: green, thickness: 1.2),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 15,
                                  ),
                                  child: Text(
                                    'OU',
                                    style: GoogleFonts.inter(
                                      fontSize: 11,
                                      color: darkGreen,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Divider(color: green, thickness: 1.2),
                                ),
                              ],
                            ),

                            const SizedBox(height: 25),

                            // CREATE ACCOUNT
                            SizedBox(
                              width: double.infinity,
                              height: 44,

                              child: OutlinedButton.icon(
                                onPressed: () {},

                                icon: const Icon(
                                  Icons.person_add_alt_1,
                                  size: 17,
                                ),

                                label: Text(
                                  'Créer un compte',
                                  style: GoogleFonts.inter(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),

                                style: OutlinedButton.styleFrom(
                                  foregroundColor: darkGreen,
                                  backgroundColor: lightGreen,
                                  side: BorderSide.none,

                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(height: 90),

                            // FOOTER
                            Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomPaint(
                                    size: const Size(35, 30),
                                    painter: HeartbeatPainter(),
                                  ),
                                  Expanded(
                                    child: Divider(
                                      color: Color(0xFF17804F),
                                      indent: 15,
                                      endIndent: 15,
                                      thickness: 1,
                                    ),
                                  ),
                                  const SizedBox(width: 8),

                                  Text(
                                    'Votre santé, notre priorité',
                                    style: GoogleFonts.inter(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Expanded(
                                    child: Divider(
                                      color: Color(0xFF17804F),
                                      indent: 15,
                                      endIndent: 15,
                                      thickness: 1,
                                    ),
                                  ),
                                  const SizedBox(width: 10),

                                  const Icon(
                                    Icons.favorite_border,
                                    color: Color(0xFF17804F),
                                    size: 27,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 15),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // USERNAME FIELD
  Widget _buildField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
  }) {
    return TextField(
      controller: controller,

      decoration: InputDecoration(
        hintText: hint,

        hintStyle: GoogleFonts.inter(fontSize: 12),

        prefixIcon: Icon(icon, size: 20),

        filled: true,
        fillColor: const Color(0xFFF3F5F4),

        contentPadding: const EdgeInsets.symmetric(vertical: 13),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

class HeartbeatPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF17804F)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path = Path()
      ..moveTo(0, 16)
      ..lineTo(9, 16)
      ..lineTo(13, 5)
      ..lineTo(19, 25)
      ..lineTo(24, 11)
      ..lineTo(28, 16)
      ..lineTo(35, 16);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
