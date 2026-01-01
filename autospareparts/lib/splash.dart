import 'package:auto_space/root.dart';
import 'package:flutter/material.dart';
import 'core/constants/app_color.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashState();
}

class _SplashState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _fadeAnimation;
  Animation<Offset>? _slideAnimation;
  Animation<double>? _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller!,
      curve: Curves.easeIn,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller!,
        curve: Curves.easeOut,
      ),
    );

    _scaleAnimation = Tween<double>(
      begin: 0.92,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _controller!,
        curve: Curves.easeOutBack,
      ),
    );

    _controller!.forward();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.DeepDarkBlue,
        body: Stack(
          children: [
            // ================= TOP IMAGE =================
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.65,
              
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.DeepDarkBlue.withOpacity(0.35),
                      AppColors.DeepDarkBlue.withOpacity(0.95),
                    ],
                  ),
                ),
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(22),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.06),
                    ),
                    child: Image.asset(
                      'assets/logo.jpg',
                      width: 120,
                      height: 120,
                      color: Colors.white.withOpacity(0.35),
                      colorBlendMode: BlendMode.srcATop,
                    ),
                  ),
                ),
              ),
            ),

            // ================= BOTTOM CARD =================
            Align(
              alignment: Alignment.bottomCenter,
              child: FadeTransition(
                opacity: _fadeAnimation!,
                child: SlideTransition(
                  position: _slideAnimation!,
                  child: ScaleTransition(
                    scale: _scaleAnimation!,
                    child: Container(
                      padding:
                          const EdgeInsets.fromLTRB(32, 45, 32, 45),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            blurRadius: 25,
                            offset: const Offset(0, -8),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // ---------- TITLE ----------
                          Text(
                            'Monza',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: AppColors.DeepDarkBlue,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'لإدارة المخزون',
                            style: TextStyle(
                              fontSize: 18,
                              color: AppColors.BlueGray,
                              fontWeight: FontWeight.w500,
                            ),
                          ),

                          const SizedBox(height: 18),

                          // ---------- DESCRIPTION ----------
                          Text(
                            'مرحبًا بك في الحل الأمثل لأصحاب المتاجر.\n'
                            'تحكم في كل ما يخص متجرك من مكان واحد وبسهولة تامة.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                              color: AppColors.DeepDarkBlue,
                              height: 1.6,
                            ),
                          ),

                          const SizedBox(height: 18),

                          

                          // ---------- BUTTON ----------
                          SizedBox(
                            width: double.infinity,
                            height: 60,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => Root(),
                                  ),
                                );
                              },
                              icon:
                                  const Icon(Icons.arrow_back_ios_new),
                              label: const Text(
                                'ابدأ الآن',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    AppColors.DeepDarkBlue,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(30),
                                ),
                                elevation: 6,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
