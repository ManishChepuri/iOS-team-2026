# PackPicker — live teaching script

Run this format for the whole thing, no matter how many parts you get
through: **teach the target behavior → 5–10 min struggle window (groups
Google/AI for *understanding*, no copy-pasting code in or out) → group
leaders guide the search, they don't hand out the answer → you reveal the
reference and correct wrong turns before they calcify.** Some parts below
are marked "no struggle" — those are pure orientation/framing, teach them
directly.

Room is split into 3 groups, each with a leader. Leaders may not know the
answer either — their job is helping their group search well (better
queries, which error text to actually read, the right follow-up question),
not solving it for them.

There's no hard Day 1 / Day 2 split below — just keep going in order for as
long as your meeting has time. **Part 7 is a clean stopping point** if you
run out of room — the app fully works there. A note marks it.

---

## Part 1 — Intro (~8 min, no struggle)

**Do:** File → New → Project → iOS → App. Name it `PackPicker`, interface
SwiftUI. Everyone builds fresh, nobody copies the reference project.

**Teach, briefly, on `PackPickerApp.swift`:**
```swift
@main
struct PackPickerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
```
One line: *"This is just where the app starts and opens a window with
`ContentView` in it."* Don't dwell — this is plumbing, not a lesson.

**Teach, at length, on `ContentView.swift`:**
```swift
struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
    }
}
```
- `struct ContentView: View` — *"a `View` is anything that can be drawn on
  screen. We're defining our own, and telling Swift it is one."*
- `var body: some View` — *"every View has to answer one question: what do I
  look like? `body` is that answer."* Don't dwell on `some`.
- `#Preview` canvas — ⌘⌥↩ to show it if it's hidden. Fastest feedback loop,
  use it constantly.

**Checkpoint:** "Hello, world!" renders.

---

## Part 2 — State + Button (~14 min)

**Teach:** `body` currently returns a fixed `Text` — nothing changes on tap.
Two ideas fix that:
- **`@State`** — a normal struct property can't change itself after creation
  (Views are structs). `@State` is the exception: *"it's how a view
  remembers something, and redraws when it changes."* Worth demoing the
  error on purpose: remove `@State`, read `Cannot assign to property: 'self'
  is immutable'` out loud.
- **`Button`** takes a label and a **closure** — code in `{ }` that runs
  later, on tap, not immediately.

**Struggle task:** a `Text` that starts at `"Tap the button"`, a `Button`
labeled `"Pick for me"` that changes it to a fixed string on tap.

**Reference:**
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
**Compare/watch for:** did they mark `@State private var`, or hit the
immutability error first (deliberately trigger it if nobody did)? Did they
use the short `Button("label") { }` form or the trailing-closure
`Button { } label: { }` form — both are fine, just note both syntaxes exist.

**Checkpoint:** text changes on tap.

---

## Part 3 — Arrays + randomness (~18 min — longest window, most important part)

**Teach:** we want a *random* pick from a list, not a fixed string.
- **Arrays** — `[String]`, a list of same-typed values.
- **`.randomElement()`** returns `String?`, an **Optional**, not `String` —
  because the array *could* be empty. Swift won't let you ignore that case.
- **`??`** ("nil-coalescing") — *"or, if that was nil, use this instead."*

Say this close to verbatim — it's the whole point of the tier: *"Swift is
making you handle the empty case. An Optional is a box that either has
something in it, or is empty (nil), and Swift won't let you pretend
otherwise."*

**Struggle task:** replace the fixed string with an array of options; make
the button pick randomly; resolve the resulting Optional (don't just silence
the error, actually handle it).

**Reference:**
```swift
@State private var pick = "Tap the button"
let food = ["Talley Market", "Fountain", "Clark Hall", "Cookout", "Port City Java"]

Button("Pick for me") {
    pick = food.randomElement() ?? "Nothing"
}
```
**Compare/watch for:** did anyone actually see
`Value of optional type 'String?' must be unwrapped` before adding `??`? If a
group skips it entirely, break one on purpose live so everyone reads it —
they'll hit this constantly all semester.

**Checkpoint:** each tap gives a random item.

---

## Part 4 — Stacks + modifiers (~12 min)

**Teach:** a modifier doesn't edit a view, it **wraps** it in a new one —
order changes the result. Run this demo live, side by side:
```swift
Text("Hello")
    .padding()
    .background(.red)     // red box, padding baked INSIDE it

Text("Hello")
    .background(.red)     // red hugging the text tightly
    .padding()              // padding added OUTSIDE the red
```
*"Read modifiers top to bottom as 'wrap this, then wrap that' — not as a
list of properties being set."*

**Struggle task:** apply `.padding()` + `.background()` to their own
`VStack`, deliberately choosing an order, and be able to say why that order
gives that result.

**Compare/watch for:** some will apply padding/background to *each child*
individually (two separate boxes) instead of to the shared container (one
card). Neither is wrong — ask them which one they intended, the code alone
doesn't say.

**Checkpoint:** visually confirm padding/background order did what they
expected.

---

## Part 5 — SF Symbols + polish (~12 min)

**Teach:**
- **SF Symbols** — Apple's icon set. `Image(systemName: "dice.fill")`. Find
  names via right-click → "Insert Symbol" in Xcode, or the SF Symbols app,
  or sfsymbols.com. (Different from **Ctrl+Cmd+Space**, the *emoji* picker —
  mention both, they'll use both constantly.)
- **`Label`** pairs icon + text: `Label("Pick for me", systemImage:
  "dice.fill")`. Not magic, just a convenience view.
- **Corner radius + shadow:** `.background(color, in: RoundedRectangle
  (cornerRadius: 24))`, `.shadow(color: .black.opacity(0.08), radius: 10, y:
  4)`. Cheap visual upgrade — show before/after.

**Struggle task:** swap the plain-text `Button` for a `Button { } label: {
Label(...) }` with an SF Symbol; round the card's corners; add a shadow;
pick their own color.

**Reference so far (end of Part 5):**
```swift
struct ContentView: View {
    @State private var pick = "Hit the button"
    let food = ["Talley Market", "Fountain", "Clark Hall", "Cookout", "Port City Java"]

    var body: some View {
        VStack(spacing: 20) {
            Text(pick)
                .font(.largeTitle.bold())
                .multilineTextAlignment(.center)
            Button {
                pick = food.randomElement() ?? "Nothing"
            } label: {
                Label("Pick for me", systemImage: "dice.fill")
                    .font(.headline)
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
        }
        .padding()
        .background(.yellow, in: RoundedRectangle(cornerRadius: 24))
        .shadow(color: .black.opacity(0.08), radius: 10, y: 4)
    }
}
```
**Compare/watch for:** padding/shadow-opacity values will vary a lot — that's
fine, it's taste, not correctness. Mention the designer brief's spacing
scale (multiples of 8) if a group's numbers look arbitrary. Check nobody put
a dark `.background` behind default (low-contrast) button text.

**Checkpoint:** styled card + real button, tap it a few times.

---

## Part 6 — The `Option` struct (~15 min, no struggle — this one's dense, just teach it directly)

**Teach:** a plain string can't hold an emoji *and* a name *and* an optional
note. Time for a type of our own.
- **`struct`** — *"a custom type you invent: a blueprint that bundles
  related values."*
- `note: String?` (and optionally `emoji: String?` too — see below) —
  optional because not every option has one. Contrast with Part 3's
  optional: *"there, nil meant something went wrong, paper over it with
  `??`. Here, nil is an expected, legitimate state — we'll show a different
  UI for it, not hide it."*
- **`Identifiable`** (`let id = UUID()`) — SwiftUI's "give each of these a
  unique identity so a list can tell them apart." Not used until Part 12
  (history list), but goes in now.
- Custom `init` with a default parameter (`note: String? = nil`) lets you
  call `Option("Talley Market", emoji: "🍔")` and skip the note, instead of
  being forced to pass every argument every time.

**A real variation worth knowing about, since it happened live:** some
people will make `emoji: String?` optional too (not just `note`), and handle
it with a second `if let`. That's completely valid — it just means every
`Option` needs a name, but emoji and note are both optional extras. Don't
correct it if a group does this; it's the same pattern applied twice.

**The bigger shift:** `@State` changes from `String` to `Option?` (nilable).
Before, "nothing picked" was faked with a placeholder string. Now it's a
real state, checked with `if let` instead of papered over with `??`.

**Show directly — `Option.swift`:**
```swift
struct Option: Identifiable {
    let id = UUID()
    let name: String
    let emoji: String
    let note: String?

    init(_ name: String, emoji: String, note: String? = nil) {
        self.name = name
        self.emoji = emoji
        self.note = note
    }
}
```

**Show directly — refactored `ContentView.swift`, and introduce splitting
`body` into named pieces (matches the finished app's `resultCard` /
`rollButton` shape — do this now, not later, so the card and the button
aren't stuck in one shared box):**
```swift
struct ContentView: View {
    @State private var pick: Option?
    let food = [
        Option("Talley Market", emoji: "🍔", note: "Absolute chaos at noon"),
        Option("Fountain Dining", emoji: "🍕"),
        Option("Clark Hall", emoji: "🥗", note: "Surprisingly good"),
        Option("Port City Java", emoji: "☕️", note: "Coffee is a food group"),
        Option("Cookout", emoji: "🥤", note: "Worth the drive")
    ]

    var body: some View {
        VStack(spacing: 20) {
            resultCard
            rollButton
        }
        .padding()
    }

    private var resultCard: some View {
        VStack(spacing: 12) {
            if let pick {
                Text(pick.emoji)
                    .font(.system(size: 60))
                Text(pick.name)
                    .font(.title.bold())
                    .multilineTextAlignment(.center)
                if let note = pick.note {
                    Text(note)
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
            } else {
                Text("Hit the button")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.secondary)
            }
        }
        .frame(maxWidth: .infinity, minHeight: 180)
        .padding()
        .background(.yellow, in: RoundedRectangle(cornerRadius: 24))
        .shadow(color: .black.opacity(0.08), radius: 10, y: 4)
    }

    private var rollButton: some View {
        Button {
            pick = food.randomElement()
        } label: {
            Label("Pick for me", systemImage: "dice.fill")
                .font(.headline)
                .frame(maxWidth: .infinity)
        }
        .buttonStyle(.borderedProminent)
        .controlSize(.large)
    }
}
```

**Explain, in order:**
- `@State private var pick: Option?` — no `= nil` needed; Optionals are the
  one type Swift defaults for you automatically.
- `pick = food.randomElement()` — no `??` anymore. Optional going into
  Optional; nil is allowed and meaningful now, not an error.
- `if let pick { ... } else { ... }` — **optional binding**, the other main
  way (besides `??`) Swift makes you handle an Optional. Unlike `??`, each
  branch can be a totally different UI, not just a different value.
- `if let note = pick.note` — the shorthand `if let pick` only works because
  `pick` is a plain name; `pick.note` is a property access, so you must
  spell out `if let note = pick.note`.
- `private var resultCard: some View` / `rollButton` — same `some View` type
  as `body`, just organizing. *"`body` should read like a table of
  contents; the details live in their own named properties."*

**Checkpoint:** placeholder shows first, then real picks with emoji/name,
notes only where present, card and button visually separate.

---

## Part 7 — Recap (~5 min, no struggle)

**Concepts covered so far, in order:** `let`/`var` · `String` · `@State` ·
`Button` (both forms) · closures · arrays · `.randomElement()` · optionals
(`?`) · `??` · `VStack` · modifiers & modifier order · SF Symbols · `Label` ·
`.background(_:in:)` · corner radius · `.shadow()` · `.buttonStyle` ·
`struct` · custom `init` with default parameters · `Identifiable`/`UUID` ·
optional binding (`if let`) · organizing `body` into named computed
properties.

**➜ Natural stopping point if you're out of time.** The app fully works,
looks good, and has real structured data. Everything after this is
categorization, selection UI, and history — valuable, but not required for
a working demo.

**Tease what's next:** *"Right now there's one big list. Next we split it
into categories — Food, Study, Chaos — so 'Pick for me' means something
different depending on which one you're on."*

---

## Continue here (Part 8+) — enums, Picker, history

*Not yet scripted — being built live in the same session as this file. Pick
up with the `Category` enum (cases, `CaseIterable`, a `switch`-based
`options` computed property), then `symbol`/`tint` computed properties (+ the
"add a case, watch every switch turn red" compiler demo), then the
segmented `Picker` bound with `$category` and `.onChange`, then the
`history` array + `ForEach` + `withAnimation`. This section will be filled
in the same teach → struggle → reveal format as everything above.*
