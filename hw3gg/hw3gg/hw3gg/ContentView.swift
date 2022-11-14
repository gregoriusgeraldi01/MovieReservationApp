//
//  ContentView.swift
//  hw3gg
//
//  Created by User10 on 14/11/22.
//

import SwiftUI

struct ContentView: View {
    var movie = ["Green Book", "Doctor Strange", "1917", "Joker"]
    var time = ["(10:00)" , "(15:00)" , "(21:00)"]
    @State private var selectedmovie = "Green Book"
    @State private var selectedtime = "Morning (10:00)"
    @State private var voucher = false
    @State private var done = false
    @State private var date = Date()
    @State private var person: CGFloat = 1
    @State private var name = ""
    @State private var vouchercode = ""
    @State private var number = ""
    @State private var email = ""
    var body: some View {
        VStack{
            Form{
                VStack{
                    Image("cinema\(selectedmovie)")
                        .resizable()
                        .padding()
                        .scaledToFill()
                }
                Group{
                    Text("Movie")
                    Picker(selection: $selectedmovie, label: Text("")) {
                        ForEach(movie, id: \.self) { (role) in
                            Text(role)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    Text("Fill Your Identity")
                    HStack{
                        Text("Name :")
                        TextField("your name", text: $name)
                    }
                    HStack{
                        Text("Phone Number :")
                        TextField("number", text: $number)
                    }
                    HStack{
                        Text("Email Address :")
                        TextField("email address", text: $email)
                    }
                    Toggle("Discount Code ", isOn : $voucher)
                    if(voucher) {
                        HStack{
                            Text("Enter Discount Code :")
                            TextField("Discount Code", text: $vouchercode)
                        }
                    }
                    Text("\nBooking Request")
                    HStack {
                        Text("Person : \(Int(person))")
                        Slider(value: $person, in: 1...10, step: 1) {
                            Text("")
                        }
                    }
                }
                Group{
                    DatePicker("Date", selection: $date, in: Date()..., displayedComponents: .date)
                }
                Text("Time")
                Picker(selection: $selectedtime, label: Text("")) {
                    ForEach(time, id: \.self) { (role) in
                        Text(role)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())            }
            Button(action: {
                 self.done = true
            }) {
                 Text("ORDER")
                }
                 .actionSheet(isPresented: $done) {
                    ActionSheet(title: Text("RESERVATION SUCEED!"), message: Text("The reservation ticket for " + name + "has been sent to: " + email), buttons: [.default(Text("OK"))])
                  }.buttonStyle(PlainButtonStyle())
        }
   }}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
