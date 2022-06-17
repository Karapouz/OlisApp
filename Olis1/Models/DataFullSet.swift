import Foundation
// Création de l'ensemble de nos sujets
var laValeurAventure = SubjectValue(subjectName: "Aventure", subjectColorRed: 19/255, subjectColorGreen: 175/255,subjectColorBlue: 144/255, subjectEmoji: "paperplane.fill",subjectImage:"Aventure")
var laValeurCollaboration = SubjectValue(subjectName: "Collaboration", subjectColorRed: 254/255, subjectColorGreen: 220/255,subjectColorBlue: 15/255, subjectEmoji: "figure.stand.line.dotted.figure.stand",subjectImage:"Collaboration")
var laValeurGratitude = SubjectValue(subjectName: "Gratitude", subjectColorRed: 250/255, subjectColorGreen: 149/255,subjectColorBlue: 0/255, subjectEmoji: "face.smiling.fill",subjectImage:"Gratitude")
var laValeurPerseverance = SubjectValue(subjectName: "Persévérance", subjectColorRed: 146/255, subjectColorGreen: 4/255,subjectColorBlue: 0/255, subjectEmoji: "bolt.fill",subjectImage:"Perseverance")
var laValeurAutodiscipline = SubjectValue(subjectName: "Autodiscipline", subjectColorRed: 221/255, subjectColorGreen: 4/255,subjectColorBlue: 38/255, subjectEmoji: "studentdesk",subjectImage:"Autodiscipline")
var laValeurEntente = SubjectValue(subjectName: "Entente", subjectColorRed: 207/255, subjectColorGreen: 238/255,subjectColorBlue: 158/255, subjectEmoji: "hands.sparkles",subjectImage:"Entente")
var laValeurSagesse = SubjectValue(subjectName: "Sagesse", subjectColorRed: 144/255, subjectColorGreen: 127/255,subjectColorBlue: 159/255, subjectEmoji: "circle.hexagonpath.fill",subjectImage:"Sagesse")
var laValeurConfiance = SubjectValue(subjectName: "Confiance", subjectColorRed: 176/255, subjectColorGreen: 10/255,subjectColorBlue: 169/255, subjectEmoji: "cube",subjectImage:"Confiance")
var laValeurCompetence = SubjectValue(subjectName: "Compétence", subjectColorRed: 2/255, subjectColorGreen: 44/255,subjectColorBlue: 54/255, subjectEmoji: "books.vertical.fill",subjectImage:"Competence")
var laValeurBienveillance = SubjectValue(subjectName: "Bienveillance", subjectColorRed: 240/255, subjectColorGreen: 181/255,subjectColorBlue: 209/255, subjectEmoji: "eye",subjectImage:"Bienveillance")
var laValeurAltruisme = SubjectValue(subjectName: "Altruisme", subjectColorRed: 239/255, subjectColorGreen: 181/255,subjectColorBlue: 34/255, subjectEmoji: "camera.macro",subjectImage:"Altruisme")
var laValeurCreativite = SubjectValue(subjectName: "Créativité", subjectColorRed: 255/255, subjectColorGreen: 255/255,subjectColorBlue: 90/255, subjectEmoji: "pencil.and.outline",subjectImage:"Creativite")
var laValeurExcellence = SubjectValue(subjectName: "Excellence", subjectColorRed: 45/255, subjectColorGreen: 49/255,subjectColorBlue: 66/255, subjectEmoji: "sparkles",subjectImage:"Excellence")
var laValeurLiberte = SubjectValue(subjectName: "Liberté", subjectColorRed: 192/255, subjectColorGreen: 232/255,subjectColorBlue: 249/255, subjectEmoji: "guitars.fill",subjectImage:"Liberte")
var laValeurEcologie = SubjectValue(subjectName: "Ecologie", subjectColorRed: 3/255, subjectColorGreen: 113/255,subjectColorBlue: 9/255, subjectEmoji: "leaf",subjectImage:"Ecologie")
var laValeurInclusion = SubjectValue(subjectName: "Inclusivité", subjectColorRed: 245/255, subjectColorGreen: 243/255,subjectColorBlue: 23/255, subjectEmoji: "person.3.sequence",subjectImage:"Inclusion")


// Création du tableau de sujets identifiable pour afficher en format List
var tableauDeValeurs = [laValeurAventure,laValeurConfiance,laValeurGratitude,laValeurPerseverance,laValeurAutodiscipline,laValeurEntente,laValeurSagesse,laValeurCompetence,laValeurBienveillance,laValeurAltruisme,laValeurCreativite,laValeurExcellence,laValeurLiberte,laValeurEcologie,laValeurInclusion]

// Création des évènements
var cafeThomasPesquet = Event(eventPicture: "Thomas Pesquet", eventTitle: "Un café avec Thomas Pesquet", eventSubject: SubjectValue.init(subjectName: "Aventure", subjectColorRed: 19/255, subjectColorGreen: 175/255,subjectColorBlue: 144/255, subjectEmoji: "paperplane.fill",subjectImage:"Aventure"), eventLocation: "Cafeteria", eventTime: "2022/06/05  08:30", eventParticipantsNumber: 7, eventOrganizer: "Cecile Taisne")
var escapeGameChihiro = Event(eventPicture: "Voyage Chihiro", eventTitle: "Escape Game \"Le Voyage de Chihiro\"", eventSubject: SubjectValue.init(subjectName: "Aventure", subjectColorRed: 159/255, subjectColorGreen: 175/255,subjectColorBlue: 144/255, subjectEmoji: "paperplane.fill",subjectImage:"Aventure"), eventLocation: "Game Of Room", eventTime: "2022/06/18  19:30", eventParticipantsNumber: 14, eventOrganizer: "Ludovic Clappier")
var docuTribuTitimonkaka = Event(eventPicture: "Tribu", eventTitle: "Documentaire sur les tribus de Titimonkaka", eventSubject: SubjectValue.init(subjectName: "Aventure", subjectColorRed: 159/255, subjectColorGreen: 175/255,subjectColorBlue: 144/255, subjectEmoji: "paperplane.fill",subjectImage:"Aventure"), eventLocation: "Salle Aramis", eventTime: "2022/06/20  13:30", eventParticipantsNumber: 4, eventOrganizer: "Salim Abdeddaiem")
var atelierCompost = Event(eventPicture: "Compost", eventTitle: "Atelier Creation de Compost", eventSubject: SubjectValue.init(subjectName: "Ecologie", subjectColorRed: 3/255, subjectColorGreen: 113/255,subjectColorBlue: 9/255, subjectEmoji: "leaf",subjectImage:"Ecologie"), eventLocation: "Espace Verdure", eventTime: "2022/07/13  11:30", eventParticipantsNumber: 16, eventOrganizer: "Prune Egidio")
var dediMichelleObama = Event(eventPicture: "Michelle Obama", eventTitle: "Séance de Dédicaces avec Michelle Obama", eventSubject: SubjectValue.init(subjectName: "Confiance", subjectColorRed: 176/255, subjectColorGreen: 10/255,subjectColorBlue: 169/255, subjectEmoji: "cube",subjectImage:"Confiance"), eventLocation: "Salle Avenir", eventTime: "2022/07/30  10:30", eventParticipantsNumber: 28, eventOrganizer: "Sarah NDenbe")
var confFemmesNumerique = Event(eventPicture: "Numerique", eventTitle: "Conférence : Les femmes et les métiers du numérique", eventSubject: SubjectValue(subjectName: "Inclusivité", subjectColorRed: 245/255, subjectColorGreen: 243/255,subjectColorBlue: 23/255, subjectEmoji: "person.3.sequence",subjectImage:"Inclusion"), eventLocation: "Atrium", eventTime: "2022/08/5  13:00", eventParticipantsNumber: 16, eventOrganizer: "Sarah NDenbe")
var atelierCollaboration = Event(eventPicture: "Escape Game", eventTitle: "Atelier sur les bienfaits de la collaboration", eventSubject: SubjectValue.init(subjectName: "Collaboration", subjectColorRed: 254/255, subjectColorGreen: 220/255,subjectColorBlue: 15/255, subjectEmoji: "figure.stand.line.dotted.figure.stand",subjectImage:"Collaboration"), eventLocation: "Salle Kobalt", eventTime: "2022/08/12  12:30", eventParticipantsNumber: 24, eventOrganizer: "Salim Abdeddaiem")

//Création Tableau des évènements

var eventList = [cafeThomasPesquet,escapeGameChihiro,docuTribuTitimonkaka,atelierCompost,dediMichelleObama,confFemmesNumerique,atelierCollaboration]

// Création des users
var ludo = User(userName: "Ludovic C.", userPicture: "LudovicClappier", userFavSub: [laValeurAventure, laValeurAutodiscipline, laValeurEntente], isOrganizer: true, isTalking: false, tabEvents: [escapeGameChihiro, docuTribuTitimonkaka, atelierCompost])
var sarah = User(userName: "Sarah N.", userPicture: "SarahNdenbe", userFavSub: [laValeurConfiance, laValeurCompetence, laValeurLiberte], isOrganizer: true, isTalking: true, tabEvents: [dediMichelleObama, atelierCollaboration, confFemmesNumerique])
var prune = User(userName: "Prune E.", userPicture: "PruneEgidio", userFavSub: [laValeurAventure, laValeurEcologie, laValeurPerseverance], isOrganizer: true, isTalking: true, tabEvents: [atelierCompost, cafeThomasPesquet])
var salim = User(userName: "Salim A.", userPicture: "SalimAbdeddaiem", userFavSub: [laValeurAventure, laValeurAltruisme, laValeurCreativite], isOrganizer: true, isTalking: true, tabEvents: [docuTribuTitimonkaka, atelierCollaboration])
var cecile = User(userName: "Cécile T.", userPicture: "CecileTaisne", userFavSub: [laValeurAventure, laValeurGratitude, laValeurPerseverance], isOrganizer: false, isTalking: true, tabEvents: [cafeThomasPesquet, confFemmesNumerique, escapeGameChihiro])

//Création tableau d'utilisateurs
let userList = [ludo,sarah,prune,salim,cecile]

// Créer une discussion
var chatFirst = Chat(chatValue: laValeurAventure, tabUsers: [prune,ludo])
var chatSnd = Chat(chatValue: laValeurConfiance, tabUsers: [cecile,salim])
var chatTrd = Chat(chatValue: laValeurInclusion,tabUsers: [sarah])
var chatFrth = Chat(chatValue: laValeurBienveillance, tabUsers: [prune,ludo])
var chatFith = Chat(chatValue: laValeurSagesse, tabUsers: [cecile,salim])
var chatSix = Chat(chatValue: laValeurEcologie,tabUsers: [sarah,cecile,salim,ludo])
//var chatFour = Chat(chatValue: [], tabUsers: [])

//Création du tableau de discussions
var tabChatBlabla = [chatFirst,chatSnd,chatTrd,chatFrth,chatFith,chatSix]

func CalculRatioParticipant ()-> Int {
    var ratioFinal : Int = 0
    for i in eventList {
        ratioFinal += i.eventParticipantsNumber
    }
    return ratioFinal
}

func CalculNbParticipantsSubject ( sub : SubjectValue)-> Int {
    var nbParticipantsFinal : Int = 0
    for ev in eventList {
        if(ev.eventSubject.subjectName == sub.subjectName){
            nbParticipantsFinal += ev.eventParticipantsNumber
        }
    }
    return nbParticipantsFinal
}
