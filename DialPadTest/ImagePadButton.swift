//
//  ImagePadButton.swift
//  DialPadTest
//
//  Created by Shane Whitehead on 20/06/2016.
//  Copyright © 2016 KaiZen. All rights reserved.
//

import UIKit

@IBDesignable public class ImagePadButton: PadButton {
	
	@IBInspectable public var image: UIImage? {
		set { imageView.image = newValue }
		get { return imageView.image }
	}
	
	internal let imageView = UIImageView()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
	}
	
	required public init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override func setup() {
		super.setup()
		
		addSubview(imageView)
		
		let views: [String:AnyObject] = [
			"imageView":imageView
		]
		imageView.translatesAutoresizingMaskIntoConstraints = false
		var constraints: [NSLayoutConstraint] = []
        constraints += NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-[imageView]-|",
			options: [],
			metrics: nil,
			views: views)
        constraints += NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-[imageView]-|",
			options: [],
			metrics: nil,
			views: views)
		addConstraints(constraints)
	}
//    
//    override public var intrinsicContentSize: CGSize {
//		return super.intrinsicContentSize()
//	}
//	
//	public override func layoutSubviews() {
//		super.layoutSubviews()
//		print(bounds)
//	}
	
    override public func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
		if let image = image {
//			imageView.animationImages = [
//				image.imageWithRenderingMode(.AlwaysTemplate),
//				image]
//			imageView.animationDuration = touchDuration
//			imageView.animationRepeatCount = 1
//			imageView.startAnimating()
            DispatchQueue.main.async {
                UIView.transition(
                    with: self.imageView,
                    duration: self.touchDuration,
                    options: .transitionCrossDissolve,
                    animations: {
                        self.imageView.image = image
                    },
                    completion: nil
                )
            }
			imageView.tintColor = borderColor
            imageView.image = image.withRenderingMode(.alwaysTemplate)
		}
		
        return super.beginTracking(touch, with: event)
	}

}
