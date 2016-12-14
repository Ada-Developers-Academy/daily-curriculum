# Send and Respond

Methods in Ruby can be quite confusing. With methods, you can think of it in
three phases:

1. Send
2. Evaluate
3. Respond

Let's apply these phases the below code:

```ruby
"Hello World".reverse
```

1. Send - The message `:reverse` is sent to the current Object (`"Hello World"`)
2. Evaluate - The source code for `def reverse` in the `String` class is run (see bottom for `.reverse` code)
3. Respond - The result of step 2 is sent back to our process, now the current object.

```ruby
"Hello World".reverse.length
# => 11
```
-------
![Message Flow](resources/message.png)


- When `.length` is sent, what is the current object?
- When `.length` is responded to, what is the current object?

------

### Executed code for `.reverse` method
```c
static VALUE
rb_str_reverse(VALUE str)
{
    rb_encoding *enc;
    VALUE rev;
    char *s, *e, *p;
    int single = 1;

    if (RSTRING_LEN(str) <= 1) return rb_str_dup(str);
    enc = STR_ENC_GET(str);
    rev = rb_str_new5(str, 0, RSTRING_LEN(str));
    s = RSTRING_PTR(str); e = RSTRING_END(str);
    p = RSTRING_END(rev);

    if (RSTRING_LEN(str) > 1) {
        if (single_byte_optimizable(str)) {
            while (s < e) {
                *--p = *s++;
            }
        }
        else if (ENC_CODERANGE(str) == ENC_CODERANGE_VALID) {
            while (s < e) {
                int clen = rb_enc_fast_mbclen(s, e, enc);

                if (clen > 1 || (*s & 0x80)) single = 0;
                p -= clen;
                memcpy(p, s, clen);
                s += clen;
            }
        }
        else {
            while (s < e) {
                int clen = rb_enc_mbclen(s, e, enc);

                if (clen > 1 || (*s & 0x80)) single = 0;
                p -= clen;
                memcpy(p, s, clen);
                s += clen;
            }
        }
    }
    STR_SET_LEN(rev, RSTRING_LEN(str));
    OBJ_INFECT(rev, str);
    if (ENC_CODERANGE(str) == ENC_CODERANGE_UNKNOWN) {
        if (single) {
            ENC_CODERANGE_SET(str, ENC_CODERANGE_7BIT);
        }
        else {
            ENC_CODERANGE_SET(str, ENC_CODERANGE_VALID);
        }
    }
    rb_enc_cr_str_copy_for_substr(rev, str);

    return rev;
}
```
