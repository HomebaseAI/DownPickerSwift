//
//  UIDownPicker.swift
//  DownPicker-iOS
//
//  Created by Daniel Chick on 1/3/19.
//  Copyright © 2019 chickdan. All rights reserved.
//

import UIKit

open class UIDownPicker: UITextField {
    private var picker: DownPicker?
    
    public init(with data: [String]) {
        super.init(frame: CGRect.zero)
        picker = DownPicker(with: self, data: data)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        picker = DownPicker(with: self, data: [String]())
    }
    
    public func setData(with data: [String]) {
        picker?.setData(with: data)
    }
    
    public func setImage(newImage: UIImage?) {
        picker?.arrowImage = newImage
    }
}
