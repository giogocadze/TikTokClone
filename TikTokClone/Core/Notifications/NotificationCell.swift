import SwiftUI

struct NotificationCell: View {

    var notificationText: AttributedString {
        var result = AttributedString()

        var username = AttributedString("exampleUser")
        username.font = .system(size: 13, weight: .semibold)

        var message = AttributedString(" exampleUserdasdasdajsidijoasdijo ")
        message.font = .system(size: 13, weight: .semibold)

        var time = AttributedString("exampleUser")
        time.font = .system(size: 12, weight: .regular)
        time.foregroundColor = .gray

        result.append(username)
        result.append(message)
        result.append(time)

        return result
    }

    var body: some View {
        HStack(alignment: .top) {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 32, height: 32)
                .foregroundStyle(Color(.systemGray5))

            Text(notificationText)
                .multilineTextAlignment(.leading)

            Spacer()

            Rectangle()
                .frame(width: 50, height: 50)
                .clipShape(RoundedRectangle(cornerRadius: 6))
        }
        .padding(.horizontal)
    }
}

#Preview {
    NotificationCell()
}

