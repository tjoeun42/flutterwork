void main() {
  Map<String, String> students = {
    '20250001' : '강형원',
    '20250002' : '양시열',
    '20250003' : '송예림'
  };
  print(students);
  print(students['20250002']);

  students.addAll({'20250004':'남궁용진'});
  print(students);

  students['20250004'] = '트와이스';
  print(students);

  students.remove('20250003');
  print(students);

  print('keys : ${students.keys}');
  print('values : ${students.values}');
}