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
	
    @IBInspectable public var borderColor: UIColor = .black {
		didSet {
            layer.borderColor = borderColor.cgColor
			if filled {
                layer.backgroundColor = borderColor.cgColor
			}
		}
	}
	
	@IBInspectable public var borderWidth: CGFloat {
		set { layer.borderWidth = newValue }
		get { layer.borderWidth }
	}
	
	@IBInspectable public var filled: Bool = false {
		didSet {
			if filled {
                layer.backgroundColor = borderColor.cgColor
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
        borderColor = .black
        isOpaque = false
		clipsToBounds = true
	}
    
    public override var intrinsicContentSize: CGSize {
        return CGSize(width: dimeter, height: dimeter)
    }
	
	public override func layoutSubviews() {
		super.layoutSubviews()
		layer.cornerRadius = min(bounds.width, bounds.height) / 2.0
	}
	
    internal var touchDuration: TimeInterval = 1.0

    public override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        super.beginTracking(touch, with: event)
		let duration = touchDuration
		
        var fromColor = borderColor.cgColor
        var toColor = UIColor.clear.cgColor
		if filled {
            fromColor = UIColor.clear.cgColor
            toColor = borderColor.cgColor
		}
		
		layer.backgroundColor = fromColor
		
		let animation = CABasicAnimation(keyPath: "backgroundColor")
		animation.duration = duration
		animation.fromValue = fromColor
		animation.toValue = toColor
        layer.add(animation, forKey: "backgroundColor")
		
		layer.backgroundColor = toColor
		
        self.sendActions(for: .valueChanged)
		
		return true
	}
	
    public override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        super.continueTracking(touch, with: event)
		return false
	}
	
}
