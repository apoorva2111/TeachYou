import Foundation

class ValidationError: Error {
    var message: String
    
    init(_ message: String) {
        self.message = message
    }
}

protocol ValidatorConvertible {
    func validated(_ value: String) throws -> String
    func validated(_ value1: String,_ value2:String) throws -> String

}

enum ValidatorType {
    case email
    case password
    case username
    case otp
    case confirmPassword
    case firstName
    case lastName
    case displayName
    case countrycode
    case phone
    case gender
    case dob
    case isempty
    case language
    case oldPassword
    case postalCode
    case fullname
}

enum VaildatorFactory {
    static func validatorFor(type: ValidatorType) -> ValidatorConvertible {
        switch type {
        case .email: return EmailValidator()
        case .password: return PasswordValidator()
        case .username: return UserNameValidator()
        case .otp: return OtpValidator()
        case .confirmPassword: return ConfirmPasswordValidator()
        case .firstName:
            return FirstNameValidator()
        case .lastName:
            return LastNameValidator()
        case .displayName:
            return DisplayNameValidator()
        case .countrycode:
            return CountryCodeValidator()
        case .phone:
            return PhoneValidator()
        case .gender:
            return GenderValidator()
        case .dob:
            return DOBValidator()
        case .isempty:
            return isEmptyFields()
        case .language:
            return LanguageValidator()
        case .oldPassword:
            return OldPasswordValidator()
        case .postalCode:
            return PostalCodeValidator()
        case .fullname:
            return FullNameValidator()
        }
    }
}


struct RequiredFieldValidator: ValidatorConvertible {
    func validated(_ value1: String, _ value2: String) throws -> String {
     return value1
    }
    
    private let fieldName: String
    
    init(_ field: String) {
        fieldName = field
    }
    
    func validated(_ value: String) throws -> String {
        guard !value.isEmpty else {
            throw ValidationError(Validation.kRequiredFieldPlaceholder + fieldName)
        }
        return value
    }
}


struct PasswordValidator: ValidatorConvertible {
    func validated(_ value1: String, _ value2: String) throws -> String {
      return value1
    }
    
    func validated(_ value: String) throws -> String {
        guard value != "" else {throw ValidationError(Validation.kPasswordRequired)}
        guard value.count >= 6 && value.count <= 12  else { throw ValidationError(Validation.kPasswordInvalid) }
        
        do {
            if try NSRegularExpression(pattern: "^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{6,16}$",  options: .caseInsensitive).firstMatch(in: value, options: [], range: NSRange(location: 0, length: value.count)) == nil {
                throw ValidationError(Validation.kPasswordInvalid)
            }
        } catch {
            throw ValidationError(Validation.kPasswordInvalid)
        }
        return value
    }
}

struct OtpValidator: ValidatorConvertible {
    func validated(_ value1: String, _ value2: String) throws -> String {
      return value1
    }
    
    func validated(_ value: String) throws -> String {
        guard value != "" else {throw ValidationError(Validation.kInvalidOTP)}
        // guard value.count != 6 else { throw ValidationError(Validation.kInvalidOTP) }
        return value
    }
}

struct FirstNameValidator: ValidatorConvertible {
    func validated(_ value1: String, _ value2: String) throws -> String {
      return value1
    }
    
    func validated(_ value: String) throws -> String {
        guard value != "" else {throw ValidationError(Validation.kFirstnameRequired)}
        guard value.count >= 3 && value.count <= 20  else { throw ValidationError(Validation.kInvalidFirstname) }
        return value
    }
}

struct LastNameValidator: ValidatorConvertible {
    func validated(_ value1: String, _ value2: String) throws -> String {
      return value1
    }
    
    func validated(_ value: String) throws -> String {
        guard value != "" else {throw ValidationError(Validation.kLastnameRequired)}
        guard value.count >= 3 && value.count <= 30  else { throw ValidationError(Validation.kInvalidLastname) }

        return value
    }
}

struct FullNameValidator: ValidatorConvertible {
    func validated(_ value1: String, _ value2: String) throws -> String {
      return value1
    }
    
    func validated(_ value: String) throws -> String {
        guard value != "" else {throw ValidationError(Validation.kFullnameRequired)}
        guard value.count >= 3 && value.count <= 30  else { throw ValidationError(Validation.kInvalidFullname) }

        return value
    }
}

struct DisplayNameValidator: ValidatorConvertible {
    func validated(_ value1: String, _ value2: String) throws -> String {
      return value1
    }
    
    func validated(_ value: String) throws -> String {
        guard value != "" else {throw ValidationError(Validation.kDisplaynameRequired)}
        guard value.count >= 3 && value.count <= 30  else { throw ValidationError(Validation.kInvalidDisplayname) }

        return value
    }
}

struct UserNameValidator: ValidatorConvertible {
    func validated(_ value1: String, _ value2: String) throws -> String {
      return value1
    }
    
    func validated(_ value: String) throws -> String {
        guard value != "" else {throw ValidationError(Validation.kUsernameRequired)}
        guard value.count >= 3 && value.count <= 30  else { throw ValidationError(Validation.kInvalidUsername)}

        return value
    }
}

struct GenderValidator: ValidatorConvertible {
    func validated(_ value1: String, _ value2: String) throws -> String {
      return value1
    }
    
    func validated(_ value: String) throws -> String {
        guard value != "" else {throw ValidationError(Validation.kGenderRequired)}
        

        return value
    }
}

struct LanguageValidator: ValidatorConvertible {
    func validated(_ value1: String, _ value2: String) throws -> String {
      return value1
    }
    
    func validated(_ value: String) throws -> String {
        guard value != "" else {throw ValidationError(Validation.kLanguageRequired)}
        

        return value
    }
}

struct DOBValidator: ValidatorConvertible {
    func validated(_ value1: String, _ value2: String) throws -> String {
      return value1
    }
    
    func validated(_ value: String) throws -> String {
        guard value != "" else {throw ValidationError(Validation.kDobRequired)}
        return value
    }
}

struct isEmptyFields: ValidatorConvertible {
    func validated(_ value1: String, _ value2: String) throws -> String {
      return value1
    }
    
    func validated(_ value: String) throws -> String {
        guard value != "" else {throw ValidationError(Validation.kFieldsRequired)}
        return value
    }
}

struct PhoneValidator: ValidatorConvertible {
    func validated(_ value1: String, _ value2: String) throws -> String {
      return value1
    }
    
    func validated(_ value: String) throws -> String {
        guard value != "" else {throw ValidationError(Validation.kPhone_Required)}
        guard value.count >= 14 && value.count <= 16  else { throw ValidationError(Validation.kPhoneInvalid) }
        return value
    }
}

struct CountryCodeValidator: ValidatorConvertible {
    func validated(_ value1: String, _ value2: String) throws -> String {
      return value1
    }
    
    func validated(_ value: String) throws -> String {
        guard value != "" else {throw ValidationError(Validation.kCountrycodeRequired)}
        guard value.count >= 1 && value.count <= 4  else { throw ValidationError(Validation.kCountrycodeInvalid) }
        return value
    }
}

struct PostalCodeValidator: ValidatorConvertible {
    func validated(_ value1: String, _ value2: String) throws -> String {
      return value1
    }
    
    func validated(_ value: String) throws -> String {
        guard value != "" else {throw ValidationError(Validation.kPostalcodeRequired)}
        guard value.count >= 1 && value.count <= 6  else { throw ValidationError(Validation.kCountrycodeInvalid) }
        return value
    }
}


struct ConfirmPasswordValidator: ValidatorConvertible {
    func validated(_ value1: String, _ value2: String) throws -> String {
        guard value2 != "" else {throw ValidationError(Validation.kConfirmPassRequired)}
        guard value1 == value2 else { throw ValidationError(Validation.kConfirmPassInvalid) }
        return value2
    }
    
    func validated(_ value: String) throws -> String {
        guard value != "" else {throw ValidationError(Validation.kConfirmPassInvalid)}
        return value
    }
}

struct OldPasswordValidator: ValidatorConvertible {
    func validated(_ value1: String, _ value2: String) throws -> String {
        guard value2 != "" else {throw ValidationError(Validation.kOldPassRequired)}
        guard value1 == value2 else { throw ValidationError(Validation.kOldPassInvalid) }
        return value2
    }
    
    func validated(_ value: String) throws -> String {
        guard value != "" else {throw ValidationError(Validation.kOldPassInvalid)}
        return value
    }
}

struct EmailValidator: ValidatorConvertible {
    func validated(_ value1: String, _ value2: String) throws -> String {
        return value1
    }
    
    func validated(_ value: String) throws -> String {
        guard value != "" else {throw ValidationError(Validation.kEmailRequiredd)}
        do {
            if try NSRegularExpression(pattern: "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}$", options: .caseInsensitive).firstMatch(in: value, options: [], range: NSRange(location: 0, length: value.count)) == nil {
                throw ValidationError(Validation.kEmailInvalid)
            }
        } catch {
            throw ValidationError(Validation.kEmailInvalid)
        }
        return value
    }
}
