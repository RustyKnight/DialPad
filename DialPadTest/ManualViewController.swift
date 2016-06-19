//
//  ManualViewController.swift
//  DialPadTest
//
//  Created by Shane Whitehead on 18/06/2016.
//  Copyright © 2016 KaiZen. All rights reserved.
//

import UIKit

class ManualViewController: UIViewController {
	
	@IBOutlet weak var bottomLabel: UILabel!
	@IBOutlet weak var topLabel: UILabel!
	@IBOutlet weak var bottomFiller: UIView!
	@IBOutlet weak var topFiller: UIView!
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		let views: [String:AnyObject!] = [
			"topFiller": topFiller,
			"bottomFiller": bottomFiller,
			"topLabel": topLabel,
			"bottomLabel": bottomLabel,
		]
		
		view.addConstraints(
			NSLayoutConstraint.constraintsWithVisualFormat("H:|-[topFiller]",
				options: NSLayoutFormatOptions(rawValue: 0),
				metrics: nil,
				views: views))
//		view.addConstraints(
//			NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[topFiller]-0-|",
//				options: NSLayoutFormatOptions(rawValue: 0),
//				metrics: nil,
//				views: views))
	}
	
	
	/*
	// MARK: - Navigation
	
	// In a storyboard-based application, you will often want to do a little preparation before navigation
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
	// Get the new view controller using segue.destinationViewController.
	// Pass the selected object to the new view controller.
	}
	*/
	
}
