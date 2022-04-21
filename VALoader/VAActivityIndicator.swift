//
//  VAActivityIndicator.swift
//  VALoader
//
//  Created by Senthilkumar Kuppuraj on 11/04/22.
//

import UIKit

let appRedColor = UIColor(red: 226/255.0, green: 7/255.0, blue: 10/255.0, alpha: 1.0)

@IBDesignable
public class VAActivityIndicatorView: UIView {
    @IBInspectable
    public var color: UIColor = appRedColor {
        didSet {
            indicator.strokeColor = color.cgColor
        }
    }

    @IBInspectable
    public var lineWidth: CGFloat = 2.0 {
        didSet {
            indicator.lineWidth = lineWidth
            setNeedsLayout()
        }
    }

    private let indicator = CAShapeLayer()
    private let animator = VAActivityIndicatorAnimator()

    private var isAnimating = false

    convenience init() {
        self.init(frame: .zero)
        self.setup()
    }

    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }

    private func setup() {
        indicator.strokeColor = color.cgColor
        indicator.fillColor = nil
        indicator.lineWidth = lineWidth
        indicator.strokeStart = 0.0
        indicator.strokeEnd = 0.0
        layer.addSublayer(indicator)
    }
}

extension VAActivityIndicatorView {
    override public var intrinsicContentSize: CGSize {
        return CGSize(width: 24, height: 24)
    }

    override public func layoutSubviews() {
        super.layoutSubviews()

        indicator.frame = bounds

        let diameter = bounds.size.min - indicator.lineWidth
        let path = UIBezierPath(center: bounds.center, radius: diameter / 2)
        indicator.path = path.cgPath
    }
}

extension VAActivityIndicatorView {
    public func startAnimating() {
        guard !isAnimating else { return }

        animator.addAnimation(to: indicator)
        isAnimating = true
    }

    public func stopAnimating() {
        guard isAnimating else { return }

        animator.removeAnimation(from: indicator)
        isAnimating = false
    }
}
