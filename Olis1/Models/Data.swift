import Foundation
import SwiftUI

struct SubjectValue  : Identifiable{
    let id = UUID()
    let subjectName : String
    let subjectColorRed : Double
    let subjectColorGreen : Double
    let subjectColorBlue : Double
    let subjectEmoji : String
    let subjectImage : String
}

struct Event : Identifiable{
    let id = UUID()
    let eventPicture : String
    let eventTitle : String
    let eventSubject : SubjectValue
 //   let eventColorGradient : String // voir Color Linear gradient
    let eventLocation : String
    let eventTime : String // verifier le type
    var eventParticipantsNumber : Int
    let eventOrganizer : String
}

struct User : Identifiable{
    let id = UUID()
    let userName : String
    let userPicture : String
    let userFavSub : [SubjectValue]
    @State var isOrganizer : Bool
    @State var isTalking : Bool
    var tabEvents : [Event]
}

struct Stats{
    var tabEventOfTheMonth : [Event]// remplir le tableau sur une periode mensuelle
    var nbParticipants : Int // faire une fonction qui calcule ce nombre
    /*for theEvent in tabEventOfTheMonth {
         nbParticipants = nbParticipants + theEvent.eventParticipantsNumber
     }*/
    var chart : String // galère`
    var avgParticipants : Int // faire une fonction de moyenne qui calcule ce nombre
    
}

struct Chat : Identifiable {
    let id = UUID()
    var chatValue : SubjectValue
    @State var tabUsers : [User]
    
    // Une fonction qui
    /*
     1. Check si la il y a une discussion
     2. Check si il y a des participants
     
     
    
    func shareChatLink (Info : String) {
        let av = UIActivityViewController(activityItems: [Info, applicationActivities]: nil)
        UIApplication.present
    }
    */
    func checkChatIsLive (discuss : SubjectValue?) -> Bool{
        discuss != nil ? true : false
    }
}

// Code pour permettre le partage

struct ShareSheetView: UIViewControllerRepresentable {
    typealias Callback = (_ activityType: UIActivity.ActivityType?, _ completed: Bool, _ returnedItems: [Any]?, _ error: Error?) -> Void
    
    let activityItems: [Any]
    let applicationActivities: [UIActivity]? = nil
    let excludedActivityTypes: [UIActivity.ActivityType]? = nil
    let callback: Callback? = nil
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let controller = UIActivityViewController(
            activityItems: activityItems,
            applicationActivities: applicationActivities)
        controller.excludedActivityTypes = excludedActivityTypes
        controller.completionWithItemsHandler = callback
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
        // nothing to do here
    }
}

