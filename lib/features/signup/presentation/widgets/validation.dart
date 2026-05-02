class Validators {
  static String? validateUsername(String? username) {
    if (username == null || username.isEmpty) return 'Username is required';
    if (username.length < 6) return 'Invalid username';
    return null;
  }

  static String? validatePassword(String? value,String? cpassword) {
    if (value == null || value.isEmpty)
    { 
      return 'Password is required';
    }
    if (value.length < 8)
    {
     return 'Password should be at least 8 characters';
    }
    if (!value.contains(RegExp(r'[A-Z]')))
    {
     return 'Password must contain 1 Uppercase';
    }
    if (!value.contains(RegExp(r'[a-z]')))
    {
      return 'Password must contain 1 Lowercase';
    }
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]')))
    {
     return 'Password must contain 1 special character';
    }
     if (cpassword == null || cpassword.isEmpty)
    {
      return 'Please confirm your Password';
    }
    if (cpassword != value) 
    {
      return 'Passwords don\'t match';
    }
    return null;
  }
}