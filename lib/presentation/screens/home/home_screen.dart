import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final String userName;

  const HomeScreen({super.key, this.userName = 'Utilisateur'});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const Color green = Color(0xFF16856B);
  static const Color darkGreen = Color(0xFF12634F);
  static const Color background = Color(0xFFF1F8F5);
  static const Color textColor = Color(0xFF263C36);

  bool seniorMode = false;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. HEADER

              Row(
                children: [
                  Transform.translate(
                    offset: const Offset(-15, 0),
                    child: Image.asset(
                      'assets/images/loginc.png',
                      width: 80,
                      height: 80,
                    ),
                  ),

                  Transform.translate(
                    offset: const Offset(-20, 0),
                    child: const Text(
                      'MediTrack',
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: green,
                      ),
                    ),
                  ),

                  const Spacer(),

                  Transform.translate(
                    offset: const Offset(5, -8),
                    child: Stack(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.notifications_none,
                            color: textColor,
                            size: 30,
                          ),
                        ),

                        Positioned(
                          right: 7,
                          top: 5,
                          child: Container(
                            width: 17,
                            height: 17,
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                            child: const Center(
                              child: Text(
                                '2',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 8),

              // 2. BIENVENUE
              Text(
                'Bonjour ${widget.userName}',
                style: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: green,
                ),
              ),

              const SizedBox(height: 0),

              const Text(
                "Prenez soin de votre santé aujourd'hui",
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 162, 170, 168),
                ),
              ),

              const SizedBox(height: 20),

              // 3. PROCHAINE PRISE
              Container(
                padding: const EdgeInsets.all(17),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(13),
                ),

                child: Row(
                  children: [
                    const Icon(
                      Icons.medication_outlined,
                      color: green,
                      size: 27,
                    ),

                    const SizedBox(width: 0),

                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Prochaine prise',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: textColor,
                            ),
                          ),

                          Text(
                            'Médicament',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: textColor,
                            ),
                          ),

                          SizedBox(height: 5),

                          Text(
                            "Aujourd'hui – 14:00",
                            style: TextStyle(fontSize: 10, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),

                    Transform.translate(
                      offset: const Offset(0, -15),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 9,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFDDF3EA),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          'À Prendre',
                          style: TextStyle(color: green, fontSize: 9),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              // 4. AJOUTER UN MEDICAMENT
              SizedBox(
                width: double.infinity,
                height: 43,
                child: ElevatedButton(
                  onPressed: () {},

                  style: ElevatedButton.styleFrom(
                    backgroundColor: darkGreen,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(11),
                    ),
                  ),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Transform.translate(
                        offset: const Offset(-75, 0),
                        child: const Icon(
                          Icons.arrow_forward_ios,
                          size: 17,
                          color: Colors.white,
                        ),
                      ),

                      const SizedBox(width: 7),

                      const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Ajouter un médicament',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          Text(
                            'Ajouter un nouveau traitement',
                            style: TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(width: 7),

                      const Icon(Icons.add_circle_outline, size: 22),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 15),

              // 5. MES FONCTIONNALITES
              const Row(
                children: [
                  Icon(Icons.dashboard, color: green, size: 20),

                  SizedBox(width: 6),

                  Text(
                    'Mes fonctionnalités',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              // PREMIERE LIGNE
              Row(
                children: [
                  Expanded(
                    child: _featureCard(
                      Icons.medication_outlined,
                      'Médicaments',
                      'Voir vos traitements',
                    ),
                  ),

                  const SizedBox(width: 10),

                  Expanded(
                    child: _featureCard(
                      Icons.calendar_month,
                      'Mon planning',
                      'Horaire des prises',
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              // DEUXIEME LIGNE
              Row(
                children: [
                  Expanded(
                    child: _featureCard(
                      Icons.qr_code_scanner,
                      'QR Code',
                      'Scanner un médicament',
                    ),
                  ),

                  const SizedBox(width: 10),

                  Expanded(
                    child: _featureCard(
                      Icons.bar_chart,
                      'Statistiques',
                      'Suivi des prises',
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              // TROISIEME LIGNE
              Row(
                children: [
                  Expanded(
                    child: _featureCard(
                      Icons.picture_as_pdf,
                      'Rapport PDF',
                      'Générer un rapport',
                      iconColor: Colors.red,
                    ),
                  ),

                  const SizedBox(width: 10),

                  Expanded(child: _seniorCard()),
                ],
              ),

              const SizedBox(height: 20),

              // 6. RAPPORT DE SUIVI
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(13),
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      'Rapport de suivi',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Row(
                      children: [
                        Container(
                          width: 55,
                          height: 55,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color(0xFFE5F5EF),
                            border: Border.all(
                              color: const Color(0xFFBCE6D5),
                              width: 2,
                            ),
                          ),

                          child: const Icon(
                            Icons.favorite_border,
                            color: green,
                            size: 30,
                          ),
                        ),

                        const SizedBox(width: 12),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                '85 %',
                                style: TextStyle(
                                  color: green,
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const Text(
                                'Taux de prise effective',
                                style: TextStyle(
                                  fontSize: 9,
                                  color: Color.fromARGB(255, 21, 31, 28),
                                ),
                              ),

                              const SizedBox(height: 7),

                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),

                                child: const LinearProgressIndicator(
                                  value: 0.85,
                                  minHeight: 5,
                                  backgroundColor: Color(0xFFEAF0ED),
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    green,
                                  ),
                                ),
                              ),

                              const SizedBox(height: 4),

                              const Text(
                                '85 / 100 prises',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: textColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15),
            ],
          ),
        ),
      ),

      // 7. BOTTOM NAVIGATION - DESIGN MODIFIE
      bottomNavigationBar: SafeArea(
        top: false,
        child: Container(
          margin: const EdgeInsets.fromLTRB(8, 0, 8, 8),
          padding: const EdgeInsets.symmetric(vertical: 4),

          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(Icons.home_outlined, 'Accueil', 0),

              _buildNavItem(Icons.medication_outlined, 'Médicament', 1),

              _buildNavItem(Icons.calendar_month_outlined, 'Historique', 2),

              _buildNavItem(Icons.person_outline, 'Profil', 3),
            ],
          ),
        ),
      ),
    );
  }

  // FUNCTION : BOTTOM NAVIGATION ITEM

  Widget _buildNavItem(IconData icon, String label, int index) {
    bool isSelected = selectedIndex == index;

    return Expanded(
      child: InkWell(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },

        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: green, size: 17),

            Text(
              label,
              style: const TextStyle(fontSize: 7, color: Colors.black),
            ),

            const SizedBox(height: 2),

            Container(
              height: 2,
              width: 25,
              color: isSelected ? green : Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }

  // FUNCTION : CARTE FONCTIONNALITE

  Widget _featureCard(
    IconData icon,
    String title,
    String subtitle, {
    Color iconColor = green,
  }) {
    return Container(
      height: 72,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),

      child: Row(
        children: [
          Icon(icon, color: iconColor, size: 19),

          const SizedBox(width: 6),

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,

                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,

                  style: const TextStyle(fontSize: 8, color: textColor),
                ),
              ],
            ),
          ),

          const Icon(Icons.chevron_right, color: darkGreen, size: 17),
        ],
      ),
    );
  }

  // FUNCTION : MODE SENIOR

  Widget _seniorCard() {
    return Container(
      height: 72,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),

      child: Row(
        children: [
          const Icon(Icons.accessibility_new, color: green, size: 19),

          const SizedBox(width: 5),

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: const [
                Text(
                  'Mode Senior',
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),

                SizedBox(height: 4),

                Text(
                  'Interface simplifiée',
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 140, 143, 142),
                  ),
                ),
              ],
            ),
          ),

          Transform.scale(
            scale: 0.7,

            child: Switch(
              value: seniorMode,
              activeColor: green,

              onChanged: (value) {
                setState(() {
                  seniorMode = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
