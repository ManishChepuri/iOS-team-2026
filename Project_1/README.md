# Project 1 — PackPicker

App Dev Club @ NC State · iOS Team 2026 · Weeks 2–3

A big button that decides for you. Pick a category (Food / Study / Chaos), tap
**Pick for me**, get a random option with an emoji and a snarky note. Recent
picks stack below. Everyone fills it with their own options, so nobody's app
looks the same.

Open `PackPicker.xcodeproj` and hit ⌘R.

## Concepts

Swift syntax · `let`/`var` · arrays · optionals · `struct` · `enum` · `switch` ·
SwiftUI views and modifiers · `@State` · bindings · `ForEach`

## Files

| File | What's in it |
|---|---|
| `PackPicker/PackPickerApp.swift` | The `@main` entry point. Untouched from the template. |
| `PackPicker/Option.swift` | Milestone 4 — the `Option` struct. |
| `PackPicker/Category.swift` | Milestone 5 — the `Category` enum and its options. |
| `PackPicker/ContentView.swift` | Milestones 1, 2, 3, 6 — the whole UI and the roll logic. |

## The teaching sequence — 6 milestones

Teach it in this order. Every milestone runs. Never let anyone go more than
~10 minutes without hitting ⌘R.

### Milestone 1 — Variables and a button
*Concepts: `let`/`var`, String, `@State`, `Button`, closures*

```swift
struct ContentView: View {
    @State private var pick = "Tap the button"

    var body: some View {
        VStack(spacing: 20) {
            Text(pick)
                .font(.largeTitle.bold())
            Button("Pick for me") {
                pick = "Talley Market"
            }
        }
    }
}
```

**Teach:** `@State` is how a view remembers something *and* redraws when it
changes. Have them delete `@State` and watch Xcode complain — that error is the
lesson. The `{ }` after `Button` is a closure: "code to run later, when tapped."

### Milestone 2 — Arrays and randomness
*Concepts: arrays, `.randomElement()`, optionals, `??`*

```swift
@State private var pick = "Tap the button"
let food = ["Talley Market", "Fountain", "Clark Hall", "Cookout", "Port City Java"]

Button("Pick for me") {
    pick = food.randomElement() ?? "Nothing"
}
```

**Teach:** `randomElement()` returns `String?` — an Optional — because the array
*could* be empty. Swift refuses to let you ignore that. `??` means "or use this
if it's nil." This is the single most important five minutes of the project;
optionals are what beginners fight all semester. Have them delete the
`?? "Nothing"` and read the error out loud.

### Milestone 3 — Make it look good
*Concepts: stacks, modifiers, modifier order, SF Symbols, colors*

Style the text, wrap it in a card, add a background, swap the button for a
`Label` with `dice.fill`. Then do the demo that makes modifiers click:

```swift
Text("Hello")
    .padding()
    .background(.red)     // red box, with the text padded inside it

Text("Hello")
    .background(.red)     // red hugging the text
    .padding()            // padding OUTSIDE the red
```

**Teach:** a modifier doesn't edit the view, it *wraps* it in a new one. Order
matters. Let them play for five minutes.

### Milestone 4 — Structs
*Concepts: `struct`, properties, memberwise init, custom init, `Identifiable`, `UUID`*

The strings aren't enough — each option needs an emoji and a note. Time for a
type of their own. See `Option.swift`.

**Teach:** a struct is a custom type you invent — a blueprint that bundles
related values. `note: String?` is optional because most options won't have one.
`Identifiable` + `id` is SwiftUI's way of telling items apart in a list; they'll
use it constantly from here on.

### Milestone 5 — Enums
*Concepts: `enum`, raw values, `CaseIterable`, `switch`, computed properties*

See `Category.swift`.

**Teach:** an enum is "one of a fixed set of things." Swift's `switch` must
handle every case — add a fourth case and watch every switch in the file light
up red. **That's a feature, not an annoyance:** the compiler just told you every
place you need to update. Say that out loud; it's the moment people start liking
Swift.

### Milestone 6 — Picker + history
*Concepts: `$` bindings, `ForEach`, `.onChange`, `withAnimation`*

Segmented `Picker` bound to `$category`, a `history` array that new picks get
inserted into, `ForEach` to render them, and a spring animation on the roll.

## Where they'll get stuck (read this before you teach)

| Error / confusion | What's happening | What to say |
|---|---|---|
| `Cannot assign to property: 'self' is immutable` | They changed a value in `body` without `@State` | "Views are structs — they can't change themselves. `@State` is the workaround." |
| `Value of optional type 'String?' must be unwrapped` | Used `randomElement()` raw | "Swift is making you handle the empty case. Use `if let`, or `??`." |
| Preview says "Cannot preview in this file" | Usually just needs a rebuild | Press ⌘⇧K then ⌘R. Don't debug it in the meeting. |
| `Type 'Category' does not conform to 'Identifiable'` | Forgot `var id: String { rawValue }` | Shows why `ForEach` needs identity. |
| Modifiers look wrong | Order | Run the padding/background demo from Milestone 3 again. |
| `Extra argument in call` on `Option(...)` | Argument labels wrong | "Swift cares about the labels, not just the order." |
| Emoji won't type | Ctrl+Cmd+Space on Mac | Tell everyone this on day one, they'll use it constantly. |

**One Swift note for you:** the `switch` statements in `Category.swift` return
values without the word `return` (switch expressions, Swift 5.9+). It's clean and
modern, but if a member finds it confusing, adding `return` in front of the
switch is equivalent and fine.

## Meeting-by-meeting

**Meeting 2 (Week 2) — 90 min**
- 0:00–0:10 Demo your finished PackPicker + merged Pack Wall from Week 1. *(That reveal is the retention hook — don't skip it.)*
- 0:10–0:25 Swift crash course, live-coded: `let`/`var`, types, String interpolation, arrays, functions. Ten minutes of talking max.
- 0:25–0:55 Everyone builds **Milestones 1–2**. Working random picker, their own options.
- 0:55–1:15 **Milestone 3**: styling. Free play. Designers present their card design; coders implement it.
- 1:15–1:30 Demo round. Homework: add five more options and pick your own theme.

**Meeting 3 (Week 3) — 90 min**
- 0:00–0:10 Quick demos of what people did at home.
- 0:10–0:30 **Milestone 4**: structs. Refactor strings → `Option`.
- 0:30–0:55 **Milestone 5**: enums + switch. Three categories.
- 0:55–1:15 **Milestone 6**: picker, history, animation.
- 1:15–1:30 Demo round. Tease Project 2: *"Next: an app whose data is still there after you close it."*

## Stretch goals (for the fast members)

Weighted randomness · shake-to-roll (`.sensoryFeedback` / haptics) · a "banish
this option" filter · slot-machine spin animation · let the user add their own
options with a `TextField` (this previews Project 2) · save history so it
survives relaunch (previews Project 2's persistence).

## Designer brief

**Due Meeting 2:** in Figma, design the PackPicker result card and the roll button.

Deliver: a color palette (5 colors, named), a type scale (4 sizes with weights),
a spacing scale (multiples of 8), corner radius, shadow spec, and the card in all
three category themes.

Then sit with a coder in Meeting 2 and get it implemented — that pairing is the
point. Show the Figma frame and the running app side by side in the demo round.
