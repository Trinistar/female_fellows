class HelperFunctions {
  static bool isAdmin(Map<String, dynamic>? claims) {
    if (claims == null) return false;
    
    return (claims.containsKey('role') && claims.containsValue('ADMIN'));
  }
}
