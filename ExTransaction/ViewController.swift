//
//  ViewController.swift
//  ExTransaction
//
//  Created by 김종권 on 2022/04/09.
//

import UIKit

class ViewController: UIViewController {
  private lazy var nextButton: UIButton = {
    let button = UIButton()
    button.setTitle("next", for: .normal)
    button.setTitleColor(.systemBlue, for: .normal)
    button.setTitleColor(.blue, for: .highlighted)
    button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    self.view.addSubview(button)
    return button
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    NSLayoutConstraint.activate([
      self.nextButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
      self.nextButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
    ])
  }
  
  @objc private func didTapButton() {
    let vc = VC2()
//    self.navigationController?.pushViewController(vc, animated: true)
    self.navigationController?.pushViewController(viewController: vc, animated: true, completion: {
      print("completion!")
    })
  }
}
