//
//

import UIKit

public class AlertBuilder {
    private var alertTitle: String?
    private var alertMessage: String?
    private var alertActions = [UIAlertAction]()
    private var preferredAction: UIAlertAction?
    
    public init() {
        
    }
    
    public func setTitle(_ title: String?) -> AlertBuilder {
        alertTitle = title
        return self
    }
    
    public func setMessage(_ message: String?) -> AlertBuilder {
        alertMessage = message
        return self
    }
    
    public func addCancelButton(_ title: String?, handler: (() -> Void)? = nil) -> AlertBuilder {
        addButton(title, style: .cancel, handler: handler)
        return self
    }
    
    public func addButtons(buttons: [String : (() -> Void)?]) -> AlertBuilder {
        for button in buttons {
            addButton(button.key, style: .default, handler: button.value)
        }
        return self
    }
    
    public func addButton(_ title: String?, handler: (() -> Void)? = nil) -> AlertBuilder {
        addButton(title, style: .default, handler: handler)
        return self
    }
    
    public func addButtonWithPreferedAction(_ title: String?, handler: (() -> Void)? = nil) -> AlertBuilder {
        addButtonWithPreferedAction(title, style: .default, handler: handler)
        return self
    }
    
    public func addDestructiveButton(_ title: String?, handler: (() -> Void)? = nil) -> AlertBuilder {
        addButton(title, style: .destructive, handler: handler)
        return self
    }
    
    private func addButton(_ title: String?, style: UIAlertAction.Style, handler: (() -> Void)? = nil) {
        let action = UIAlertAction(title: title, style: style) { _ in
            handler?()
        }
        alertActions.append(action)
    }
    
    private func addButtonWithPreferedAction(_ title: String?, style: UIAlertAction.Style, handler: (() -> Void)? = nil) {
        let action = UIAlertAction(title: title, style: style) { _ in
            handler?()
        }
        alertActions.append(action)
        preferredAction = action
    }
    
    public func build() -> UIAlertController {
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        
        for action in alertActions {
            alert.addAction(action)
        }
        guard let action = preferredAction else { return alert}
        alert.preferredAction = action
        return alert
    }
}

