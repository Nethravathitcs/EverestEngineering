//
//  DeliveryCostViewController.swift
//  DeliveryCostViewController
//
//  Created by Nethra on 13/03/24.
//

import UIKit

class DeliveryCostViewController: UIViewController {
    @IBOutlet weak var weightTextField: UILabel!
    @IBOutlet weak var distanceTextfield: UILabel!
    @IBOutlet weak var offerCodeTextField: UILabel!
    @IBOutlet weak var deliveryCostWeightLabel: UILabel!
    @IBOutlet weak var deliveryCostDistance: UILabel!
    @IBOutlet weak var deliveryCostLabel: UILabel!
    @IBOutlet weak var discountLabel: UILabel!
    @IBOutlet weak var offerCodeLabel: UILabel!
    @IBOutlet weak var discountText: UILabel!
    @IBOutlet weak var totalCost: UILabel!
    
    var distance = ""
    var weight = ""
    var offerCode = ""
    var discountString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        let deliveryCost = calculateTotalDeliveryCost(deliveryDistance: Double(distance)!, deliveryWeight:Double(weight)!)
        let discount = calculateDiscount(deliveryDistance: Double(distance)!, deliveryWeight: Double(weight)!, deliveryCost: deliveryCost)
        
        let totalCost = deliveryCost - discount
       
        self.weightTextField.text = weight + "kg"
        self.distanceTextfield.text = distance + "km"
        
        self.deliveryCostDistance.text = distance
        self.deliveryCostWeightLabel.text = weight
        self.deliveryCostLabel.text = String(deliveryCost)
        
        self.offerCodeLabel.text = offerCode
        
        //discount
        if discountString == ""
        {
            self.discountLabel.text = "-0.0"
            self.discountText.text = "(Offer not applicable as criteria not met)"
            self.totalCost.text = String(totalCost)
        }else{
            self.discountLabel.text = "-" + String(totalCost)
            self.discountText.text = "(" + String(discountString) + " of " +  String(deliveryCost) + " i.e; Delivery Cost)"
            self.totalCost.text = String(discount)
        }
      
        
       

    }
    func calculateTotalDeliveryCost(deliveryDistance: Double, deliveryWeight: Double) -> Double {
        let baseDeliveryCost = 100.0 // Base Delivery Cost
        
        // Calculate cost components
        let weightCost = deliveryWeight * 10
        let distanceCost = deliveryDistance * 5
        
        // Calculate total delivery cost without discount
        let deliveryCost = baseDeliveryCost + weightCost + distanceCost
        
        
        return deliveryCost
    }
    func calculateDiscount(deliveryDistance: Double, deliveryWeight: Double,deliveryCost : Double) -> Double{
        var dicountCost = 0.0
        // Apply discounts based on offer code
            if deliveryDistance < 200 && deliveryWeight >= 70 && deliveryWeight <= 200 {
                dicountCost = deliveryCost * 0.9 // 10% Discount
                offerCode = "OFR001"
                discountString = "10%"
            }
            else if deliveryDistance >= 50 && deliveryDistance <= 150 && deliveryWeight >= 100 && deliveryWeight <= 250 {
                dicountCost = deliveryCost * 0.93 // 7% Discount
                offerCode = "OFR002"
                discountString = "7%"
            }
            else if deliveryDistance >= 50 && deliveryDistance <= 250 && deliveryWeight >= 10 && deliveryWeight <= 150 {
                dicountCost = deliveryCost * 0.95 // 5% Discount
                offerCode = "OFR003"
                discountString = "5%"
            }else{
                discountString = ""
            }
       return dicountCost
    }

}
