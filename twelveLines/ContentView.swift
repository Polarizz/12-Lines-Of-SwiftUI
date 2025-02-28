import SwiftUI; struct ContentView: View { @State var plusTapped = false; @State var menuTapped = false; @State var orderTapped = false; @State var payTapped = false; var body: some View { VStack { if menuTapped || payTapped { Text("Back to Home") } else { Text(orderTapped ? "Proceed to Shipping" : (plusTapped ? "Go to Review & Pay" : "Got to Editor")); Text(orderTapped ? "Back to Editor" : (plusTapped ? "Back to Home" : "Go to Settings")) } } .foregroundStyle(.blue) .frame(maxWidth: .infinity, maxHeight: .infinity) .overlay(HStack(spacing: 24) { if (plusTapped || menuTapped) && !payTapped { Image(systemName: "chevron.left").padding(11).background(Color.black).clipShape(Circle()).onTapGesture { plusTapped = false; menuTapped = false; orderTapped = false } }; if !menuTapped { HStack(spacing: 8) { if payTapped { Image(systemName: "xmark") } else if orderTapped { Text("Continue to pay") } else if !plusTapped { Image(systemName: "plus") } else { Image(systemName: "photo.badge.plus.fill"); Spacer(); Image(systemName: "rectangle.split.2x2.fill"); Spacer(); Image(systemName: "character.cursor.ibeam") } } .padding(EdgeInsets(top: 16, leading: 24, bottom: 16, trailing: 24)).background(Color.black).clipShape(Capsule()).onTapGesture { if payTapped { plusTapped = false; menuTapped = false; orderTapped = false; payTapped = false } else { orderTapped ? (payTapped = true) : (plusTapped = true) } } }; if !orderTapped { Text(menuTapped ? "Logout" : (plusTapped ? "Order" : "Menu")).font(.system(size: 13, weight: .medium)).padding(EdgeInsets(top: 9, leading: 9, bottom: 9, trailing: 9)).foregroundStyle(menuTapped ? .black : .white).background(menuTapped ? Color.white : Color.black).clipShape(Capsule()).overlay(Capsule().stroke(menuTapped ? Color(.tertiaryLabel) : Color.black, lineWidth: 2)).onTapGesture { plusTapped ? (orderTapped = true) : (menuTapped = true) } } } .foregroundStyle(.white).padding(), alignment: .bottom) .animation(.snappy(duration: 0.39, extraBounce: 0.3)) } }

/// 12 lines? Doable in 1 line
///
/// But in all honesty, this took me1 hour. Is Rive better than SwiftUI, depends what kind of skill issue you have.
/// Realistically this will take around 100 lines with proper formatting and such.


//import SwiftUI
//
//struct ContentView: View {
//  @State var plusTapped = false
//  @State var menuTapped = false
//  @State var orderTapped = false
//  @State var payTapped = false
//
//  var body: some View {
//    VStack {
//      if menuTapped || payTapped { Text("Back to Home") }
//      else {
//        Text(orderTapped ? "Proceed to Shipping" : (plusTapped ? "Go to Review & Pay" : "Got to Editor"))
//        Text(orderTapped ? "Back to Editor" : (plusTapped ? "Back to Home" : "Go to Settings"))
//      }
//    }
//    .foregroundStyle(.blue)
//    .frame(maxWidth: .infinity, maxHeight: .infinity)
//    .overlay(
//      HStack(spacing: 24) {
//        if (plusTapped || menuTapped) && !payTapped {
//          Image(systemName: "chevron.left")
//            .padding(11)
//            .background(Color.black)
//            .clipShape(Circle())
//            .onTapGesture { plusTapped = false; menuTapped = false; orderTapped = false }
//        }
//        if !menuTapped {
//          HStack(spacing: 8) {
//            if payTapped { Image(systemName: "xmark") }
//            else if orderTapped { Text("Continue to pay") }
//            else if !plusTapped { Image(systemName: "plus") }
//            else {
//              Image(systemName: "photo.badge.plus.fill"); Spacer()
//              Image(systemName: "rectangle.split.2x2.fill"); Spacer()
//              Image(systemName: "character.cursor.ibeam")
//            }
//          }
//          .padding(.vertical, 16)
//          .padding(.horizontal, 24)
//          .background(Color.black)
//          .clipShape(Capsule())
//          .onTapGesture {
//            if payTapped { plusTapped = false; menuTapped = false; orderTapped = false; payTapped = false }
//            else { orderTapped ? (payTapped = true) : (plusTapped = true) }
//          }
//        }
//        if !orderTapped {
//          Text(menuTapped ? "Logout" : (plusTapped ? "Order" : "Menu"))
//            .font(.system(size: 13, weight: .medium))
//            .padding(9)
//            .foregroundStyle(menuTapped ? .black : .white)
//            .background(menuTapped ? Color.white : Color.black)
//            .clipShape(Capsule())
//            .overlay(Capsule().stroke(menuTapped ? Color(.tertiaryLabel) : Color.black, lineWidth: 2))
//            .onTapGesture { plusTapped ? (orderTapped = true) : (menuTapped = true) }
//        }
//      }
//      .foregroundStyle(.white)
//      .padding(), alignment: .bottom
//    )
//    .animation(.snappy(duration: 0.39, extraBounce: 0.3))
//  }
//}
