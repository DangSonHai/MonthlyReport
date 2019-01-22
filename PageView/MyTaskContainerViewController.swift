//
//  MayTaskContainerViewController.swift
//  Jooto
//
//  Created by Huy Pham Quang on 7/20/18.
//  Copyright © 2018 Framgia. All rights reserved.
//

import UIKit

enum TaskViewControllerType: Int {
    case myTask
    case followingTask
}

class MyTaskContainerViewController: UIViewController {

    var pageViewController: PageView! {
        didSet {
            pageViewController.pageViewDelegate = self
        }
    }

    var segmentedControl: UISegmentedControl!
    var selectedIndex = 0

    lazy var myTaskViewController = MyTaskContainerViewController.createMyTaskViewController(.myTask)
    lazy var followingTaskViewController = MyTaskContainerViewController.createMyTaskViewController(.followingTask)

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        self.setupSegmentedControl()
        self.setupPageView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.segmentedControl.setTitle(HelperManager.getLocalizedStringForKey(LocalizedString.mytasks), forSegmentAt: 0)
        self.segmentedControl.setTitle(HelperManager.getLocalizedStringForKey(LocalizedString.following), forSegmentAt: 1)
        self.navigationController?.isNavigationBarHidden = false
        self.tabBarController?.tabBar.isHidden = false
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let pageViewController = segue.destination as? PageView {
            self.pageViewController = pageViewController
            self.pageViewController?.infiniteScroll = false
        }
    }

    private func setupSegmentedControl() {
        let segmentTextContent = [
            HelperManager.getLocalizedStringForKey(LocalizedString.mytasks),
            HelperManager.getLocalizedStringForKey(LocalizedString.following)
        ]

        let screenScale: CGFloat = 0.8
        let segmentedControlWidth = UIScreen.main.bounds.width * screenScale

        // Segmented control as the custom title view
        self.segmentedControl = UISegmentedControl(items: segmentTextContent)
        segmentedControl.layer.cornerRadius = 15
        segmentedControl.layer.borderColor = UIColor.progressTintColor.cgColor
        segmentedControl.layer.borderWidth = 1.0
        segmentedControl.layer.masksToBounds = true
        segmentedControl.tintColor = UIColor.progressTintColor
        segmentedControl.selectedSegmentIndex = selectedIndex
        segmentedControl.autoresizingMask = .flexibleWidth
        segmentedControl.frame = CGRect(x: 0, y: 0, width: segmentedControlWidth, height: 30)
        segmentedControl.addTarget(self, action: #selector(action(_:)), for: .valueChanged)

        self.navigationItem.titleView = segmentedControl
    }

    @objc func action(_ sender: UISegmentedControl) {
        self.selectedIndex = sender.selectedSegmentIndex
        self.pageViewController.scrollToViewController(index: sender.selectedSegmentIndex)
    }

    private func setupPageView() {
        self.pageViewController.arrayChildView.append(self.myTaskViewController)
        self.pageViewController.arrayChildView.append(self.followingTaskViewController)
        self.pageViewController.reloadPageView()
    }

    class func createMyTaskViewController(_ type: TaskViewControllerType) -> UIViewController {
        guard let viewController = MyTasksViewController.fromStoryboard(Storyboard.MyTasks.name) as? MyTasksViewController else {
            return UIViewController()
        }

        viewController.viewModel.viewControllerType = type
        return viewController
    }
}

extension MyTaskContainerViewController: PageViewDelegate {
    func pageViewController(_ pageViewController: PageView, didUpdatePageCount count: Int) {
    }

    func pageViewController(_ pageViewController: PageView, didUpdatePageIndex index: Int) {
        self.segmentedControl.selectedSegmentIndex = index
    }
}
