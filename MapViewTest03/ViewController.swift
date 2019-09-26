//
//  ViewController.swift
//  MapViewTest03
//
//  Created by dit02 on 2019. 9. 20..
//  Copyright © 2019년 DIT. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
    
    // 배열 선언
    var pins = [MKPointAnnotation]()
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // MKMapViewDelegate와 UIViewController(self)
        mapView.delegate = self
        
        
        
        
        // MapType 설정 (standard, hybrid, satellite)
        mapView.mapType = MKMapType.standard
        //mapView.mapType = MKMapType.hybrid
        //mapView.mapType = MKMapType.satellite
        
        // 위도, 경도 설정 (DIT 35.165964, 129.072543)
        let location = CLLocationCoordinate2D(latitude: 35.165964, longitude: 129.072543)
        
        // 반경 설정(숫자가 작을수록 세부적으로)
        //let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        
        // region 설정
        //let region = MKCoordinateRegion(center: location, span: span)
        
        // span과 region 같이 지정
        //let region = MKCoordinateRegion(center: location, latitudinalMeters: 300, longitudinalMeters: 300)
        
        // mapView 에 add
        //mapView.setRegion(region, animated: true)
        
        
        // pin꼽기
        let pin1 = MKPointAnnotation()
        pin1.coordinate = location
        pin1.title = "동의과학대학교"
        pin1.subtitle = "나의 꿈이 자라는 곳"
        pins.append(pin1)   //배열 pins에 pin1 넣기
        
        // 시민공원 pin꼽기 35.1681824, 129.0556455
        let pin2 = MKPointAnnotation()
        pin2.coordinate.latitude = 35.164419
        pin2.coordinate.longitude = 129.064962
        pin2.title = "송상현 광장"
        pin2.subtitle = "푸른 잔디밭이 좋은곳"
        //mapView.addAnnotation(pin2)
        pins.append(pin2)   //배열 pins에 pin2 넣기
        
        // 태종대 pin꼽기 35.0517554, 129.0856113
        let pin3 = MKPointAnnotation()
        pin3.coordinate.latitude = 35.167783
        pin3.coordinate.longitude = 129.070598
        pin3.title = "번개반점"
        pin3.subtitle = "짜장면이 맛있는 집"
        //mapView.addAnnotation(pin4)
        pins.append(pin3)   //배열 pins에 pin4 넣기
        
        // mapView의 모든 pin들을 나타냄(배열)
        // showAnnotations : 반경 지정 없이 모든 pin을 지도에 나타나게 함
        mapView.showAnnotations(pins, animated: true)
    }
    
    // MapType 버튼 설정 (standard, hybrid, satellite)
    @IBAction func standardTypeButton(_ sender: Any) {
        mapView.mapType = MKMapType.standard
    }
    
    @IBAction func hybridTypeButton(_ sender: Any) {
        mapView.mapType = MKMapType.hybrid
    }
    
    @IBAction func satelliteTypeButton(_ sender: Any) {
        mapView.mapType = MKMapType.satellite
    }
    
    
    
    // MKMapViewDelegate 메소드
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        //guard !(annotation is MKUserLocation) else {
        //return nil
        //}
        
        // pin의 재활용
        let identifier = "RE"
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView!.canShowCallout = true
            annotationView?.pinTintColor = UIColor.blue   // pin 색깔 변경
            annotationView?.animatesDrop = true
            
            // 오른쪽 : 상세정보 버튼
            let btn = UIButton(type: .detailDisclosure)
            annotationView?.rightCalloutAccessoryView = btn
            
            // 왼쪽 : 이미지 넣기
            let imgV = UIImageView(image: UIImage(named: "dit.gif"))
            imgV.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
            annotationView?.leftCalloutAccessoryView = imgV
            
        } else {
            annotationView!.annotation = annotation
        }
        return annotationView
    }
}

