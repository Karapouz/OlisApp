import SwiftUI
import SwiftUICharts

struct TableauDeStat: View {
    var body: some View {
        NavigationView{
            ScrollView(.vertical){
               
                /*
                ForEach(eventList){ ev in
                BarChartView(data: ChartData(values:
                                                ForEach ([ev]){ val in { [(val.eventSubject,val.eventParticipantsNumber)]}}),
                             title: "Juin")
                }
                 */
                StatView()
            }.navigationTitle("Statistiques")
            
        }
    }
}
struct TableauDeStat_Previews: PreviewProvider {
    static var previews: some View {
        TableauDeStat()
    }
}


