import SwiftUI
import SwiftUICharts

struct StatView: View {
    @State var mois : String = "Juin"
    @State var ratioNbParticipants = 0 // Sarah a ajouté ça
    var body: some View {
        VStack {
            
           // Sarah a changé ça
                
                    BarChartView(data: ChartData(values: [("Diversité", 12),
                                                          ("Confiance", 22),
                                                          ("Ecologie", 7),
                                                          ("Inclusivité", 3),
                                                          ("Aventure", 25)]),
                                 title: "Juin")
                    /*
                    ForEach(eventList){ ev in
                    BarChartView(data: ChartData(values:
                                                    ForEach ([ev]){ val in { [(val.eventSubject,val.eventParticipantsNumber)]}}),
                                 title: "Juin")
                    }
                     */
                    
               
                
                HStack {
                    Text ("On Fire en \(mois)")
                        .font(.title)
                        .bold()
                        .foregroundStyle(.orange)
                    
                    Image (systemName: "flame.fill")
                        .foregroundColor(.red)
                        .font(.largeTitle)
                    
                    
                }
                
                ZStack{
                    /*
                     Rectangle()
                     .cornerRadius(25)
                     .foregroundColor(.black)
                     .opacity(0.1)
                     .frame(width: 350, height: 300, alignment: .leading)
                     
                     .padding()
                     */ // Sarah dit que ce rectangle n'est pas utile
                    VStack (alignment: .leading, spacing: 30){
                        ScrollView(.horizontal){ // Sarah a ajouté ça
                            
                            HStack{
                                ForEach(eventList){ev in
                                    ExtractedViewPodium(sub: ev.eventSubject)}
                                
                            }
                        }
                    }
                }
            }
        }
    }


struct ExtractedViewPodium : View {
    var sub : SubjectValue
    var coeffi : Double { Double(100*CalculNbParticipantsSubject(sub: sub)/CalculRatioParticipant())}
    var body: some View {
        
        ZStack{ // Sarah dit Extracted view nécessaire
            Circle()
                .fill(LinearGradient(gradient: Gradient(colors: [Color(.white), Color(red: sub.subjectColorRed, green: sub.subjectColorGreen, blue: sub.subjectColorBlue)]), startPoint: .bottom, endPoint: .top))
            VStack {
                Image(systemName: sub.subjectEmoji)
                    .font(.largeTitle).foregroundColor(.white)
                Text(sub.subjectName)
                    .font(.title)
                    .foregroundColor(Color(red: sub.subjectColorRed, green: sub.subjectColorGreen, blue: sub.subjectColorBlue))
                    .shadow(color: .white, radius: 0, x: 1, y: 1)
                    .shadow(color: .white, radius: 0, x: 1, y: -1)
                    .shadow(color: .white, radius: 0, x: -1, y: 1)
                    .shadow(color: .white, radius: 0, x: -1, y: -1)
            }
        }.frame(width: 10*CGFloat(coeffi), height: 10*CGFloat(coeffi), alignment: .bottom)
    }
}

struct StatView_Previews: PreviewProvider {
    static var previews: some View {
        StatView()
        ExtractedViewPodium(sub: laValeurAventure)
    }
}







