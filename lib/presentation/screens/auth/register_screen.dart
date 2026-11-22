import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  bool hidePassword = true;
  bool hideConfirmPassword = true;

  static const Color green = Color(0xFF07845C);

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmController.dispose();
    super.dispose();
  }

  Widget buildField({
    required String hint,
    required IconData icon,
    required TextEditingController controller,
    bool password = false,
    bool confirmPassword = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    bool hidden = confirmPassword ? hideConfirmPassword : hidePassword;

    return Container(
      height: 53,
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 231, 228, 228),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: password || confirmPassword ? hidden : false,
        style: const TextStyle(fontSize: 12, color: Colors.black87),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          hintStyle: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 138, 135, 135),
          ),
          prefixIcon: Icon(icon, size: 19, color: Colors.black87),
          suffixIcon: password || confirmPassword
              ? IconButton(
                  icon: Icon(
                    hidden
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    size: 20,
                    color: const Color.fromARGB(255, 136, 134, 134),
                  ),
                  onPressed: () {
                    setState(() {
                      if (confirmPassword) {
                        hideConfirmPassword = !hideConfirmPassword;
                      } else {
                        hidePassword = !hidePassword;
                      }
                    });
                  },
                )
              : null,
          contentPadding: const EdgeInsets.symmetric(vertical: 14),
        ),
      ),
    );
  }

  void createAccount() {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Veuillez remplir tous les champs')),
      );
      return;
    }

    if (passwordController.text != confirmController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Les mots de passe ne correspondent pas')),
      );
      return;
    }

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Compte créé avec succès !')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              height: 195,
              child: Image.asset(
                'assets/images/download 3.png',

                fit: BoxFit.cover,
              ),
            ),

            // Main content
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),

                    // Back button and title
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.arrow_back_ios_new,
                            size: 17,
                            color: Color.fromARGB(255, 0, 125, 89),
                          ),
                          SizedBox(width: 12),
                          Text(
                            'Créer un compte',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 2, 97, 75),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 25),

                    // Logo
                    Center(
                      child: Image.asset(
                        'assets/images/login.png',
                        width: 80,
                        height: 80,
                      ),
                    ),

                    const SizedBox(height: 30),

                    // Full name
                    buildField(
                      hint: 'Nom complet',
                      icon: Icons.person,
                      controller: nameController,
                    ),

                    // Email
                    buildField(
                      hint: 'Email',
                      icon: Icons.email,
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                    ),

                    // Password
                    buildField(
                      hint: 'Mot de passe',
                      icon: Icons.lock,
                      controller: passwordController,
                      password: true,
                    ),

                    // Confirm password
                    buildField(
                      hint: 'Confirmer le mot de passe',
                      icon: Icons.lock,
                      controller: confirmController,
                      confirmPassword: true,
                    ),

                    const SizedBox(height: 20),

                    // Create account button
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: createAccount,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: green,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          'Créer un compte',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    // Login link
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: RichText(
                          text: const TextSpan(
                            style: TextStyle(
                              fontSize: 11,
                              color: Color.fromARGB(255, 12, 17, 16),
                            ),
                            children: [
                              TextSpan(text: 'Déjà un compte ? '),
                              TextSpan(
                                text: 'Se connecter',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 9, 112, 85),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 190),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Wave design
class WavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFD1F2E9)
      ..style = PaintingStyle.fill;

    final path = Path();

    path.moveTo(0, 25);

    path.quadraticBezierTo(
      size.width * 0.20,
      size.height * 0.48,
      size.width * 0.48,
      15,
    );

    path.quadraticBezierTo(size.width * 0.75, -10, size.width, 28);

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);

    final borderPaint = Paint()
      ..color = const Color(0xFF9FE3D3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2;

    final borderPath = Path()
      ..moveTo(0, 25)
      ..quadraticBezierTo(
        size.width * 0.20,
        size.height * 0.48,
        size.width * 0.48,
        15,
      )
      ..quadraticBezierTo(size.width * 0.75, -10, size.width, 28);

    canvas.drawPath(borderPath, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
