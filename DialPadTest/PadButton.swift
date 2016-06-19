//
//  PadButton.swift
//  DialPadTest
//
//  Created by Shane Whitehead on 18/06/2016.
//  Copyright © 2016 KaiZen. All rights reserved.
//

import UIKit

@IBDesignable public class PadButton: UIControl {
	
	@IBInspectable var padText: String? {
		didSet {
			padTextLabel.text = padText
		}
	}
	@IBInspectable var subText: String? {
		didSet {
			subTextLabel.text = subText
		}
	}
	
	@IBInspectable var dimeter: Double = 44.0
	
	@IBInspectable var padFont: UIFont = UIFont.systemFontOfSize(UIFont.systemFontSize()) {
		didSet {
			padTextLabel.font = padFont
		}
	}
	@IBInspectable var subTextFont: UIFont = UIFont.systemFontOfSize(UIFont.systemFontSize() - 3) {
		didSet {
			subTextLabel.font = subTextFont
		}
	}
	
	@IBInspectable var borderColor: UIColor = UIColor.blackColor() {
		didSet {
			layer.borderColor = borderColor.CGColor
		}
	}
	
	private var padTextLabel: UILabel = UILabel()
	private var subTextLabel: UILabel = UILabel()
	
	private var stackView: UIStackView = UIStackView()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setup()
	}
	
	required public init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		setup()
	}
	
	func setup() {
		opaque = false
		clipsToBounds = true
		
		padText = "?"
		borderColor = UIColor.blackColor()
		layer.borderWidth = 1
		
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
	
	public override func intrinsicContentSize() -> CGSize {
		let size = stackView.intrinsicContentSize()
		print(size)
		return CGSize(width: dimeter, height: dimeter)
	}
	
	public override func layoutSubviews() {
		super.layoutSubviews()
		layer.cornerRadius = min(bounds.width, bounds.height) / 2.0
	}
	
}