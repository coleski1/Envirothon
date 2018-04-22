//
//  ViewController.swift
//  Envirothon
//
//  Created by Cole Turner on 4/21/18.
//  Copyright © 2018 Cole Turner. All rights reserved.
//

import UIKit
import Charts
import Firebase



class MainViewController: UIViewController {
	
	
	@IBOutlet weak var chtChart: LineChartView!
	var numbers = [Double]()
	
	var database = Firestore.firestore()
	
	
	func updateGraph() {
		
		numbers = [1,6,3,9,10,18,3,4,2]
		
		var lineChartEntry = [ChartDataEntry]()
		
		for i in 0..<numbers.count{
			let value = ChartDataEntry(x: Double(i), y: numbers[i])
			
			lineChartEntry.append(value);
		}
		
		let line1 = LineChartDataSet(values: lineChartEntry, label: "Number")
		
		line1.colors = [NSUIColor.red]
		
		let data = LineChartData()
		
		data.addDataSet(line1)
		
		chtChart.data = data
		
		chtChart.chartDescription?.text = "My Chart"
	}
	
	
	var carbonData = [Int]()
	var dates = [Date]()

	override func viewDidLoad() {
		super.viewDidLoad()
		updateGraph()
	
		Auth.auth().addStateDidChangeListener { (auth, user) in
			if let theUser = user {
				print("Welcome \(theUser.email ?? theUser.uid).")
			} else {
				self.performSegue(withIdentifier: "goLogOut", sender: self)
			}
		}
		// Do any additional setup after loading the view, typically from a nib.
	}
	


	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

