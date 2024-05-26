class Customer{
  final int id;
  final String fullName;
  final String email;
  final String phone; 
  final String role;
  final String password;

  Customer({
    this.id = 0, 
    required this.fullName, 
    required this.email, 
    required this.phone, 
    this.role = "customer",
    required this.password 
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json['id'],
        fullName: json['fullName'],
        email: json['email'],
        phone: json['phone'],
        password: json['password']
      );

  toJson(){ 
    return ( 
      { 
      "fullName": fullName,
      "email": email,
      "password": password,
      "phone": phone,
      "role": role,

      }
    );
  }

}