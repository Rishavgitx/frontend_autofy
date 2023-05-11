import 'package:flutter/material.dart';
import 'bottom_nav.dart';

class Policy_Page extends StatefulWidget {
  @override
  State<Policy_Page> createState() => _Policy_Page();
}

class _Policy_Page extends State<Policy_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 140,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        title: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Image.asset(
                'assets/images/logo-blue-axi.png',
                width: 200,
                height: 120,
              ),
            ),
            Text(
              'Privacy Policy',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: Policy_Page1(),
      bottomNavigationBar: BottomNav(),
    );
  }
}

class Policy_Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 80),
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'AutoFy ("App") is committed to protecting your privacy. This Privacy Policy explains how we collect, use, disclose, and safeguard your personal information when you use our App.',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'If you have any questions or concerns about this Privacy Policy, please contact us at HariSudhan - 9790596648',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  '1. Information We Collect:\nWe collect the following types of personal information from you when you use the App:',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  '- Name\n- Contact Information (phone number, email address)\n- Roll No\n- Profile picture\n- Reviews or feedback\n- GPS location data\n- Transaction details',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  '2. How We Use Your Information:\nWe use your personal information to operate, maintain, and improve the App, and to provide you with a better user experience. Specifically, we may use your information to:',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              '- Connect you with other Users for ride-sharing purposes\n- Process and track ride payments\n- Communicate with you about the App, including promotions and updates\n- Respond to your inquiries or requests\n- Personalize your user experience\n- Improve the Apps functionality and features\n - Enforce our User Agreement and other policies\n- Comply with legal obligations',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  '3. How We Share Your Information:\nWe may share your personal information with third parties for the following purposes:',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  '- To facilitate ride-sharing between Users\n- To process ride payments through third-party payment processors\n- To comply with legal obligations, such as responding to court orders or government requests\n- To protect our rights or property, or the safety of our Users\n- With your consent',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'We may also share your personal information with our affiliates or subsidiaries for the purposes of operating or improving the App.',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  '5. Your Choices:\nYou may choose not to provide certain personal information,although this may limit your ability to use certain features of the App.You may also disable location services on your device, although this may affect the Apps functionality.',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  '5. Your Choices:\nYou may choose not to provide certain personal information,although this may limit your ability to use certain features of the App.You may also disable location services on your device, although this may affect the Apps functionality.',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'You may opt-out of receiving promotional communications from us by following the instructions in the communication. You may not opt-out of receiving transactional or service-related communications.',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  '6. Data Retention:\nWe retain your personal information for as long as necessary to fulfill the purposes for which it was collected, or as required by law.',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  '7. Children Privacy:\nThe App is not intended for children under 18 years of age. We do not knowingly collect personal information from children under 18. If you are a parent or guardian and believe that your child has provided us with personal information, please contact us immediately.',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  '8. Changes to This Policy:\nWe may update this Privacy Policy from time to time by posting a new version on our website or within the App. Your continued use of the App after such changes constitutes your acceptance of the revised Privacy Policy.',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  '9. Contact Us:\nIf you have any questions or concerns about this Privacy Policy or our data practices, please contact us at HariSudhan - 9790596648',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
