# HTML

HTML (HyperText Markup Language), gives structure to the site by defining sections, for example, headings, paragraphs, or images.

Semantics
---------

Semantics in HTML is the practice of using valid HTML to give meaning to the webpage.
Semantic code describes what type of content is on the page. For example

```html
<h1>My Blog</h1>

<p>
  Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
</p>
```
The `<h1>` describes that the text "My Blog" is a heading for this page.

Display
-------

In HTML there are four display types `block`, `inline`, a cross of the two `inline-block`, and `none`.

Inline elements are elements that only take up the width of the actual content. Like this **bold** word, the html element `<b>` is used, but the elements width is automatically calculated.

Block elements are elements that take up 100% of the horizontal space they occupy, followed by a line break. Like the header at the top of this section.

Inline-Block elements are a combination of the two. Inline block elements are displayed inline but can have their widths changed.


Common Elements
-------

Headings are block level elements.

```html
<h1></h1>
<h2></h2>
<h3></h3>
<h4></h4>
<h5></h5>
<h6></h6>
```

Headings should be used in order (1-6) on the page. The `<h1>` element should be used for the primary heading on the page.

Don't use headings to just make the text bigger or bold. Use them to add meaning to the page.

```html
<div></div>
<span></span>
```

`div` and `span` are purely for building the structure of the site, they don't have any semantic meaning. `div` elements are block, while `span`s are inline.

- `<p>` - Block level paragraph element. Used for chunks of text, often following a header element.
- `<strong>` - Inline level element to imply that text is important. Styled with bold text.
- `<b>` - Inline level element to make text bold
- `<em>` - Inline level element to emphasize text. Adds italic styling to the text.
- HTML5 structural elements:
    - `<header>` - Used as an element to hold page header information (logo, navigation, heading)
    - `<nav>` - Used as a container for navigational links
    - `<article>` - Used to distinguish text as self-contained content on some topic. Think the body of a blog post.
    - `<section>` - Used to identify a grouping of content. Like a section of articles.
    - `<aside>` - Used for "side" content such as sidebars, notes, or inserts.
    - `<footer>` - Identifies the content at the end of the page
