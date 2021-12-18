//
//  ContentView.swift
//  DatePIckerExample
//
//  Created by UBS_003 on 17/12/21.
//

import SwiftUI


struct ContentView: View{
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var partialSheetManager : PartialSheetManager
    @State var isloading:Bool = false
    @State var strAlertMsg:String = ""
    @State var isShowAlert:Bool = false
    @State var isPresented:Bool = false
    
    @State var strFirsName:String = ""
    @State var strLastName:String = ""
    @State var strBirthDate:String = ""
    var body: some View {
        
        ZStack{
            VStack{
                HStack{
                    TextField("Choose Date", text: $strBirthDate)
                        .disabled(true)
                        .padding(.leading , 15)
                        .overlay(
                            Button(action: {
                                self.partialSheetManager.showPartialSheet({
                                     print("normal sheet dismissed")
                                }) {
                                    UBDatePicker(strBirthDate: $strBirthDate)
                                }
                            }, label: {
                                HStack{
                                    Spacer()
                                    Image("")
                                        .padding(.trailing , 25)
                                }
                                .frame(height: 50)
                            })
                        )
                }
                .padding(.leading , 15)
                .frame(height: 50)
                .background(Color.white)
                .cornerRadius(15)
                .shadow(color: .black.opacity(0.1), radius: 10, x: 0.0, y: 0.0)
                .padding(.top , 10)
                .padding(.horizontal , 40)
            }
        }
        .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, minHeight: 0, idealHeight: 100, maxHeight: .infinity, alignment: .top)
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    func onClickBack() {
        //
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
        }
        .addPartialSheet()
        .navigationViewStyle(StackNavigationViewStyle())
        .environmentObject(PartialSheetManager())
        
    }
}

