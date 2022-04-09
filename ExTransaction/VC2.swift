//
//  VC2.swift
//  ExTransaction
//
//  Created by 김종권 on 2022/04/09.
//

import UIKit

final class VC2: UIViewController {
  private lazy var myView: UIView = {
    let view = UIView()
    view.backgroundColor = .white
    view.translatesAutoresizingMaskIntoConstraints = false
    self.view.addSubview(view)
    return view
  }()
  private lazy var button: UIButton = {
    let button = UIButton()
    button.setTitle("애니메이션", for: .normal)
    button.setTitleColor(.systemBlue, for: .normal)
    button.setTitleColor(.blue, for: .highlighted)
    button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    self.view.addSubview(button)
    return button
  }()
  
  private var randomFloat: CGFloat {
    CGFloat(drand48())
  }
  private var randomColor: UIColor {
    UIColor(red: self.randomFloat, green: self.randomFloat, blue: self.randomFloat, alpha: 1)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .systemGray4
    
    NSLayoutConstraint.activate([
      self.button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
      self.button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
    ])
    NSLayoutConstraint.activate([
      self.myView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20),
      self.myView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
      self.myView.widthAnchor.constraint(equalToConstant: 200),
      self.myView.heightAnchor.constraint(equalToConstant: 200)
    ])
  }
  
  @objc private func didTapButton() {
    CATransaction.begin()
    CATransaction.setCompletionBlock {
      self.button.setTitle("애니메이션 완료!", for: .normal)
    }
    
    let animation = CABasicAnimation(keyPath: "backgroundColor")
    animation.fromValue = self.randomColor.cgColor
    animation.toValue = self.randomColor.cgColor
    animation.duration = 3
    animation.repeatCount = 1
    self.myView.layer.add(animation, forKey: "myAnimation")
    
    CATransaction.commit() // Commits outer transaction
  }
}
