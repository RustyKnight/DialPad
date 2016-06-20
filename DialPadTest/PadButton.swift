//
//  PadButton.swift
//  DialPadTest
//
//  Created by Shane Whitehead on 18/06/2016.
//  Copyright © 2016 KaiZen. All rights reserved.
//

import UIKit

@IBDesignable public class PadButton: UIControl {
	
	@IBInspectable public var dimeter: Double = 44.0
	
	@IBInspectable public var borderColor: UIColor = UIColor.blackColor() {
		didSet {
			layer.borderColor = borderColor.CGColor
			if filled {
				layer.backgroundColor = borderColor.CGColor
			}
		}
	}
	
	@IBInspectable public var borderWidth: CGFloat {
		set {
			layer.borderWidth = newValue
		}
		
		get {
			return layer.borderWidth
		}
	}
	
	@IBInspectable public var filled: Bool = false {
		didSet {
			if filled {
				layer.backgroundColor = borderColor.CGColor
			} else {
				layer.backgroundColor = nil
			}
		}
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setup()
	}
	
	required public init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		setup()
	}
	
	func setup() {
		dimeter = 44
		borderWidth = 1
		borderColor = UIColor.blackColor()
		opaque = false
		clipsToBounds = true
	}
	
	public override func intrinsicContentSize() -> CGSize {
		return CGSize(width: dimeter, height: dimeter)
	}
	
	public override func layoutSubviews() {
		super.layoutSubviews()
		layer.cornerRadius = min(bounds.width, bounds.height) / 2.0
	}
	
	internal var touchDuration: NSTimeInterval = 5

	public override func beginTrackingWithTouch(touch: UITouch, withEvent event: UIEvent?) -> Bool {
		super.beginTrackingWithTouch(touch, withEvent: event)
		let duration = touchDuration
		
		var fromColor = borderColor.CGColor
		var toColor = UIColor.clearColor().CGColor
		if filled {
			fromColor = UIColor.clearColor().CGColor
			toColor = borderColor.CGColor
		}
		
		layer.backgroundColor = fromColor
		
		let animation = CABasicAnimation(keyPath: "backgroundColor")
		animation.duration = duration
		animation.fromValue = fromColor
		animation.toValue = toColor
		layer.addAnimation(animation, forKey: "backgroundColor")
		
		layer.backgroundColor = toColor
		
		self.sendActionsForControlEvents(UIControlEvents.ValueChanged)
		
		return true
	}
	
	public override func continueTrackingWithTouch(touch: UITouch, withEvent event: UIEvent?) -> Bool {
		super.continueTrackingWithTouch(touch, withEvent: event)
		return false
	}
	
}