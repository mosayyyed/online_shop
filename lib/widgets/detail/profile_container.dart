import 'package:flutter/material.dart';

class ProfileContainer extends StatelessWidget {
  const ProfileContainer({
    super.key,
    required this.name,
    required this.frontIcon,
    this.backColor = const Color(0xFFF7FFFB), // اللون الافتراضي للخلفية
    this.borderColor = Colors.transparent, // لون الحدود الافتراضي
  });

  final String name;
  final IconData frontIcon;
  final Color backColor; // متغير لتخصيص لون الخلفية
  final Color borderColor; // متغير لتخصيص لون الحدود

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20), // تحسين الحشو
      margin: const EdgeInsets.symmetric(vertical: 8), // تحسين الهوامش
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30), // جعل الحواف أكثر انحناءً
        color: backColor,
        border: Border.all(
            color: borderColor, width: 1), // إضافة حدود قابلة للتخصيص
        boxShadow: [
          BoxShadow(
            color: Colors.black
                .withOpacity(0.1), // ظل خفيف لجعل التصميم أكثر عمقًا
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start, // محاذاة المحتوى إلى اليسار
        children: [
          Icon(frontIcon,
              size: 30, color: const Color(0xFF4F5652)), // حجم الأيقونة أكبر
          const SizedBox(width: 15), // زيادة المسافة بين الأيقونة والنص
          Expanded(
            // جعل النص يأخذ المساحة المتبقية
            child: Text(
              name,
              style: const TextStyle(
                fontSize: 18, // زيادة حجم النص
                fontWeight: FontWeight.w600, // جعل النص أكثر وضوحًا
                color: Color(0xFF4F5652),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
