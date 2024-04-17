//
//  DownPicker.swift
//  DownPicker
//
//  Created by HomebaseAI on 02/10/17.
//  Copyright © 2017 chickdan. All rights reserved.
//

import UIKit

/// DownPicker control which acts on a supplied textfield to present
/// a verticially scrolling caurosel of options.
///
/// Built on the UIPickerView
open class DownPicker: UIControl {
    private let textField: UITextField
    private var dataSource = [String]()
    private var selectedIndex = 0
    private var pickerView = UIPickerView()
    private var previouslySelectedString = ""
    private var toolbarDoneButtonText = "Done"
    private var toolbarCancelButtonText = "Cancel"
    private var toolbarTitleLabel = UILabel()
    
    /// Sets the style of the UIToolBar. By default the style is `.default`
    public var toolbarStyle: UIBarStyle = .default
    
    /// Determines whether or not a down arrow is shown in the text field.
    public var showArrowImage = true
    
    /// Determinnes whether or not the cancel button should be visible.
    public var shouldDisplayCancelButton = true
    
    /// Text to be assigned to the text field.
    public var text: String {
        get { return textField.text ?? "" }
    }
    
    /// Placeholder for the text view.
    public var placeholder = "Tap to choose..." {
        didSet {
            textField.placeholder = placeholder
        }
    }
    
    /// Image to be used as the right accessory of the text view.
    /// Hidden and shown by setting `showArrowImage`
    public var arrowImage: UIImage? {
        didSet {
            setupArrowImage()
        }
    }
    
    /// Initializer if data is not being supplied on creation.
    public init(with textField: UITextField) {
        self.textField = textField
        super.init(frame: CGRect.zero)
        
        setupTextField()
    }
    
    /// Initializer if data is being supplied on creation.
    public init(with textField: UITextField, data: [String]) {
        self.textField = textField
        super.init(frame: CGRect.zero)
        
        setupTextField()
        self.dataSource = data
    }
    
    required public init?(coder aDecoder: NSCoder) {
        self.textField = UITextField()
        super.init(frame: CGRect.zero)
        setupTextField()
    }
    
    private func setupTextField() {
        textField.delegate = self
        textField.placeholder = placeholder
        textField.tintColor = .clear
        
        setupArrowImage()
    }
    
    private func setupArrowImage() {
        if showArrowImage {
            textField.rightView = UIImageView(image: arrowImage)
            textField.rightViewMode = .always
            textField.rightView?.contentMode = .scaleAspectFit
            textField.rightView?.clipsToBounds = true
        }
    }
    
    private func setupToolbar() -> UIToolbar {
        let toolbar = UIToolbar()
        toolbar.barStyle = toolbarStyle
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: toolbarDoneButtonText, style: .done, target: self, action: #selector(doneClicked))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let titleItem = UIBarButtonItem(customView: toolbarTitleLabel)
        titleItem.isEnabled = false
        
        if shouldDisplayCancelButton {
            let cancelButton = UIBarButtonItem(title: toolbarCancelButtonText, style: .done, target: self, action: #selector(cancelClicked))
            
            toolbar.setItems([cancelButton, flexibleSpace, doneButton], animated: false)
        } else {
            toolbar.setItems([titleItem, flexibleSpace, doneButton], animated: false)
        }
        
        return toolbar
    }
    
    private func setPlaceholder(placeholder: String) {
        textField.placeholder = placeholder
    }
    
    @objc private func cancelClicked() {
        if previouslySelectedString.isEmpty || !dataSource.contains(previouslySelectedString) {
            textField.placeholder = placeholder
        }
        textField.text = previouslySelectedString
        textField.resignFirstResponder()
    }
    
    @objc private func doneClicked() {
        textField.resignFirstResponder()
        guard let text = textField.text else {
            return
        }
        
        if text.isEmpty || !dataSource.contains(text) {
            setValue(at: -1)
            textField.placeholder = placeholder
        }
        
        sendActions(for: .valueChanged)
    }
    
    private func showPicker() {
        let text = textField.text ?? ""
        previouslySelectedString = text
        
        let newPicker = UIPickerView()
        newPicker.delegate = self
        newPicker.dataSource = self
        
        pickerView = newPicker
        
        if text.isEmpty || !dataSource.contains(text) {
            setValue(at: selectedIndex)
        } else if dataSource.contains(text) {
            let index = dataSource.firstIndex(of: text) ?? 0
            pickerView.selectRow(index, inComponent: 0, animated: true)
        }
        
        textField.inputView = pickerView
        textField.inputAccessoryView = setupToolbar()
    }
}

// MARK: UIPickerView Delegate & Datasource
extension DownPicker: UIPickerViewDelegate, UIPickerViewDataSource {
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataSource.count
    }
    
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedIndex = row
        textField.text = dataSource[row]
        sendActions(for: .valueChanged)
    }
    
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dataSource[row]
    }
    
    private func setValue(at index: Int) {
        if index >= 0 {
            selectedIndex = index
            pickerView.selectRow(index, inComponent: 0, animated: true)
            textField.text = dataSource[index]
        } else {
            textField.text = nil
        }
    }
}

// MARK: UITextFieldDelegate
extension DownPicker: UITextFieldDelegate {
    public func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if dataSource.count > 0 {
            showPicker()
            return true
        }
        
        return false
    }
    
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        sendActions(for: .editingDidBegin)
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField) {
        sendActions(for: .editingDidEnd)
    }
    
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return false
    }
    
    public func setArrowVisibility(shouldShow: Bool) {
        textField.rightViewMode = shouldShow ? .always : .never
    }
}


//MARK: Public functions
extension DownPicker {
    /**
     * Sets the attributed placeholder of the textfield with the supplied
     * attributed string.
     *
     * - parameters:
     *      - newTitle: Attributed string to be assigned as the textfield placeholder
     */
    public func setAttributedPlaceholder(newTitle: NSAttributedString) {
        textField.attributedPlaceholder = newTitle
    }
    
    /**
     * Sets the title of the right toolbar button.
     *
     * - parameters:
     *      - newTitle: String to be assigned as the right button
     */
    public func setToolbarDoneButtonTitle(newTitle: String) {
        toolbarDoneButtonText = newTitle
    }
    
    /**
    * Sets the title of the left toolbar button.
    *
    * - parameters:
    *      - newTitle: String to be assigned as the left button
    */
    public func setToolbarCancelButtonTitle(newTitle: String) {
        toolbarCancelButtonText = newTitle
    }
    
    /**
    * Sets the title of the toolbar title in the center.
    *
    * - parameters:
    *      - newTitle: String to be assigned as the title
    */
    public func setToolbarTitle(newTitle: String) {
        toolbarTitleLabel.text = newTitle
    }
    
    /**
    * Sets the data displayed in the PickerView
    *
    * - parameters:
    *      - with: [String] to be used as the datasource
    */
    public func setData(with data: [String]) {
        dataSource = data
    }
    
    /**
    * Gets the textfield
    */
    public func getTextField() -> UITextField {
        return textField
    }
    
    /**
    * Gets the picker view
    */
    public func getPickerView() -> UIPickerView {
        return pickerView
    }
}
