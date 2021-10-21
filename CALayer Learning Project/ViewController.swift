//
//  ViewController.swift
//  CALayer Learning Project
//
//  Created by Alexander on 19.10.2021.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    var shapeLayer: CAShapeLayer! {
        didSet {
            shapeLayer.lineWidth = 20
            shapeLayer.lineCap = .round
            shapeLayer.fillColor = nil
            shapeLayer.strokeEnd = 1
            shapeLayer.strokeColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1).cgColor
        }
    }
    
    var overShapeLayer: CAShapeLayer! {
        didSet {
            overShapeLayer.lineWidth = 20
            overShapeLayer.lineCap = .round
            overShapeLayer.fillColor = nil
            overShapeLayer.strokeEnd = 0
            overShapeLayer.strokeColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        }
    }
    
    var gradientLayer: CAGradientLayer! {
        didSet {
            gradientLayer.startPoint = CGPoint(x: 0, y: 0)
            gradientLayer.endPoint = CGPoint(x: 1, y: 1)
            let startColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            let endColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
            gradientLayer.locations = [0.2, 0.8]
        }
    }
    
    // MARK: - IBOutlets
    @IBOutlet weak var profileImage: UIImageView! {
        didSet {
            profileImage.layer.cornerRadius = profileImage.frame.size.width / 2
            profileImage.layer.borderColor = UIColor.gray.cgColor
            profileImage.layer.borderWidth = 5
        }
    }
    
    @IBOutlet weak var profileButton: UIButton! {
        didSet {
            profileButton.layer.cornerRadius = 5
            profileButton.layer.shadowOpacity = 0.7
            profileButton.layer.shadowOffset = CGSize(width: -2, height: 5)
        }
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        gradientLayer = CAGradientLayer()
        view.layer.insertSublayer(gradientLayer, at: 0)
        
        shapeLayer = CAShapeLayer()
        view.layer.addSublayer(shapeLayer)
        
        overShapeLayer = CAShapeLayer()
        view.layer.addSublayer(overShapeLayer)
    }
    
    override func viewDidLayoutSubviews() {
        gradientLayer.frame = CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height)
        
        setupShapeLayer(shapeLayer)
        setupShapeLayer(overShapeLayer)
    }
    
    // MARK: - Methods
    fileprivate func setupShapeLayer(_ shapeLayer: CAShapeLayer) {
        shapeLayer.frame = view.bounds
        let path = UIBezierPath()
        path.move(to: CGPoint(x: self.view.frame.width / 2 - 100, y: self.view.frame.height / 2))
        path.addLine(to: CGPoint(x: self.view.frame.width / 2 + 100, y: self.view.frame.height / 2))
        shapeLayer.path = path.cgPath
    }
    
    // MARK: - IBActions
    @IBAction func profileButtonPressed(_ sender: UIButton) {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = 1
        animation.duration = 3
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        animation.fillMode = CAMediaTimingFillMode.both
        animation.isRemovedOnCompletion = false
        
        animation.delegate = self
        
        overShapeLayer.add(animation, forKey: nil)
    }
}

extension ViewController: CAAnimationDelegate {
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        //Some actions that you want to do after an animation will be stopped
    }
}



