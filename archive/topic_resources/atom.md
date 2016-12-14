# Atom Text Editor

Atom is a powerful new text editor created by Github. It's build using node.js
and other web technologies, which means that customizing it is very similar to customizing
a webpage.

#### Packages

One way that Atom is extended through install external packages,

1. Open the preferences pane from the app menue `Atom > Preferences...` (or press `cmd,`).
2. Click on the `Packages` tab in the left menu. This will show you the packages that are installed by default.
3. Clikc on the '+Install' tab in the left menu. Search and install the following packages:
    - Autoclose HTML (meh)
    - Color Picker
    - Rspec
    - Lanugage Rspec
    - Linter
    - Linter jshint
    - Linter ruby
    - Linter CSSlint
    - Sublime Style Column Selection
    - Whitespace (may already be installed) (yaaaayyyyy)
    - Autosave (may already be installed) (boooo)

### Themes

Themes change the way your editor looks, similar to packages
enter the `Preference` and click on the `Themes` tab, browse, and install.

### Awesome keyboard shortcuts

- `⌘⇧p`: Open the _Command Pallete_ to execute commands in the editor
- `⌘t`: Search files, open in a new tab
- `⌘w`: Close the current tab
- `⌘⇧w`: Close the current window (all tabs)
- `⌘l`: Select the current line
- `⌘⇧d`: Copy the current line
- `⌃⇧k`: Delete the current line
- `⌘^up` & `⌘^down`: Move the active line up or down
- `⌘d`: Select the next instance of the highlighted string
- `⌃⇧up` & `⌃⇧down`: add a cursor in the same position on the line above/below.

### Customizing

There are many ways to customize Atom, but most simple is to edit the stylesheet

- Open the Command Pallet (`⌘⇧p`) and type "open your stylesheet", and press enter.
- Try writing some CSS (don't worry we'll learn it in the future):

```css
.editor {
  background-color: red;
}
```

Press `⌘s` to save and you should see the change instantly!

You can select any part of the application to manipulate with CSS.
To browse the CSS selectors for the app open the debug console with `⌘⌥i`
