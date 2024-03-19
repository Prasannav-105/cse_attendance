class AbsentiesHelper {
  static int noOfStudents = 90;
  static List<bool> studentCount = List.generate(noOfStudents, (index) => true);

  static List<String> registerNo = List.generate(
      noOfStudents,
      (index) =>
          index < 9 ? "82042110400${index + 1}" : "8204211040${index + 1}");

  static List<bool> status = List.generate(noOfStudents, (index) => true);
  static List<int> absenties = [];

  static String appbarTitleText = "NO OF ABSENTIES : ";
  static String titleText = "Absenties Register Numbers : ";
  static String markAttendanceText = "Please Mark Attendance ";
}
