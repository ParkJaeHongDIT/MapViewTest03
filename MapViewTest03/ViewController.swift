//
//  ViewController.swift
//  MapViewTest03
//
//  Created by dit02 on 2019. 9. 20..
//  Copyright © 2019년 DIT. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib. 35.166537, 129.072061 35.167835, 129.070587
       
        let center = CLLocationCoordinate2D(latitude: 35.166537, longitude: 129.072061) //중심점 설정
       
 //       let span = MKCoordinateSpan(latitudeDelta: 0.06, longitudeDelta: 0.06) //반경 설정
        
 //       let region = MKCoordinateRegion(center: center, span: span) //region 만들기
        
        let region = MKCoordinateRegion(center: center, latitudinalMeters: 500, longitudinalMeters: 500)
        
        
        mapView.setRegion(region, animated: true) //mapView에 region 추가
        
        let a = MKPointAnnotation()
        a.coordinate = center
        a.title = "DIT 동의과학대학교 컴퓨터정보과"
        a.subtitle = "개발자 양성소"
        
        let b = MKPointAnnotation()
        b.coordinate.latitude = 35.167835
        b.coordinate.longitude = 129.070587
        b.title = "번개반점"
        b.subtitle = "중국집"
        
        let c = MKPointAnnotation()
        c.coordinate.latitude = 35.168336
        c.coordinate.longitude = 129.057856
        c.title = "시민공원"
        c.subtitle = "시민들의 휴식처"
        // pin(annotation) 꼽기
        
 //       mapView.addAnnotation(a) // mapView 에 추가
 //       mapView.addAnnotation(b)
        mapView.showAnnotations([a,b,c], animated: true)
    }
    @IBAction func satadardAction(_ sender: Any) {
         mapView.mapType = MKMapType.standard
    }
    
    @IBAction func satelliteAction(_ sender: Any) {
         mapView.mapType = MKMapType.satellite
    }
    
    @IBAction func hybridAction(_ sender: Any) {
         mapView.mapType = MKMapType.hybrid
    }
    

}

