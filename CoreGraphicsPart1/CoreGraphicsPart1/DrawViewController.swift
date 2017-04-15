//
//  DrawViewController.swift
//  CoreGraphicsPart1
//
//  Created by Pham Quang Huy on 4/13/17.
//  Copyright © 2017 Framgia, Inc. All rights reserved.
//

import UIKit

class DrawViewController: UIViewController {
    // MARK: Parameters - UIKit
    @IBOutlet var drawView: DrawView! {
        didSet {
            drawView.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1.0)
        }
    }
    @IBOutlet var brushSegmentedControl: UISegmentedControl!
    
    // MARK: Parameters - User
    
    var brushes = [LineBrush(), SquareBrush(), EllipseBrush() ,CircleBrush()]
    
    // MARK: Medthods - Override
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.drawView.brush = LineBrush()
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    // MARK: Methods - Required
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: Methods - Convenience
    
    convenience init() {
        let nibNameOrNil = "DrawViewController"
        self.init(nibName: nibNameOrNil, bundle: nil)
    }
    
    // MARK: Methods - IBActions
    
    @IBAction func brushSegmentedControlValueChange(sender: UISegmentedControl) {
        drawView.brush = brushes[sender.selectedSegmentIndex]
    }

}
