//
//  ButtonVaidatorHelper.swift
//  Al-Anon
//
//  Created by Rnf-Yogita on 15/12/19.
//  Copyright © 2019 Rnf-Yogita. All rights reserved.
//

import Foundation
import UIKit

class ButtonValidationHelper {

  var textFields: [UITextField]!
  var button: CustomButton!

  init(textFields: [UITextField], button: CustomButton) {

    self.textFields = textFields
    self.button = button

    attachTargetsToTextFields()
    button.configureDisableButton()
    checkForEmptyFields()
  }

  //Attach editing changed listeners to all textfields passed in
  private func attachTargetsToTextFields() {
    for textfield in textFields{
        textfield.addTarget(self, action: #selector(textFieldsIsNotEmpty), for: .editingChanged)
    }
  }

  @objc private func textFieldsIsNotEmpty(sender: UITextField) {
    sender.text = sender.text?.trimmingCharacters(in: .whitespaces)
    checkForEmptyFields()
  }


  //Returns true if the field is empty, false if it not
  private func checkForEmptyFields() {

    for textField in textFields{
        guard let textFieldVar = textField.text, !textFieldVar.isEmpty else {
            button.configureDisableButton()
            return
        }
    }
    button.configureEnableButton()
  }

}
