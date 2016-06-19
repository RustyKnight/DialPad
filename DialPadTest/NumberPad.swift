//
//  NumberPad.swift
//  DialPadTest
//
//  Created by Shane Whitehead on 19/06/2016.
//  Copyright © 2016 KaiZen. All rights reserved.
//

import UIKit

public class NumberPad: UIControl {

	private let rowsStackView: UIStackView = UIStackView()
	private let cols = 3
	
	@IBInspectable var padButtonCount: Int = 10 {
		didSet {
			let rows = padButtonCount / cols
			let overflow = padButtonCount % 3
			
			var subRows = rowsStackView.arrangedSubviews
			// Remove rows which are no longer needed
			var count = subRows.count - rows
			if count > 0 {
				let oldRows = subRows[count..<subRows.count]
				for row in oldRows {
					rowsStackView.removeArrangedSubview(row)
				}
			}
			
			subRows = rowsStackView.arrangedSubviews
			count = rows - subRows.count
			if count > 0 {
				let row = UIStackView()
				row.axis = .Horizontal
				row.alignment = .Center
				row.distribution = .FillEqually
				for _ in 0..<cols {
					let pad = PadButton()
					pad.padText = "?"
					pad.subText = " "
					row.addArrangedSubview(pad)
				}
				rowsStackView.addArrangedSubview(row)
			}

			if overflow > 0 {
				let row = UIStackView()
				row.axis = .Horizontal
				row.alignment = .Center
				row.distribution = .FillEqually
				for _ in 0..<overflow {
					let pad = PadButton()
					pad.padText = "?"
					pad.subText = " "
					row.addArrangedSubview(pad)
				}
				rowsStackView.addArrangedSubview(row)
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
		rowsStackView.axis = .Vertical
		rowsStackView.alignment = .Center
		rowsStackView.distribution = .FillEqually
		addSubview(rowsStackView)
		rowsStackView.translatesAutoresizingMaskIntoConstraints = false
		var constraints: [NSLayoutConstraint] = []
		constraints.append(NSLayoutConstraint(item: rowsStackView,
			attribute: .CenterXWithinMargins,
			relatedBy: .Equal,
			toItem: self,
			attribute: .CenterXWithinMargins,
			multiplier: 1.0,
			constant: 0))
		constraints.append(NSLayoutConstraint(item: rowsStackView,
			attribute: .CenterYWithinMargins,
			relatedBy: .Equal,
			toItem: self,
			attribute: .CenterYWithinMargins,
			multiplier: 1.0,
			constant: 0))
		
		addConstraints(constraints)
	}

}
