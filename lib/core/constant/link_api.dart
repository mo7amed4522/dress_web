class ApiLink {
  static const String baseURL = 'http://localhost:8000';
  //====================== DEPARTMENT URL =========================//
  static const String viewDepartmentURL = '$baseURL/department/viewDepartment.php';
  // ======================= AUTH URL =========================//
  static const String loginURL = '$baseURL/auth/loginAdmin.php';
  // ======================= PRODUCT URL =========================//
  static const String viewAllProductURL = '$baseURL/product/getAllProduct.php';
}
