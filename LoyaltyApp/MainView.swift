//
//  MainView.swift
//  LoyaltyApp
//
//  Created by Justin Edgington on 1/22/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .toolbarBackground(Color.white, for: .tabBar)
            MerchantView()
                .tabItem {
                    Image(systemName: "storefront.fill")
                    Text("Merchants")
                }
                .toolbarBackground(Color.white, for: .tabBar)
            MyVoucherView()
                .tabItem {
                    Image(systemName: "ticket.fill")
                    Text("My Voucher")
                }
                .toolbarBackground(Color.white, for: .tabBar)
            Text("Activity")
                .tabItem {
                    Image(systemName: "doc.text.fill")
                    Text("Activity")
                }
                .toolbarBackground(Color.white, for: .tabBar)
            Text("Account")
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Account")
                }
                .toolbarBackground(Color.white, for: .tabBar)
        }.navigationBarBackButtonHidden(true)
    }
}

struct HomeView: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color(hex: "#f53f5d")
                    .ignoresSafeArea()
                VStack {
                    HStack {
                        Image(systemName: "pawprint.fill")
                            .foregroundColor(.white)
                            .font(.title)
                        Spacer()
                        Text("Loyalty App")
                            .foregroundColor(.white)
                            .font(.title)
                            .bold()
                        Spacer()
                        Image(systemName: "bell")
                            .foregroundColor(.white)
                            .font(.title)
                    }.padding()
                    /* Points display */
                    VStack {
                        HStack {
                            VStack {
                                Image(systemName: "star.fill")
                                    .font(.title)
                                    .foregroundColor(.purple)
                                //TODO: Change to badge corresponding to actual ranking
                            }
                            Spacer()
                            VStack(alignment: .leading) {
                                Text("Your Points")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                Spacer().frame(height: geometry.size.height * 0.01)
                                HStack {
                                    Text("249,560")
                                        .font(.title)
                                        .bold()
                                    Text("($249.56)")
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                }
                            }
                            Spacer()
                            VStack {
                                Image(systemName: "chevron.right")
                            }
                        }.padding()
                    }.frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.15)
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: (geometry.size.width * 0.025)))
                    Spacer()
                }
                VStack {
                    Spacer()
                    ZStack {
                        Color(hex: "#f5f5f5")
                            .clipShape(CurvedTopShape())
                            .ignoresSafeArea()
                        VStack {
                            VStack {
                                Spacer().frame(height: geometry.size.height * 0.025)
                                HStack {
                                    Text("Popular Merchants")
                                        .font(.headline)
                                    Spacer()
                                    Text("View All")
                                        .font(.headline)
                                    Image(systemName: "arrow.right")
                                }
                                Spacer().frame(height: geometry.size.height * 0.025)
                                HStack {
                                    VStack {
                                        Image(systemName: "apple.logo")
                                            .font(.largeTitle)
                                        Text("Apple")
                                            .font(.subheadline)
                                    }
                                    Spacer()
                                }
                            }
                            Spacer().frame(height: geometry.size.height * 0.05)
                            VStack {
                                HStack {
                                    Text("Promo & Rewards")
                                        .font(.headline)
                                    Spacer()
                                    Text("View All")
                                        .font(.headline)
                                    Image(systemName: "arrow.right")
                                }
                                Spacer().frame(height: geometry.size.height * 0.025)
                                GeometryReader { scrollGeo in
                                    ScrollView(.horizontal, showsIndicators: false) {
                                        HStack(spacing: geometry.size.width * 0.05) {
                                            ForEach(0..<5) { _ in
                                                VStack {
                                                    Image("Banner")
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fill)
                                                    VStack {
                                                        HStack {
                                                            Text("Get Free 1 Cup Coffee E-Voucher ?")
                                                                .bold()
                                                            Spacer()
                                                        }
                                                        Spacer()
                                                        HStack {
                                                            Text("3,750 points")
                                                                .font(.caption)
                                                                .foregroundStyle(.gray)
                                                            Circle()
                                                                .frame(height: geometry.size.height * 0.0025)
                                                                .foregroundStyle(.gray)
                                                            Text("Starbucks")
                                                                .font(.caption)
                                                                .foregroundStyle(Color(hex: "f53f5d"))
                                                            Spacer()
                                                        }
                                                        Spacer()
                                                    }
                                                    .frame(height: scrollGeo.size.height * 0.4)
                                                    .padding(.leading)
                                                }
                                            }
                                            .frame(width: geometry.size.width * 0.8, height: geometry.size.height * 0.25)
                                            .background(Color.white)
                                        }
                                    }
                                }
                            }
                        }.padding()
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                        .padding(.top, geometry.size.height * 0.075)
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.68)
                }
                // Quick action box
                VStack {
                    HStack {
                        Spacer()
                        VStack {
                            Image(systemName: "scroll")
                                .foregroundColor(Color(hex: "f53f5d"))
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            Text("Recipt Photo")
                                .font(.subheadline)
                        }
                        Spacer()
                        VStack {
                            Image(systemName: "qrcode.viewfinder")
                                .foregroundColor(Color(hex: "f53f5d"))
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            Text("Scan QR Code")
                                .font(.subheadline)
                        }
                        Spacer()
                        VStack {
                            Image(systemName: "storefront")
                                .foregroundColor(Color(hex: "f53f5d"))
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            Text("My Stores")
                                .font(.subheadline)
                        }
                        Spacer()
                    }.padding()
                }
                .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.115)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: (geometry.size.width * 0.025)))
                .padding(.bottom, geometry.size.height * 0.3) //Controlls positioning (more = closer to top)
            }
        }
    }
}

struct MerchantView: View {
    @State private var textInput = ""
    @State private var selectedTags = Set<String>()
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color(hex: "f5f5f5")
                    .ignoresSafeArea()
                VStack {
                    HStack {
                        Image(systemName: "pawprint.fill")
                            .foregroundColor(Color(hex: "f53f5d"))
                            .font(.title)
                        Spacer()
                        Text("Merchants")
                            .foregroundColor(.black)
                            .font(.title)
                            .bold()
                        Spacer()
                        Image(systemName: "slider.vertical.3")
                            .foregroundColor(.black)
                            .font(.title)
                    }.padding()
                    
                    HStack {
                        CustomTextField(text: $textInput, placeholder: "Search Merchants...", systemImage: "magnifyingglass")
                    }.frame(width: UIScreen.main.bounds.width * 0.9)
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: (geometry.size.width * 0.025)))
                        VStack {
                            HStack {
                                VStack {
                                    VStack {
                                        Image(systemName: "apple.logo")
                                            .font(.largeTitle)
                                    }
                                    VStack {
                                        Text("Apple")
                                            .font(.headline)
                                        Text("Technology")
                                            .font(.subheadline)
                                            .foregroundStyle(Color(hex: "f53f5d"))
                                    }.padding()
                                }.frame(width: geometry.size.width * 0.35)
                                    .padding()
                                    .background(.white)
                                    .clipShape(RoundedRectangle(cornerRadius: geometry.size.width * 0.025))
                                    
                                Spacer()
                                
                                VStack {
                                    VStack {
                                        Image(systemName: "apple.logo")
                                            .font(.largeTitle)
                                    }
                                    VStack {
                                        Text("Apple")
                                            .font(.headline)
                                        Text("Technology")
                                            .font(.subheadline)
                                            .foregroundStyle(Color(hex: "f53f5d"))
                                    }.padding()
                                }.frame(width: geometry.size.width * 0.35)
                                    .padding()
                                    .background(.white)
                                    .clipShape(RoundedRectangle(cornerRadius: geometry.size.width * 0.025))
                            }.padding()
                    }
                    Spacer()
                }
            }
        }
    }
}

struct CustomTextField: View {
    @Binding var text: String
    var placeholder: String
    var systemImage: String

    var body: some View {
        HStack {
            Image(systemName: systemImage)
                .foregroundColor(.gray)
            TextField(placeholder, text: $text)
                .textFieldStyle(PlainTextFieldStyle())
        }
        .padding()
        
        
    }
}

struct MyVoucherView: View {
    @State private var selectedTab = 0
    let tabs = ["Tab 1", "Tab 2"]

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color(hex: "f5f5f5")
                    .ignoresSafeArea()
                VStack {
                    HStack {
                        Image(systemName: "pawprint.fill")
                            .foregroundColor(Color(hex: "f53f5d"))
                            .font(.title)
                        Spacer()
                        Text("My Voucher")
                            .foregroundColor(.black)
                            .font(.title)
                            .bold()
                        Spacer()
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.black)
                            .font(.title)
                    }.padding()

                    // Custom top tab bar
                    HStack {
                        ForEach(0..<tabs.count) { index in
                            Button(action: {
                                selectedTab = index
                            }) {
                                Text(tabs[index])
                                    .foregroundColor(selectedTab == index ? .black : .gray)
                                    .padding()
                                    .background(selectedTab == index ? Color.blue : Color.clear)
                            }
                        }
                    }

                    // Content based on selected tab
                    if selectedTab == 0 {
                        Text("Tab 1 View")
                    } else if selectedTab == 1 {
                        Text("Tab 2 View")
                    }

                    Spacer()
                }
            }
        }
    }
}

struct ActivityView: View {
    var body: some View {
        ZStack {
            
        }
    }
}

struct AccountView: View {
    var body: some View {
        ZStack {
            
        }
    }
}

#Preview {
    MainView()
}
