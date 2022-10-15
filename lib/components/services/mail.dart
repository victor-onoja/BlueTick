import 'dart:convert';
import 'package:http/http.dart' as http;

Future sendEmail({
  // required String name,
  required String email,
  // required String subject,
  required String message,
  required String title,
}) async {
  final serviceId = 'service_z8tyt5n';
  final templateId = 'template_s8wyior';
  final userId = 'RLZJl-9aapjcOeLYo';

  var url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
  try {
    var response = await http.post(url,
        headers: {
          'origin': 'http://localhost',
          'Content-Type': 'application/json'
        },
        body: json.encode({
          'service_id': serviceId,
          'template_id': templateId,
          'user_id': userId,
          'template_params': {
            'message': message,
            'email': email,
            'title': title,
          }
        }));
    print(response.body);
  } catch (ex) {
    print(ex);
  }
}
