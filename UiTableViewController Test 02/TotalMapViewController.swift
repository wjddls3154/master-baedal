//
//  TotalMapViewController.swift
//  UiTableViewController Test 02
//
//  Created by D7702_10 on 2018. 6. 11..
//  Copyright © 2018년 lse. All rights reserved.
//

import UIKit
import MapKit

class TotalMapViewController: UIViewController {

    @IBOutlet weak var totalMapView: MKMapView!
    
    var locations = [String]()
    var names = [String]()
    var count = 0
    //주소 배열 받는 곳
    
    var annotations = [MKPointAnnotation]()
    
    
    // pin 저장 배열
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        viewMap(addr: locations, names: names)
        
        //geocoding
    }
    
    func viewMap(addr: [String], names: [String]) {
        for addr in locations {
            let geoCoder = CLGeocoder()
            geoCoder.geocodeAddressString(addr) {
                (placemarks: [CLPlacemark]?, error: Error?) -> Void in
                if let myError = error {
                    print(myError)
                    return
                }
                
                if let myPlacemarks = placemarks {
                    let myPlacemark = myPlacemarks[0]
                    let loc = myPlacemark.location?.coordinate
                    
                    let anno = MKPointAnnotation()
                    anno.coordinate = loc!
                    anno.title = names[self.count]
                    self.count = self.count + 1
                    anno.subtitle = addr
                    //self.self.myMapView.addAnnotation(anno)
                    self.annotations.append(anno)
                    self.totalMapView.addAnnotations(self.annotations)
                    
                    //여러개의 pin을 지도에 꽉채움
                    self.totalMapView.showAnnotations(self.annotations, animated: true)
                    
                    
                } else {
                    print("placemarks nil 발생")
                }
            }
        }

    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
