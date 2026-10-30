import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; //  زر رابط الديسكورد
import 'registration_page.dart'; //  صفحة التسجيل

void main() {
  runApp(const HackathonApp());
}

class HackathonApp extends StatelessWidget {
  const HackathonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Replit Hackathon',
      theme: ThemeData(fontFamily: 'Arial'),
      home: const Directionality(
        textDirection: TextDirection.rtl,
        child: HackathonHomePage(),
      ),
    );
  }
}

class HackathonHomePage extends StatefulWidget {
  const HackathonHomePage({super.key});

  @override
  State<HackathonHomePage> createState() => _HackathonHomePageState();
}

class _HackathonHomePageState extends State<HackathonHomePage> {
  //ربط الشريط اللي فوق بالاقسام
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _targetAudienceKey = GlobalKey();
  final GlobalKey _stagesKey = GlobalKey();
  final GlobalKey _participateKey = GlobalKey();
  final GlobalKey _locationKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(0.0, -0.3),
            radius: 1.2,
            colors: [Color(0xFF4A3470), Color(0xFF2F264D), Color(0xFF1E1735)],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 25),

                // 1. الشريط الزجاجي العلوي
                Center(
                  child: GlassNavbar(
                    onNavTap: (index) {
                      switch (index) {
                        case 0:
                          _scrollToSection(_homeKey);
                          break;
                        case 1:
                          _scrollToSection(_aboutKey);
                          break;
                        case 2:
                          _scrollToSection(_targetAudienceKey);
                          break;
                        case 3:
                          _scrollToSection(_stagesKey);
                          break;
                        case 4:
                          _scrollToSection(_participateKey);
                          break;
                        case 5:
                          _scrollToSection(_locationKey);
                          break;
                      }
                    },
                  ),
                ),

                const SizedBox(height: 70),

                // 2. البداية
                FadeInUpWidget(
                  key: _homeKey,
                  delayMilliseconds: 100,
                  child: const Text(
                    'هاكثون Replit',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.1,
                    ),
                  ),
                ),

                const SizedBox(height: 35),

                // 3. قسم الشعارات
                const FadeInUpWidget(
                  delayMilliseconds: 300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingLogo(
                        imagePath: 'assets/tuwaiq_logo.jpeg',
                        fallbackPath: 'assets/tuwaiq_logo.jpg',
                        height: 125,
                      ),
                      SizedBox(width: 50),
                      FloatingLogo(
                        imagePath: 'assets/replit_logo.jpeg',
                        fallbackPath: 'assets/replit_logo.jpg',
                        height: 125,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 50),

                // 4. الزر   (للتسجيل)
                const FadeInUpWidget(
                  delayMilliseconds: 500,
                  child: GlassButton(),
                ),

                const SizedBox(height: 90),

                // 5. عن الهاكاثون
                FadeInUpWidget(
                  key: _aboutKey,
                  delayMilliseconds: 600,
                  child: const AboutHackathonCard(),
                ),

                const SizedBox(height: 90),

                // 6. الفئة المستهدفة
                FadeInUpWidget(
                  key: _targetAudienceKey,
                  delayMilliseconds: 700,
                  child: const TargetAudienceSection(),
                ),

                const SizedBox(height: 90),

                // 7. مراحل الهاكاثون
                FadeInUpWidget(
                  key: _stagesKey,
                  delayMilliseconds: 800,
                  child: const HackathonStagesSection(),
                ),

                const SizedBox(height: 90),

                // 8. كيف تشارك؟
                FadeInUpWidget(
                  key: _participateKey,
                  delayMilliseconds: 900,
                  child: const HowToParticipateSection(),
                ),

                const SizedBox(height: 90),

                // 9. الموعد والمكان
                FadeInUpWidget(
                  key: _locationKey,
                  delayMilliseconds: 1000,
                  child: const LocationAndTimeSection(),
                ),

                const SizedBox(height: 90),

                // 10. قسم الشعارات
                const FadeInUpWidget(
                  delayMilliseconds: 1100,
                  child: LogosSection(),
                ),

                const SizedBox(height: 60),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// 10. قسم الشعارات
class LogosSection extends StatelessWidget {
  const LogosSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 1050),
      margin: const EdgeInsets.symmetric(horizontal: 24),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(28),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 40),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.06),
              borderRadius: BorderRadius.circular(28),
              border: Border.all(
                color: Colors.white.withOpacity(0.18),
                width: 1.2,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                FooterLogoItem(
                  imagePath: 'assets/tuwaiq_logo.jpeg',
                  fallbackText: 'Tuwaiq Club',
                ),
                FooterLogoItem(
                  imagePath: 'assets/replit_logo.jpeg',
                  fallbackText: 'Replit',
                ),
                FooterLogoItem(
                  imagePath: 'assets/imam_logo.jpeg',
                  fallbackText: 'الإمام',
                ),
                FooterLogoItem(
                  imagePath: 'assets/ksu_logo.jpeg',
                  fallbackText: 'الملك سعود',
                ),
                FooterLogoItem(
                  imagePath: 'assets/pnu_logo.jpeg',
                  fallbackText: 'نورة',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FooterLogoItem extends StatelessWidget {
  final String imagePath;
  final String fallbackText;

  const FooterLogoItem({
    super.key,
    required this.imagePath,
    required this.fallbackText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: Image.asset(
        imagePath,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) {
          return Center(
            child: Text(
              fallbackText,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      ),
    );
  }
}

class LocationAndTimeSection extends StatelessWidget {
  const LocationAndTimeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 920),
      margin: const EdgeInsets.symmetric(horizontal: 24),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(28),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 48),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.06),
              borderRadius: BorderRadius.circular(28),
              border: Border.all(
                color: Colors.white.withOpacity(0.18),
                width: 1.2,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'الموعد والمكان',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 38,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.8,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'المرحلة الحضورية',
                  style: TextStyle(
                    color: Color(0xFF80E3D7),
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 18),
                const Text(
                  'الرياض - أكاديمية طويق',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 14),
                const Text(
                  '12-14 نوفمبر',
                  style: TextStyle(
                    color: Color(0xFFE2B770),
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HowToParticipateSection extends StatelessWidget {
  const HowToParticipateSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 960),
      margin: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Align(
            alignment: Alignment.centerRight,
            child: Text(
              'كيف تشارك؟',
              style: TextStyle(
                color: Colors.white,
                fontSize: 42,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.8,
              ),
            ),
          ),
          const SizedBox(height: 35),

          const Wrap(
            spacing: 20,
            runSpacing: 25,
            alignment: WrapAlignment.center,
            children: [
              ParticipationCard(
                stepNumber: '01',
                title: 'أنشئ حسابك',
                description:
                    'أدخل بياناتك عبر البوابة لإتمام التسجيل بكل سهولة.',
              ),
              ParticipationCard(
                stepNumber: '02',
                title: 'شكل فريقك',
                description:
                    'ادع فريقك عبر المنصة، أو انضم لفرق تبحث عن مهاراتك.',
                hasDiscordButton: true,
              ),
              ParticipationCard(
                stepNumber: '03',
                title: 'قدم فكرتك',
                description: 'ارفع ملف فكرتك لحل إحدى التحديات المطروحة.',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ParticipationCard extends StatefulWidget {
  final String stepNumber;
  final String title;
  final String description;
  final bool hasDiscordButton;

  const ParticipationCard({
    super.key,
    required this.stepNumber,
    required this.title,
    required this.description,
    this.hasDiscordButton = false,
  });

  @override
  State<ParticipationCard> createState() => _ParticipationCardState();
}

class _ParticipationCardState extends State<ParticipationCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTapDown: (_) => setState(() => isHovered = true),
        onTapUp: (_) => setState(() => isHovered = false),
        onTapCancel: () => setState(() => isHovered = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
          width: 290,
          height: 310,
          transform: Matrix4.identity()
            ..translate(0.0, isHovered ? -10.0 : 0.0, 0.0)
            ..scale(isHovered ? 1.025 : 1.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 26,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(isHovered ? 0.12 : 0.06),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: Colors.white.withOpacity(isHovered ? 0.45 : 0.18),
                    width: isHovered ? 1.8 : 1.2,
                  ),
                  boxShadow: isHovered
                      ? [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.12),
                            blurRadius: 22,
                            spreadRadius: 1,
                            offset: const Offset(0, 10),
                          ),
                        ]
                      : [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      widget.stepNumber,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      widget.description,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.85),
                        fontSize: 16,
                        height: 1.6,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    if (widget.hasDiscordButton) ...[
                      const Spacer(),
                      const DiscordButton(),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DiscordButton extends StatefulWidget {
  const DiscordButton({super.key});

  @override
  State<DiscordButton> createState() => _DiscordButtonState();
}

class _DiscordButtonState extends State<DiscordButton> {
  bool isHovered = false;

  Future<void> _launchDiscord() async {
    final Uri url = Uri.parse('https://discord.gg/b4mSF6ECe');
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: _launchDiscord,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: const Color(0xFF5865F2).withOpacity(isHovered ? 0.9 : 0.7),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.white.withOpacity(0.3), width: 1),
            boxShadow: isHovered
                ? [
                    BoxShadow(
                      color: const Color(0xFF5865F2).withOpacity(0.5),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : [],
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.discord, color: Colors.white, size: 20),
              SizedBox(width: 8),
              Text(
                'كون فريقك',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TargetAudienceSection extends StatelessWidget {
  const TargetAudienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'الفئة المستهدفة',
          style: TextStyle(
            color: Colors.white,
            fontSize: 34,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.8,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'طلاب وطالبات الجامعات التالية',
          style: TextStyle(
            color: Color(0xFF80E3D7),
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 40),

        const Wrap(
          spacing: 25,
          runSpacing: 25,
          alignment: WrapAlignment.center,
          children: [
            UniversityCard(
              title: 'جامعة الإمام',
              imagePath: 'assets/imam_logo.jpeg',
              fallbackPath: 'assets/imam_logo.jpg',
            ),
            UniversityCard(
              title: 'جامعة الملك سعود',
              imagePath: 'assets/ksu_logo.jpeg',
              fallbackPath: 'assets/ksu_logo.jpg',
            ),
            UniversityCard(
              title: 'جامعة الأميرة نورة',
              imagePath: 'assets/pnu_logo.jpeg',
              fallbackPath: 'assets/pnu_logo.jpg',
            ),
          ],
        ),
      ],
    );
  }
}

class UniversityCard extends StatefulWidget {
  final String title;
  final String imagePath;
  final String fallbackPath;

  const UniversityCard({
    super.key,
    required this.title,
    required this.imagePath,
    required this.fallbackPath,
  });

  @override
  State<UniversityCard> createState() => _UniversityCardState();
}

class _UniversityCardState extends State<UniversityCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTapDown: (_) => setState(() => isHovered = true),
        onTapUp: (_) => setState(() => isHovered = false),
        onTapCancel: () => setState(() => isHovered = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
          width: 240,
          height: 160,
          transform: Matrix4.identity()
            ..translate(0.0, isHovered ? -10.0 : 0.0, 0.0)
            ..scale(isHovered ? 1.05 : 1.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: isHovered
                      ? Colors.white.withOpacity(0.14)
                      : Colors.white.withOpacity(0.06),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: isHovered
                        ? Colors.white.withOpacity(0.5)
                        : Colors.white.withOpacity(0.2),
                    width: isHovered ? 2.0 : 1.2,
                  ),
                  boxShadow: isHovered
                      ? [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.12),
                            blurRadius: 25,
                            spreadRadius: 1,
                            offset: const Offset(0, 10),
                          ),
                        ]
                      : [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.12),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ],
                ),
                child: Center(
                  child: Image.asset(
                    widget.imagePath,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        widget.fallbackPath,
                        fit: BoxFit.contain,
                        errorBuilder: (c, e, s) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.account_balance_rounded,
                                color: Colors.white70,
                                size: 42,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                widget.title,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HackathonStagesSection extends StatelessWidget {
  const HackathonStagesSection({super.key});

  final stages = const [
    {"step": "1", "title": "التسجيل", "date": "من 1 إلى 6 نوفمبر"},
    {"step": "2", "title": "التصفية الأولية", "date": "7 و 8 نوفمبر"},
    {"step": "3", "title": "الورش", "date": "9 و 10 نوفمبر"},
    {
      "step": "4",
      "title": "التصفية للمرحلة الحضورية",
      "date": "11 نوفمبر، عن بعد",
    },
    {
      "step": "5",
      "title": "المرحلة الحضورية والبناء",
      "date": "من 12 إلى 14 نوفمبر",
    },
    {"step": "6", "title": "اليوم الختامي والتحكيم", "date": "14 نوفمبر"},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 920),
      margin: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Align(
            alignment: Alignment.centerRight,
            child: Text(
              'مراحل الهاكاثون',
              style: TextStyle(
                color: Colors.white,
                fontSize: 42,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.8,
              ),
            ),
          ),
          const SizedBox(height: 35),

          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: stages.length,
            itemBuilder: (context, index) {
              final isLast = index == stages.length - 1;
              final stage = stages[index];

              return IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 38,
                          height: 38,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.transparent,
                            border: Border.all(
                              color: const Color(0xFF8AE8ED),
                              width: 2.0,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              stage["step"]!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        if (!isLast)
                          Expanded(
                            child: Container(
                              width: 2,
                              color: const Color(0xFF8AE8ED).withOpacity(0.5),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(width: 25),

                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: StageCard(
                          title: stage["title"]!,
                          date: stage["date"]!,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class StageCard extends StatefulWidget {
  final String title;
  final String date;

  const StageCard({super.key, required this.title, required this.date});

  @override
  State<StageCard> createState() => _StageCardState();
}

class _StageCardState extends State<StageCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTapDown: (_) => setState(() => isHovered = true),
        onTapUp: (_) => setState(() => isHovered = false),
        onTapCancel: () => setState(() => isHovered = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
          transform: Matrix4.identity()
            ..translate(0.0, isHovered ? -6.0 : 0.0, 0.0)
            ..scale(isHovered ? 1.015 : 1.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                padding: const EdgeInsets.symmetric(
                  horizontal: 28,
                  vertical: 20,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(isHovered ? 0.10 : 0.06),
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: Colors.white.withOpacity(isHovered ? 0.35 : 0.18),
                    width: 1.2,
                  ),
                  boxShadow: isHovered
                      ? [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 18,
                            offset: const Offset(0, 8),
                          ),
                        ]
                      : [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      widget.date,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.75),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AboutHackathonCard extends StatefulWidget {
  const AboutHackathonCard({super.key});

  @override
  State<AboutHackathonCard> createState() => _AboutHackathonCardState();
}

class _AboutHackathonCardState extends State<AboutHackathonCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTapDown: (_) => setState(() => isHovered = true),
        onTapUp: (_) => setState(() => isHovered = false),
        onTapCancel: () => setState(() => isHovered = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
          margin: const EdgeInsets.symmetric(horizontal: 24),
          constraints: const BoxConstraints(maxWidth: 920),
          transform: Matrix4.identity()
            ..translate(0.0, isHovered ? -12.0 : 0.0, 0.0)
            ..scale(isHovered ? 1.02 : 1.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(28),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: const EdgeInsets.symmetric(
                  horizontal: 42,
                  vertical: 36,
                ),
                decoration: BoxDecoration(
                  color: isHovered
                      ? Colors.white.withOpacity(0.12)
                      : Colors.white.withOpacity(0.06),
                  borderRadius: BorderRadius.circular(28),
                  border: Border.all(
                    color: isHovered
                        ? Colors.white.withOpacity(0.5)
                        : Colors.white.withOpacity(0.2),
                    width: isHovered ? 2.0 : 1.2,
                  ),
                  boxShadow: isHovered
                      ? [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.12),
                            blurRadius: 30,
                            spreadRadius: 2,
                            offset: const Offset(0, 12),
                          ),
                        ]
                      : [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 15,
                            offset: const Offset(0, 5),
                          ),
                        ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'عن الهاكاثون',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.8,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'بشراكة استراتيجية من نادي طويق مع منصة Replit العالمية، ينطلق هاكاثون ريبليت بنسخته الأولى كأول حدث تنافسي يجمع بين الجامعات تحويلاً للأفكار التقنية المبتكرة إلى مشاريع ريادية حقيقية تقتحم السوق.',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.92),
                        fontSize: 20,
                        height: 1.8,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FadeInUpWidget extends StatelessWidget {
  final Widget child;
  final int delayMilliseconds;

  const FadeInUpWidget({
    super.key,
    required this.child,
    this.delayMilliseconds = 0,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0.0, end: 1.0),
      duration: Duration(milliseconds: 800 + delayMilliseconds),
      curve: Curves.easeOutCubic,
      builder: (context, value, childWidget) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, 30 * (1 - value)),
            child: childWidget,
          ),
        );
      },
      child: child,
    );
  }
}

class FloatingLogo extends StatefulWidget {
  final String imagePath;
  final String fallbackPath;
  final double height;

  const FloatingLogo({
    super.key,
    required this.imagePath,
    required this.fallbackPath,
    this.height = 120,
  });

  @override
  State<FloatingLogo> createState() => _FloatingLogoState();
}

class _FloatingLogoState extends State<FloatingLogo> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
        transform: Matrix4.identity()
          ..translate(0.0, isHovered ? -12.0 : 0.0, 0.0)
          ..scale(isHovered ? 1.08 : 1.0),
        child: Image.asset(
          widget.imagePath,
          height: widget.height,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) {
            return Image.asset(
              widget.fallbackPath,
              height: widget.height,
              fit: BoxFit.contain,
              errorBuilder: (c, e, s) => const Icon(
                Icons.broken_image,
                color: Colors.white54,
                size: 60,
              ),
            );
          },
        ),
      ),
    );
  }
}

// شريط السريع
class GlassNavbar extends StatelessWidget {
  final Function(int) onNavTap;

  const GlassNavbar({super.key, required this.onNavTap});

  final List<String> navItems = const [
    "الرئيسية",
    "عن الهاكثون",
    "الفئة المستهدفة",
    "مراحل الهاكاثون",
    "كيف تشارك",
    "الموعد و المكان",
  ];

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(40),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.08),
            borderRadius: BorderRadius.circular(40),
            border: Border.all(color: Colors.white.withOpacity(0.2)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(navItems.length, (index) {
              return HoverNavItem(
                title: navItems[index],
                onTap: () => onNavTap(index),
              );
            }),
          ),
        ),
      ),
    );
  }
}

class HoverNavItem extends StatefulWidget {
  final String title;
  final VoidCallback onTap;

  const HoverNavItem({super.key, required this.title, required this.onTap});

  @override
  State<HoverNavItem> createState() => _HoverNavItemState();
}

class _HoverNavItemState extends State<HoverNavItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: isHovered
                ? Colors.white.withOpacity(0.2)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text(
            widget.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

// زر التسجيل الرئيسي
class GlassButton extends StatefulWidget {
  const GlassButton({super.key});

  @override
  State<GlassButton> createState() => _GlassButtonState();
}

class _GlassButtonState extends State<GlassButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const RegistrationPage()),
          );
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
          transform: Matrix4.translationValues(0, isHovered ? -6 : 0, 0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                padding: const EdgeInsets.symmetric(
                  horizontal: 44,
                  vertical: 14,
                ),
                decoration: BoxDecoration(
                  color: isHovered
                      ? const Color(0xFF7B2CBF).withOpacity(0.4)
                      : Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: isHovered
                        ? const Color(0xFF9D4EDD)
                        : Colors.white.withOpacity(0.3),
                    width: 2,
                  ),
                  boxShadow: isHovered
                      ? [
                          BoxShadow(
                            color: const Color(0xFF9D4EDD).withOpacity(0.4),
                            blurRadius: 20,
                            offset: const Offset(0, 8),
                          ),
                        ]
                      : [],
                ),
                child: const Text(
                  'سجل الآن',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
