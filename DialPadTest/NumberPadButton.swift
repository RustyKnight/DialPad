//
//  NumberPadButton.swift
//  DialPadTest
//
//  Created by Shane Whitehead on 20/06/2016.
//  Copyright © 2016 KaiZen. All rights reserved.
//

import UIKit

@IBDesignable public class NumberPadButton: PadButton {
    
    @IBInspectable public var padText: String? {
        didSet { padTextLabel.text = padText }
    }
    @IBInspectable public var subText: String? {
        didSet { subTextLabel.text = subText }
    }
    
    @IBInspectable public var padFont: UIFont = UIFont.systemFont(ofSize: UIFont.systemFontSize) {
        didSet { padTextLabel.font = padFont }
    }
    @IBInspectable public var subTextFont: UIFont = UIFont.systemFont(ofSize: UIFont.systemFontSize - 3) {
        didSet { subTextLabel.font = subTextFont }
    }
    
    @IBInspectable public var textColor: UIColor = UIColor.black {
        didSet {
            padTextLabel.textColor = textColor
            subTextLabel.textColor = textColor
        }
    }
    
    private var padTextLabel: UILabel = UILabel()
    private var subTextLabel: UILabel = UILabel()
    
    private var stackView: UIStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func setup() {
        super.setup()
        
        padTextLabel.isUserInteractionEnabled = false
        subTextLabel.isUserInteractionEnabled = false
        stackView.isUserInteractionEnabled = false
        
        padText = "?"
        
        padFont = UIFont.systemFont(ofSize: UIFont.systemFontSize)
        subTextFont = UIFont.systemFont(ofSize: UIFont.systemFontSize - 3)
        
        stackView.axis = .vertical
        stackView.spacing = 1
        stackView.alignment = .center
        stackView.distribution = .fill
        
        stackView.addArrangedSubview(padTextLabel)
        stackView.addArrangedSubview(subTextLabel)
        
        addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        var constraints: [NSLayoutConstraint] = []
        constraints.append(
            NSLayoutConstraint(
                item: stackView,
                attribute: .centerXWithinMargins,
                relatedBy: .equal,
                toItem: self,
                attribute: .centerXWithinMargins,
                multiplier: 1.0,
                constant: 0
            )
        )
        constraints.append(
            NSLayoutConstraint(
                item: stackView,
                attribute: .centerYWithinMargins,
                relatedBy: .equal,
                toItem: self,
                attribute: .centerYWithinMargins,
                multiplier: 1.0,
                constant: 0
            )
        )
        
        addConstraints(constraints)
    }
    
    override public func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        self.padTextLabel.textColor = UIColor.white
        self.subTextLabel.textColor = UIColor.white
        DispatchQueue.main.async {
            UIView.transition(
                with: self.padTextLabel,
                duration: self.touchDuration,
                options: .transitionCrossDissolve,
                animations: {
                    self.padTextLabel.textColor = self.textColor
                }, completion: nil
            )
            UIView.transition(
                with: self.subTextLabel,
                duration: self.touchDuration,
                options: .transitionCrossDissolve,
                animations: {
                    self.subTextLabel.textColor = self.textColor
                }, completion: nil
            )
        }
        
        return super.beginTracking(touch, with: event)
    }
}
