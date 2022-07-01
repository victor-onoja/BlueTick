Map<String, dynamic> profileItems = {
  'id0': {
    'profile_name': 'Fredrick Drey',
    'profile_pic': 'assets/images/Ellipse 10.png',
    'isAdmin': true,
    'status': 'Online',
    'check': false,
    'isColor': true
  },
  'id1': {
    'profile_name': 'Bethie Drey',
    'profile_pic': 'assets/images/Ellipse 10(1).png',
    'isAdmin': false,
    'status': 'Online',
    'check': false,
    'isColor': true
  },
  'id2': {
    'profile_name': 'Lisa Mo',
    'profile_pic': 'assets/images/Ellipse 10(2).png',
    'isAdmin': false,
    'status': 'Online',
    'check': false,
    'isColor': true
  },
  'id3': {
    'profile_name': 'Vera McBerth',
    'profile_pic': 'assets/images/Ellipse 10(3).png',
    'isAdmin': false,
    'status': 'Online',
    'check': false,
    'isColor': true
  },
  'id4': {
    'profile_name': 'Tim So',
    'profile_pic': 'assets/images/Ellipse 10(4).png',
    'isAdmin': false,
    'status': 'Online',
    'check': false,
    'isColor': true
  },
  'id5': {
    'profile_name': 'Dera Seth',
    'profile_pic': 'assets/images/Ellipse 10(5).png',
    'isAdmin': false,
    'status': 'Offline',
    'check': false,
    'isColor': true
  },
  'id6': {
    'profile_name': 'Oh Chin',
    'profile_pic': 'assets/images/Ellipse 10(6).png',
    'isAdmin': false,
    'status': 'Offline',
    'check': false,
    'isColor': true
  },
  'id7': {
    'profile_name': 'Garry Tia',
    'profile_pic': 'assets/images/Ellipse 10(12).png',
    'isAdmin': false,
    'status': 'Offline',
    'check': false,
    'isColor': true
  },
  'id8': {
    'profile_name': 'Briah Manuel',
    'profile_pic': 'assets/images/Ellipse 10(7).png',
    'isAdmin': false,
    'status': 'Offline',
    'check': false,
    'isColor': false
  },
  'id9': {
    'profile_name': 'Lina Atare',
    'profile_pic': 'assets/images/Ellipse 10(8).png',
    'isAdmin': false,
    'status': 'Offline',
    'check': false,
    'isColor': false
  }
};

Map<String, dynamic> messageListItem = {
  'id0': {
    'profile_pic': 'assets/images/Ellipse 10(9).png',
    'name': 'Fredrick Drey',
    'message': 'General briefing is rescheduled for 10am..',
    'isAdmin': true,
    'isCheck': false
  },
  'id1': {
    'profile_pic': 'assets/images/Ellipse 10(10).png',
    'name': 'Bethie Drey',
    'message': 'Please check your email for confirmation',
    'isAdmin': false,
    'isCheck': false
  },
  'id2': {
    'profile_pic': 'assets/images/group.png',
    'name': 'Design group 2',
    'message': 'Vera: Let\'s just revisit it',
    'isAdmin': false,
    'isCheck': false
  },
  'id3': {
    'profile_pic': 'assets/images/Ellipse 10(12).png',
    'name': 'Fredrick Drey',
    'message': 'Warm Regards',
    'isAdmin': true,
    'isCheck': false
  },
  'id4': {
    'profile_pic': 'assets/images/Ellipse 10(13).png',
    'name': 'Vera McBerth',
    'message': 'Alrights, thanks for the insight',
    'isAdmin': false,
    'isCheck': false
  },
  'id5': {
    'profile_pic': 'assets/images/Ellipse 10(14).png',
    'name': 'Tim So',
    'message': 'Yes, please',
    'isAdmin': false,
    'isCheck': false
  },
  'id6': {
    'profile_pic': 'assets/images/Ellipse 10(15).png',
    'name': 'Dera Seth',
    'message': 'I will forward it now',
    'isAdmin': false,
    'isCheck': false
  },
};
String adminStatus(Map item, int index) {
  if (item['id$index']['isAdmin'] == true) {
    return 'Admin';
  }
  return '';
}


