
protocol AdvancedLifeSupport {
    func performCPR()
}

class EmergencyCallHandler {
    // whoever sets themselves as delegates, either a class or a struct
    // must have the AdvancedLifeSupport protocol adopted
    // so they know how to perform CPR
    var delegate : AdvancedLifeSupport?
    
    func assessSituation(){
        print("Can you tell me what happened?")
    }
    
    func medicalEmergency(){
        //notify whoever carries the bleep, to go perform CPR
        delegate?.performCPR()
    }
}

struct Paramedic: AdvancedLifeSupport{
    //When the paramedic is initialized they assigned themselves to the handler
    init(handler: EmergencyCallHandler){
        //picking up the pager(bleep) and now on call
        handler.delegate = self
    }
    
    // implementation of performCPR()
    func performCPR() {
        print("The paramedic does chest compressions, 30 per second.")
    }
}

class Doctor: AdvancedLifeSupport{
    //set themselves to will be notified by the handler
    init(handler: EmergencyCallHandler){
        handler.delegate = self
    }
    
    func useStethescope(){
        print("Listening for heart sounds.")
    }
    func performCPR() {
        print("The doctor does chest compressions, 30 per second.")
    }
    
}

class Surgeon: Doctor{
    //by default, also adopt the AdvancedLifeSupport inherited from the Doctor class
    override func performCPR() {
        super.performCPR()
        print("Staying alive by The BeeGees.")
    }
    
    func useElectricGrill(){
        print("Whirr...")
    }
}

let emilio = EmergencyCallHandler()
//let pete = Paramedic(handler: emilio)
let angela = Surgeon(handler: emilio)

emilio.assessSituation()
emilio.medicalEmergency()


protocol CanFly {
    func fly()
}

//whenever a class/ struct adopt this extension,
extension CanFly {
    func fly(){
        print("The object takes off into the air.")
    }
}

//now when we adopt CanFly, we don't actually have that error that says "we haven't adopted the fly method", because now we got a default implementation that we can fall back on.
