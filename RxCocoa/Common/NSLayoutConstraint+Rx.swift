//
//  NSLayoutConstraint+Rx.swift
//  Rx
//
//  Created by Krunoslav Zaher on 12/6/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

#if !os(Linux)

import Foundation

#if os(OSX)
import Cocoa
#else
import UIKit
#endif

#if !RX_NO_MODULE
import RxSwift
#endif

#if os(iOS) || os(OSX) || os(tvOS)
extension Reactive where Base: NSLayoutConstraint {
    /**
     Bindable sink for `constant` property.
     */
    public var constant: UIBindingObserver<Base, CGFloat> {
        return UIBindingObserver(UIElement: self.base) { constraint, constant in
            constraint.constant = constant
        }
    }
    
    /**
     Bindable sink for `active` property.
     */
    @available(iOS 8, OSX 10.10, *)
    public var active:  UIBindingObserver<Base, Bool> {
        return UIBindingObserver(UIElement: self.base) { constraint, value in
            constraint.isActive = value
        }
    }
}

#endif

#endif
