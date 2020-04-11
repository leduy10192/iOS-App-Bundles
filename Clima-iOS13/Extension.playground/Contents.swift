import UIKit

//extension Double{
//    // method overloading: new functions with the same name is allowed with different parameter names.
//    func round(to places: Int) -> Double {
//        let precisionNumber = pow(10, Double(places))
//        var n = self
//        n = n * precisionNumber
//        n.round()
//        n = n / precisionNumber
//        return n
//    }
//}
//var myDouble = 3.14159
//
//myDouble.round(to : 1)

let button = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
button.backgroundColor = .red

extension UIButton {
    func makeCircular(){
        self.clipsToBounds = true
        self.layer.cornerRadius = self.frame.size.width/2
    }
}

button.makeCircular()
//want to create a circular button

