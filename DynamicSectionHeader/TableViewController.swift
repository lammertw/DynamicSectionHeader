//
//  TableViewController.swift
//  DynamicSectionHeader
//
//  Created by Lammert Westerhoff on 04/05/15.
//  Copyright (c) 2015 Lammert Westerhoff. All rights reserved.
//

import UIKit

    class TableViewController: UITableViewController {
        
        let headerView: HeaderView = {
            let view = HeaderView()
            view.titleLabel.text = "Title"
            view.subtitleLabel.text = "Subtitle"
            view.backgroundColor = UIColor.lightGrayColor()
            return view
        }()
        
        var headerHeight: CGFloat = 60

        override func viewDidLoad() {
            super.viewDidLoad()

            headerView.expandButton.addTarget(self, action: "toggleExpansion", forControlEvents: .TouchUpInside)
        }
        
        func toggleExpansion() {
            tableView.beginUpdates()
            
            if headerHeight == 60 {
                headerHeight = 40
                headerView.subtitleLabelHeightConstraint.constant = 0
            } else {
                headerHeight = 60
                headerView.subtitleLabelHeightConstraint.constant = 20
            }
            
            tableView.endUpdates()
            
            // Alternatively use tableView.reloadSections instead of begin and end updates:
            // tableView.reloadSections(NSIndexSet(index: 0), withRowAnimation: .Automatic)
        }

        // MARK: - Table view data source

        override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
            return 1
        }

        override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 2
        }
        
        override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
            cell.textLabel?.text = "Cell"
            return cell
        }

        override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return headerHeight
        }
        
        override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            return headerView
        }
        

    }
