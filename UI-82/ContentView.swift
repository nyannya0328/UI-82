//
//  ContentView.swift
//  UI-82
//
//  Created by にゃんにゃん丸 on 2020/12/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home : View {
    @State var selected = servers.first!
    
    @State var isServedOn = false
    
    @State var issmall = UIScreen.main.bounds.height < 750
    var body: some View{
        
        VStack{
            HStack{
                
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName:"circle.grid.cross")
                        .foregroundColor(.white)
                        .padding(10)
                        .background(RoundedRectangle(cornerRadius: 10).stroke(Color.white.opacity(0.2),lineWidth: 2))
                    
                    
                    
                })
                Spacer()
                
                Button(action: {}, label: {
                    HStack{
                        
                        Image(systemName: "crown.fill")
                            .foregroundColor(.white)
                        
                        Text("Premium")
                            .fontWeight(.heavy)
                            .font(.caption)
                            .foregroundColor(.white)
                        
                    }
                    .padding(.vertical)
                    .padding(.horizontal)
                    .background(Color.black.opacity(0.3))
                    .clipShape(Capsule())
                })
                
            }
            .padding()
            
            ScrollView(.horizontal, showsIndicators: false, content: {
                HStack(spacing:15){
                    
                    ForEach(servers){server in
                        
                        Image(server.flag)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 45, height: 45)
                            .clipShape(Circle())
                            .onTapGesture {
                                withAnimation{selected = server}
                            }
                            .padding(10)
                            .background(
                                
                                Circle()
                                    .stroke(Color.white.opacity(selected.id == server.id ? 1 :0),lineWidth: 2)
                            
                            )
                        
                    }
                    
                    
                }
                .padding()
            })
            
            
            ZStack{
                
              
                    
                    Image("w")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.main.bounds.width - 40)
                    
                
                
                
                
                VStack(spacing:15){
                    
                    if isServedOn{
                        
                        Text(selected.name)
                            .font(.caption)
                        
                    }
                    
                    
                    
                    Text(isServedOn ? "Connected" : "Not Connect")
                       
                        .fontWeight(.heavy)
                        .padding(.leading)
                        .foregroundColor(.white)
                    
                    if isServedOn{
                        
                        HStack{
                            
                            Image(selected.flag)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 25)
                                .clipShape(Circle())
                           
                            if selected.id == "0"{
                                
                                Text("USA")
                            }
                            else{Text("????")}
                            
                        }
                        .foregroundColor(.white)
                    }
                    
                    
                    
                }
                .offset(y: +10)
                
                
                
            }
            .padding(.vertical,isServedOn ? 0 : 25)
            
            ZStack(alignment: Alignment(horizontal: .center, vertical: isServedOn ? .bottom : .top), content: {
                
                
                Capsule()
                    .fill(Color(isServedOn ? . gray : .purple))
                
                VStack{
                    
                    if !isServedOn{Spacer()}
                    
                    Image(systemName: "chevron.\(isServedOn ? "up" : "down")")
                        .font(.system(size: 28, weight: .bold))
                    
                    Image(systemName: "chevron.\(isServedOn ? "up" : "down")")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(.white)
                    
                    if isServedOn{Spacer()}
                    
                    
                    
                    
                    
                }
                .offset(y: isServedOn ? 25 : -25)
                
                
               
                
                
                ZStack{
                    Capsule()
                        .fill(Color(isServedOn ? .purple : .orange))
                        .frame(height: 180)
                        .padding(10)
                    
                    
                    VStack{
                        
                        
                        Capsule()
                            .fill(Color(isServedOn ? .red : .blue))
                            .frame(width: 30, height: 5)
                        
                        Text(isServedOn ? "STOP" : "START")
                            .fontWeight(.heavy)
                            .foregroundColor(.green)
                        
                        
                        Image(systemName: "power")
                            .font(.system(size: 25, weight: .heavy))
                            .foregroundColor(.white)
                            .padding(10)
                            .background(Color.white.opacity(0.3))
                            .clipShape(Circle())
                        
                        
                    }
                    
                    
                }
                
                .onTapGesture {
                    withAnimation{isServedOn.toggle()}
                }
                
            })
            .padding(.bottom,issmall ? 5 : 15)
            .frame(width: 130)
            
            
            .background(
                ZStack{
                    
                    Rings(width: UIScreen.main.bounds.width / 2, isServedOn: $isServedOn)
                        .offset(y: 70)
                    
                    Rings(width: UIScreen.main.bounds.width / 1.6, isServedOn: $isServedOn)
                        .offset(y: 80)
                    Rings(width: UIScreen.main.bounds.width / 1.2, isServedOn: $isServedOn)
                        .offset(y: 90)
                    Rings(width: UIScreen.main.bounds.width / 1.1, isServedOn: $isServedOn)
                        .offset(y: 100)
                    Rings(width: UIScreen.main.bounds.width, isServedOn: $isServedOn)
                        .offset(y: 100)
                   
                        
                }
                .padding(.vertical,issmall ? 10 : 60)
               
            )
            
          
            
            
        }
        .background(
            LinearGradient(gradient: .init(colors: [isServedOn ? .blue : .red,Color(isServedOn ? .green : .purple)]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea(.all, edges: .all)
                .animation(.easeIn)
                
        )
        .preferredColorScheme(.dark)
        
        
    }
    
    
    
   
}

func getsize(index : Int) -> CGFloat{
    
    if index < 10 || index < 50{return 3}
    if index >= 10 && index < 20{return 4}
    if index >= 40 && index <= 50{return 4}
    else{return 5}
    
}


struct Rings : View {
    var width : CGFloat
    @Binding var isServedOn : Bool
    
    
    var body: some View{
        
        ZStack{
            
            ForEach(1...60,id:\.self){index in
                
                Circle()
                    .fill(Color(isServedOn ? .blue : .green))
                    .frame(width: getsize(index: index), height: getsize(index: index))
                    .offset(y: -(width / 2))
                    .rotationEffect(.init(degrees: Double(index * 6)))
                    .opacity(getsize(index: index) == 3 ? 0.7 : (isServedOn ? 1 : 0.8))
                
                
                
            }
            
        }
        
        
        
        
    }
}

struct server : Identifiable {
    var id = UUID().uuidString
    var name : String
    var flag : String
}

var servers = [

    server(id:"0",name: "イギリス", flag: "b"),
    server(name: "キューバ", flag: "c"),
    server(name: "スェーデン", flag: "h"),
    server(name: "日本", flag: "j"),
    server(name: "スイス", flag: "s"),
    server(name: "USA", flag: "USA"),
    
   
    
    

]

