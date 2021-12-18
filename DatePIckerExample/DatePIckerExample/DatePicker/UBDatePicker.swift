//
//  UBDatePicker.swift
//  Tieder
//
//  Created by UBS_003 on 16/12/21.
//

import SwiftUI

struct UBDatePicker: View {
    
    @State var strAlertMsg:String = ""
    @State var isShowAlert:Bool = false
    @State var isPresented:Bool = false
    @Binding var strBirthDate:String
    @State var selectedYear = "1999"
    @State var selectedMonth = 3
    @State var selectedDateID = UUID()
    @State var selectedDate:String = "19"
    @State var arrMonth = ["Jan","Feb","March","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"]
    @State var isEditing = "year"
    @State fileprivate var arrDate:[DateCellRow] = []
    
    
    var body: some View {
        
        VStack {
            Group {
                VStack{
                    HStack{
                        Text("Birthday")
                            .font(.system(size: 15))
                            .foregroundColor(Color.COLOR_245_87_120)
                    }
                    .padding(.top , 56)
                    
                    HStack{
                        Button(action: {
                            onClickBackword()
                        }, label: {
                            Image("iconPathBack")
                        })
                        .frame(width: 24, height: 24)
                        Spacer()
                        
                        Button(action: {
                            isEditing = "year"
                        }, label: {
                            Text(selectedYear)
                                .font(.system(size: 35))
                                .foregroundColor(Color.COLOR_79)
                        })
                        
                        Spacer()
                        Button(action: {
                            onClickForword()
                        }, label: {
                            Image("iconPathBack")
                                .rotationEffect(Angle(degrees: 180))
                        })
                        .frame(width: 24, height: 24)
                    }
                    .frame(height: 40)
                    .padding(.top , 2)
                    .padding(.horizontal , 40)
                    
                    HStack{
                        Button(action: {
                            isEditing = "month"
                        }, label: {
                            Text("\(arrMonth[selectedMonth])")
                                .font(.system(size: 15))
                                .foregroundColor(Color.COLOR_79)
                        })
                    }
                    .padding(.top , 9)
                    
                    VStack{
                        ForEach(arrDate){ row in
                            HStack(){
                                ForEach(row.cells){ tdate in
                                    dateItemView(cell: tdate, selectedDateID: $selectedDateID, selectedDate: $selectedDate)
                                        
                                }
                               
                            }
                            .frame(width: DeviceSize.width - 80 ,alignment:.leading)
                            .padding(.trailing , 40)
                        }
                        Spacer()
                    }
                    .padding(.top , 21)
                }
            }
            .padding()
            .frame(width: DeviceSize.width, height: 400, alignment: .bottom)
        }
        .onAppear(){
            reloadDate()
        }
        .onChange(of: selectedDate, perform: { value in
            setDate()
        })
    }
    
    func setDate(){
        strBirthDate = "\(selectedDate)/\(selectedMonth)/\(selectedYear)"
    }
    
    func onClickBackword(){
        if isEditing == "year"{
            let year = (selectedYear as NSString).integerValue
            selectedYear = "\(year - 1)"
            reloadDate()
        }
        else if isEditing == "month"{
            if(selectedMonth > 0){
                selectedMonth  -= 1
                reloadDate()
            }
        }
        setDate()
    }
    
    func onClickForword(){
        if isEditing == "year"{
            let year = (selectedYear as NSString).integerValue
            selectedYear = "\(year + 1)"
            reloadDate()
        }
        else if isEditing == "month"{
            if(selectedMonth < arrMonth.count - 1){
                selectedMonth  += 1
                reloadDate()
            }
        }
        setDate()
    }
    
    private func reloadDate(){
        arrDate.removeAll()
        addData()
        if(selectedMonth % 2 == 0){
            let dataRow2 = DateCellRow(cells: [dateItem(dateItem: "29"),
                                               dateItem(dateItem: "30"),
                                               dateItem(dateItem: "31")
            ])
            arrDate.append(dataRow2)
        }
        else{
            if selectedMonth == 1{
                if isLeapYear(){
                    let dataRow2 = DateCellRow(cells: [dateItem(dateItem: "29")
                    ])
                    arrDate.append(dataRow2)
                }
            }else{
                let dataRow2 = DateCellRow(cells: [dateItem(dateItem: "29"),
                                                   dateItem(dateItem: "30")
                ])
                arrDate.append(dataRow2)
            }
        }
    }
    
    func addData(){
        var dataRowArr:[dateItem] = []
        for i in 1...32{
            let datacell = dateItem(dateItem: "\(i)")
            dataRowArr.append(datacell)
            if i % 7 == 0{
                let dataRow = DateCellRow(cells: dataRowArr)
                arrDate.append(dataRow)
                dataRowArr.removeAll()
            }
        }
    }
    
    func isLeapYear()->Bool{
        if Int(selectedYear)! % 4 == 0{
            return true
        }else{
            return false
        }
    }
    
}

//struct UBDatePicker_Previews: PreviewProvider {
//    static var previews: some View {
//        UBDatePicker()
//    }
//}


fileprivate struct dateItemView : View {
    var cell : dateItem
    @Binding var selectedDateID:UUID
    @Binding var selectedDate:String
    var body: some View{
        ZStack{
            ZStack{
                Text(cell.dateItem)
                    .foregroundColor(isSelected() ? Color.white : Color.black)
                    .font(.system(size: 14, weight: isSelected() ? .bold : .regular))
            }.frame(width: 29, height: 29)
            .background(isSelected() ? Color.COLOR_245_87_120 : Color.white )
            .cornerRadius(10)
        }
        .frame(width: (DeviceSize.width - 80)  / 7, height: 43)
        .onTapGesture {
            selectedDateID = cell.id
            selectedDate = cell.dateItem
        }
    }
    
    func isSelected()-> Bool{
        //selectedDateID == cell.id
        if cell.dateItem == selectedDate{
            return true
        }else{
            return false
        }
    }
}


fileprivate class dateItem: ObservableObject,Identifiable {
    @Published var id = UUID()
    @Published var dateItem: String = ""
    
    
    init(dateItem:String) {
        self.dateItem = dateItem
    }
}

fileprivate class DateCellRow: ObservableObject,Identifiable {
    @Published var id = UUID()
    @Published var cells:[dateItem]
    init(cells:[dateItem]) {
        self.cells = cells
    }
}
