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
		didSet {
			padTextLabel.text = padText
		}
	}
	@IBInspectable public var subText: String? {
		didSet {
			subTextLabel.text = subText
		}
	}
	
	@IBInspectable public var padFont: UIFont = UIFont.systemFontOfSize(UIFont.systemFontSize()) {
		didSet {
			padTextLabel.font = padFont
		}
	}
	@IBInspectable public var subTextFont: UIFont = UIFont.systemFontOfSize(UIFont.systemFontSize() - 3) {
		didSet {
			subTextLabel.font = subTextFont
		}
	}
	
	@IBInspectable public var textColor: UIColor = UIColor.blackColor() {
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
		
		padTextLabel.userInteractionEnabled = false
		subTextLabel.userInteractionEnabled = false
		stackView.userInteractionEnabled = false
		
		padText = "?"
		
		padFont = UIFont.systemFontOfSize(UIFont.systemFontSize())
		subTextFont = UIFont.systemFontOfSize(UIFont.systemFontSize() - 3)
		
		stackView.axis = .Vertical
		stackView.spacing = 1
		stackView.alignment = .Center
		stackView.distribution = .Fill
		
		stackView.addArrangedSubview(padTextLabel)
		stackView.addArrangedSubview(subTextLabel)
		
		addSubview(stackView)
		
		stackView.translatesAutoresizingMaskIntoConstraints = false
		var constraints: [NSLayoutConstraint] = []
		constraints.append(NSLayoutConstraint(item: stackView,
			attribute: .CenterXWithinMargins,
			relatedBy: .Equal,
			toItem: self,
			attribute: .CenterXWithinMargins,
			multiplier: 1.0,
			constant: 0))
		constraints.append(NSLayoutConstraint(item: stackView,
			attribute: .CenterYWithinMargins,
			relatedBy: .Equal,
			toItem: self,
			attribute: .CenterYWithinMargins,
			multiplier: 1.0,
			constant: 0))
		
		addConstraints(constraints)
	}
	
	override public func beginTrackingWithTouch(touch: UITouch, withEvent event: UIEvent?) -> Bool {
		
		self.padTextLabel.textColor = UIColor.whiteColor()
		self.subTextLabel.textColor = UIColor.whiteColor()
		dispatch_async(dispatch_get_main_queue(), {
			UIView.transitionWithView(self.padTextLabel,
				duration: self.touchDuration,
				options: .TransitionCrossDissolve,
				animations: {
				self.padTextLabel.textColor = self.textColor
				}, completion: nil)
			UIView.transitionWithView(self.subTextLabel,
				duration: self.touchDuration,
				options: .TransitionCrossDissolve,
				animations: {
				self.subTextLabel.textColor = self.textColor
				}, completion: nil)
		})
		
		return super.beginTrackingWithTouch(touch, withEvent: event)
	}
}
