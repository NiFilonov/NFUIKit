enum NFTextFieldValidator {
    
    case email(_ text: String)
    case password(_ text: String)
    case text(_ text: String)
    case instagram(_ text: String)
    case phone(_ text: String)
    case number(_ text: String)
    
    var isValid: Bool {
        switch self {
        case .email(let text):
            if text.count >= 50 { return false }
            let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let predicate = NSPredicate(format:"SELF MATCHES %@", regex)
            return predicate.evaluate(with: text)
        case .password(let text):
            let regex = "^(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{8,20}$"
            let predicate = NSPredicate(format:"SELF MATCHES %@", regex)
            return predicate.evaluate(with: text)
        case .text(let text):
            if text.count > 50 { return false }
            let regex = "[A-Za-zА-Яа-я]{2,64}"
            let predicate = NSPredicate(format:"SELF MATCHES %@", regex)
            return predicate.evaluate(with: text)
        case .instagram(let text):
            if text.count > 0 {
                if text.first == "@" {
                    let regex = "[A-Z0-9a-z._@]"
                    let predicate = NSPredicate(format:"SELF MATCHES %@", regex)
                    return predicate.evaluate(with: text)
                }
                return false
            }
            return false
        case .phone(let text):
            let regex = "[0-9+]{5,15}"
            let predicate = NSPredicate(format:"SELF MATCHES %@", regex)
            return predicate.evaluate(with: text)
        case .number(let text):
            let regex = "[0-9]{1,15}"
            let predicate = NSPredicate(format:"SELF MATCHES %@", regex)
            return predicate.evaluate(with: text)
        }
    }
    
}
