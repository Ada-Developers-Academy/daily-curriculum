# HTML

HTML (HyperText Markup Language), gives structure to a website by defining sections. For example, headings, paragraphs, or images.

## Origins of HTML

Tim Berners-Lee wrote the original specification for HTML around 1990. He also built the first web server and browser capable of parsing and displaying HTML. This is him:

![Tim Berners-Lee](networking/tim-berners-lee.png)

HTML is comprised of __tags__ which define both the structure of a document and the relationship of different kinds of information.

## The Structure of HTML
Here are some keyterms to drive some live coded examples:
- tags (opening & closing)
- tag hierarchy/nesting
- attributes and values
- block vs inline

## Semantics

Semantics in HTML is the practice of using valid HTML to give meaning to the webpage.
Semantic code describes what type of content is on the page. For example...

```html
<h1>The Best Names for Cats</h1>

<ol>
  <li>Pickles</li>
  <li>Raquel Welch's Grape Jam</li>
  <li>Grand Lord Snugglewumps</li>
  <li>Thunderpaw the Destroyer</li>
  <li>Impurrator Curiosa (shamelessly stolen from twitter)</li>
  <li>Kitty Purry</li>
</ol>
```

The `<h1>` describes that the text "The Best Names for Cats" is a heading for this page.

The `<ol>` and `<li>` tags create an _ordered list_. The tags define both the structure and relationship of the content. From the markup alone, we understand that _Grand Lord Snugglewumps_ is a better name for a cat than _Kitty Purry_. More importantly, that distinction can be communicated to all users--sighted, visually impaired, or robotic.

#### Question: Why should we care about semantic markup?
- Many visually impaired people rely on speech-based browsers to read pages to them. These programs cannot interpret pages very well unless they are clearly explained. In other words semantic code is __critical__ to accessibility
- Search engines need to understand what your content is about in order to rank you properly on search engines. Semantic code improves your placement on search engines, as it is easier for the "search engine spiders" to understand.

## Examples of Common Elements

Headings are block level elements.

```html
<h1>Heading 1</h1>
<h2>Heading 2</h2>
<h3>Heading 3</h3>
<h4>Heading 4</h4>
<h5>Heading 5</h5>
<h6>Heading 6</h6>
```

Headings should be used in order (1-6) to indicate priority and page flow. The `<h1>` element should be used for the primary heading on the page.

Don't use headings to just make the text bigger or bold. Use them to add meaning and structure to the page.

```html
<div>I'm a division</div>
<section>I'm a section! Jeremy has really strong opinions about when to use me!</section>
<span>I'm a span!</span>
```

`div`, `section`, and `span` are purely for building the structure of the site, they don't have any semantic meaning. `div` and `section` are largely interchangeable and are used to divide content into related chunks. `span` tags are used to highlight/emphsize or otherwise identify or callout small, inline pieces of content.

- `<p>`: Block level paragraph element. Used for chunks of text, often following a header element.
- `<b>`: Inline level element to make text bold. I really don't like this tag.
- `<i>`: Inline element to make text italic. I don't like this tag either. Ask me why!
- `<strong>`: Inline level element to imply that text is important.
- `<em>`: Inline level element to emphasize text.
- HTML5 structural elements:
  - `<header>`: Used as an element to hold page header information (logo, navigation, heading)
  - `<nav>`: Used as a container for navigational links
  - `<article>`: Used to distinguish text as self-contained content on some topic. Think the body of a blog post.
  - `<aside>`: Used for "side" content such as sidebars, notes, or inserts.
  - `<footer>`: Identifies the content at the end of the page
