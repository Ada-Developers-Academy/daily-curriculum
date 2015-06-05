# Intermediate CSS

## How rules cascade

If there are two or more rules applied to the same element, which one will take precedence?

```css
p {
  color: red;
}

p {
  color: black;
}
```

If two rules are identical, that last rule defined will take precedence over any that come before.

But, if one rule is more specific than the others, it will take precedence even if it comes before a less specific rule.
```html
<div class='post'>
  <p>Some Text</p>
</div>
```
```css
div.post p {
  color: red;
}

p {
  color: black;
}
```

In this case `div.post p` is more specific than `p`, so the text will be red even though plain `p` comes later.

You can override the precedence rules using `!important` following any rule

```css
div.post p {
  color: red;
}

p {
  color: black !important;
}
```

Now the `p` will be more important.

## Pseudo-classes and elements

#### Hover

Websites often update content or styles when the mouse hovers over an element, to do this we would use the `:hover` pseudo-class.

    a:hover {
      color: #333;
    }

Clearly indicating that a link or element *can* be clicked is the most common usage of the hover state. However we can use the `:hover` selector on any element:

    .container:hover {
      background-color: #ddd;
      font-weight: bold;
      font-size: 10px;
    }

Other useful CSS pseudo-classes & pseudo-elements include:

- `:active` - selects the active element of our page, such as a form field that is highlighted.
- `:visited` - selects an element that has been visited already. Used for links.
- `:first-letter` - selects the first text letter of the element.
- `:first-line` - select the first text line of the element

## Child and Adjacent selectors

A `>` symbol can be used to select an immediate child, opposed to just a space which selects all children (grandchildren).

```css
.horizontal-list > li {

}
```

The above selects only first desendent `li` elements, this would allow for a nested `.horizontal-list`s `li` elements to remain unstyled by this rule.

A `+` sybmol is used to select the first adjacent element.

```css
h1 + p {
  color: red;
}
```

```html
<h1>Title</h1>
<p>Subtitle</p>
<p>Text</p>
```

In this example only the `<p>` with "Subtitle" would be styled by the rule.

## Reset

Browsers include default css styles, but each browser has slightly different default.
And generally their defaults don't necessarily always make sense for your app (body margin and padding?)
Loading a css file with a bunch of sane default to override all of the browsers is very common.

```bash
touch public/css/resets.css
```
Add the css from [this reset file](http://meyerweb.com/eric/tools/css/reset/reset.css) into the resets file you just created.
Next add another `link` element to your `<head>` element to import the new reset file.

## Box Model
![BoxModel](http://www.w3.org/TR/CSS2/images/boxdim.png)

## Specificity Formula
[Maybe this?](http://www.smashingmagazine.com/2007/07/27/css-specificity-things-you-should-know/)

## Browser Quirks and Standards

## More Best Practices

## Mobile

Resources
--------

- [Advanced CSS](http://htmldog.com/guides/css/advanced/)
- [CSS3](http://www.css3.info)
- [Common CSS Properties](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Properties_Reference)
