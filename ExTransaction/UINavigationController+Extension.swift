//
//  UINavigationController+Extension.swift
//  ExTransaction
//
//  Created by 김종권 on 2022/04/09.
//

import UIKit

extension UINavigationController {
  public func pushViewController(viewController: UIViewController, animated: Bool, completion: @escaping () -> Void = {}) {
    CATransaction.begin()
    CATransaction.setCompletionBlock(completion)
    self.pushViewController(viewController, animated: animated)
    CATransaction.commit()
  }
}
