class ApiLink {
  static const String baseURL = 'http://localhost:8000';
  //====================== CONCOLUATION URL =========================//
  static const String getConcoluationURL = '$baseURL/getConcluction.php';
  //====================== DEPARTMENT URL =========================//
  static const String viewDepartmentURL = '$baseURL/department/viewDepartment.php';
  static const String addDepartmentURL = '$baseURL/department/addNewDepartment.php';
  static const String updateDepartmentURL = '$baseURL/department/updateDepartment.php';
  static const String deleteDepartmentURL = '$baseURL/department/deleteDepartment.php';
  // ======================= AUTH URL =========================//
  static const String loginURL = '$baseURL/auth/loginAdmin.php';
  // ======================= PRODUCT URL =========================//
  static const String viewAllProductURL = '$baseURL/product/getAllProduct.php';
}
