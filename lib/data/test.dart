bool isPalindrome(int x) {
  if (x < 0) return false; // Negative numbers are not palindromes

  int original = x;
  int reversed = 0;

  while (x != 0) {
    int digit = x % 10;
    reversed = reversed * 10 + digit;
    print('Digit = $digit');
    print('Reverses = $reversed');

    x ~/= 10;
    print("x = $x");
  }

  return reversed == original;
}

void main() {
  int x = 121;
  print(isPalindrome(x)); // Output: true
}
