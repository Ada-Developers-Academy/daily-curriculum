## More CSS


### How rules cascade

If there are two or more rules applied to the same element, which one will take precedence?

    p { color: red; }
    
    p { color: black; }

If two rules are identical, that last rule defined will take precedence over any that come before.

But, if one rule is more specific than the others, it will take precedence even if it comes before a less specific rule.

    <div class='post'>
      <p>Some Text</p>
    </div>
    
    ---------
    
    div.post p {
      color: red;
    }
    
    p { color: black; }

In this case `div.post p` is more specific than `p`, so the text will be red even though plain `p` comes later.

You can override the precedence rules using `!important` following any rule

    div.post p {
      color: red;
    }
    
    p { color: black !important; }
    
Now the `p` will be more important.

### Pseudo-classes and elements

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
    

    


