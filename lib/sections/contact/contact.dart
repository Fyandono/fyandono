import 'package:flutter/material.dart';
import 'package:fyandono/widgets/text_field.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fyandono/colors/colors.dart';
import 'package:fyandono/widgets/text.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final TextEditingController _controller = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> _sendWhatsApp() async {
    if (formKey.currentState?.validate() == true) {
      final text = Uri.encodeComponent(_controller.text);
      const phone = "6287730301050";
      final url = Uri.parse("https://wa.me/$phone?text=$text");
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      }
      _controller.clear();
    }
  }

  Future<void> _sendEmail() async {
    if (formKey.currentState?.validate() == true) {
      final text = Uri.encodeComponent(_controller.text);
      const email = "riva.alifyandono@gmail.com";
      final url = Uri.parse(
        "mailto:$email?subject=Portfolio Contact&body=$text",
      );
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      }
      _controller.clear();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String? validator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please insert some message";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyText(text: "Contact Me", fontSize: isMobile ? 36 : 56),
                const SizedBox(height: 16),
                MyText(
                  text: "Let's collaborate or just say hi 👋",
                  fontSize: isMobile ? 16 : 20,
                  color: AppColors.grey1000,
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: MyTextField(
                    label: "Type your message here...",
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    controller: _controller,
                    validator: validator,
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: _sendWhatsApp,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.grey100,
                        foregroundColor: AppColors.grey100,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      icon: Image.asset("assets/logo/whatsapp.png", height: 16),
                      label: const MyText(
                        text: "WhatsApp",
                        fontSize: 16,
                        color: AppColors.grey1000,
                      ),
                    ),
                    const SizedBox(width: 16),
                    ElevatedButton.icon(
                      onPressed: _sendEmail,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.grey100,
                        foregroundColor: AppColors.grey100,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      icon: Image.asset("assets/logo/gmail.png", height: 16),
                      label: const MyText(
                        text: "Email",
                        fontSize: 16,
                        color: AppColors.grey1000,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
