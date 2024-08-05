class CalculatorRepository {
  double calculateSgpa(List<int> credits, List<String> grades) {
    double gradePoints = 0.0;
    int creditsTaken = 0;

    List<int> gradesConverted = gradeConverter(grades);
    for (int i = 0; i < credits.length; i++) {
      gradePoints = gradePoints + credits[i] * gradesConverted[i];
      creditsTaken = creditsTaken + credits[i];
    }

    return gradePoints / creditsTaken;
  }

  double calculateCgpa(List<int> credits, List<double> sgpa) {
    double totalCredits = 0;
    double totalGradePoint = 0.0;
    for (int i = 0; i < credits.length; i++) {
      totalGradePoint = totalGradePoint + (credits[i] * sgpa[i]);
      totalCredits = totalCredits + credits[i];
    }
    return totalGradePoint / totalCredits;
  }
}

List<int> gradeConverter(List<String> grades) {
  Map<String, int> gradeMap = {
    'O': 10,
    'A+': 9,
    'A': 8,
    'B+': 7,
    'B': 6,
    'C': 5,
    'P': 4,
  };

  List<int> finalGrades = [];
  for (String grade in grades) {
    finalGrades.add(gradeMap[grade] ?? 0);
  }
  return finalGrades;
}
