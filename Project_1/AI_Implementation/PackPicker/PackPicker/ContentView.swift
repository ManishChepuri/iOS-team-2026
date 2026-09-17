import SwiftUI

struct ContentView: View {
    // @State is how a view remembers something *and* redraws when it changes.
    @State private var category: Category = .food
    @State private var pick: Option?
    @State private var history: [Option] = []

    var body: some View {
        VStack(spacing: 20) {
            header
            categoryPicker
            resultCard
            rollButton
            historyList
            Spacer(minLength: 0)
        }
        .padding()
        .background(Color(.systemGroupedBackground))
        .onChange(of: category) {
            pick = nil
        }
    }

    // MARK: - Pieces

    private var header: some View {
        VStack(spacing: 4) {
            Text("PackPicker")
                .font(.largeTitle.bold())
            Text("You can't decide. I can.")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
    }

    private var categoryPicker: some View {
        Picker("Category", selection: $category) {
            ForEach(Category.allCases) { item in
                Text(item.rawValue).tag(item)
            }
        }
        .pickerStyle(.segmented)
    }

    private var resultCard: some View {
        VStack(spacing: 12) {
            if let pick {
                Text(pick.emoji)
                    .font(.system(size: 72))
                Text(pick.name)
                    .font(.title.bold())
                    .multilineTextAlignment(.center)
                if let note = pick.note {
                    Text(note)
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
            } else {
                Image(systemName: category.symbol)
                    .font(.system(size: 56))
                    .foregroundStyle(.secondary)
                Text("Hit the button.")
                    .font(.headline)
                    .foregroundStyle(.secondary)
            }
        }
        .frame(maxWidth: .infinity, minHeight: 220)
        .padding()
        .background(Color(.systemBackground), in: RoundedRectangle(cornerRadius: 24))
        .shadow(color: .black.opacity(0.08), radius: 10, y: 4)
    }

    private var rollButton: some View {
        Button {
            roll()
        } label: {
            Label("Pick for me", systemImage: "dice.fill")
                .font(.headline)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 6)
        }
        .buttonStyle(.borderedProminent)
        .controlSize(.large)
        .tint(category.tint)
    }

    @ViewBuilder
    private var historyList: some View {
        if !history.isEmpty {
            VStack(alignment: .leading, spacing: 8) {
                Text("RECENT")
                    .font(.caption.bold())
                    .foregroundStyle(.secondary)
                ForEach(history.prefix(4)) { item in
                    HStack(spacing: 8) {
                        Text(item.emoji)
                        Text(item.name)
                        Spacer()
                    }
                    .font(.callout)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

    // MARK: - Logic

    private func roll() {
        // Don't pick the same thing twice in a row.
        let choices = category.options.filter { $0.name != pick?.name }

        guard let winner = choices.randomElement() else { return }

        withAnimation(.spring()) {
            pick = winner
            history.insert(winner, at: 0)
        }
    }
}

#Preview {
    ContentView()
}
