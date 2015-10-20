part of loop.example.login_form.services;

class UsersService {
  Future<bool> isUsernameAvailable(String username) {
    return _simulateDelay(() => _isUsernameAvailableSync(username));
  }

  Future<bool> isPasswordValid(String password) {
    return _simulateDelay(() => _isPasswordValidSync(password));
  }

  Future<User> signup(String username, String password, String name, String email) {
    return _simulateDelay(() {
      if (!_isUsernameAvailableSync(username)) {
        throw "Username is taken";
      }

      if (!_isPasswordValidSync(password)) {
        throw "Password is not valid";
      }

      if (name.isEmpty) {
        throw "Name is empty";
      }

      return new User(1, username, name, email);
    });
  }

  bool _isPasswordValidSync(String password) {
    var specialChar = new RegExp(r"[!@#$%^&*()-_+=]");
    var digitChar = new RegExp(r"\d");
    return password.contains(specialChar) && password.contains(digitChar);
  }

  bool _isUsernameAvailableSync(String username) {
    if (username.length > 3) {
      return (username.codeUnitAt(0) % 2) == 0;
    } else {
      return false;
    }
  }
}

Future _simulateDelay(dynamic block()) async {
  var delay = new Duration(milliseconds: 500 + new math.Random().nextInt(700));
  await new Future.delayed(delay);

  return block();
}
