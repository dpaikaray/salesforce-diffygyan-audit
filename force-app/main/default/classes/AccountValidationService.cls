public with sharing class AccountValidationService {

    public static void validatePhone(String phone) {
        if (String.isBlank(phone)) {
            throw new IllegalArgumentException('Phone number is required.');
        }

        if (!Pattern.matches('^[0-9+\\-() ]+$', phone)) {
            throw new IllegalArgumentException('Phone number contains invalid characters.');
        }
    }
}
