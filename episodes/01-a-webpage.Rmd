---
title: "Creating a Webpage"
teaching: 10
exercises: 10
---

:::::::::::::::::::::::::::::::::::::: questions 

- How can I create a basic webpage?

::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::: objectives

- Use HTML to create and style a static website.

::::::::::::::::::::::::::::::::::::::::::::::::

# Introduction

Web pages often contain useful information, but we may want to
store that information in a form that is suitable for data 
analysis or to present selected data in a different way.  To
be able to obtain this information from a web page, it is helpful
to understand how web pages are formatted.  One way to gain
an understanding is to create a basic web page.  

## Create a Webpage

Open RStudio and within the file menu, choose `New File>HTML File`.
You should get an empty window to enter content.  Add the following
text

```html
<!DOCTYPE html>
<html lang="en-US">
 <head>
 <meta charset="utf-8" />
 <meta name="viewport" content="width=device-width" />
 <title>An example website</title>
 </head>
 <body>
  <h1> A website</h1>

  <p>Websites can contain useful information.  Sometimes
we might want to store and use this information in other
forms. Consider the table of inner solar system planets
and their masses taken from
<a href="https://en.wikipedia.org/wiki/Solar_System">Wikipedia</a>.</p>

  <table>
   <tr>
    <th>Planet</th>
    <th>Mass</th>
   </tr>
   <tr>
    <td>Mercury</td>
    <td>0.55 <i>M<sub>earth</sub></i></td>
   </tr>
   <tr>
    <td>Venus</td>
    <td>0.78 <i>M<sub>earth</sub></i></td>
   </tr>
   <tr>
    <td>Earth</td>
    <td>1.0 <i>M<sub>earth</sub></i></td>
   </tr>
   <tr>
    <td>Mars</td>
    <td>0.107 <i>M<sub>earth</sub></i></td>
   </tr>
  </table>
 </body>
</html>
```

Save this file as `basicwebsite.html` and then 
preview it using `File>preview`.  Confirm that the
preview is accurate by open the file in a web browser.  

Examining the file you just entered, notice that there are
annotations which have information about the structure of 
the content.  The table is enclosed within tags `<table></table>`
and other tags are used for header `<h1></h1>` as well as for
a paragraph `<p></p>`.  This differs from a _what you see
is what you get_ document that you can produce using a word
processor.


::::::::::::::::::::::::::::::::::::: challenge

## Challenge 1: Add licensing information

When you put information online, you may want to let
anyone who accesses that content know how they can
use and reuse the content.  Often, a separate
licensing page is on many websites.  For a single
webpage website, it is reasonable to add a footer
with this information.  At the bottom of the text file,
between `</table>` and `</body>` add some licensing
information such as

```
<footer>&copy; My Name 2023. <a href="https://creativecommons.org/licenses/by/4.0/">CC-BY-SA-4.0</a></footer>
```

Discuss what types of licensing information you have seen
on other websites.  Also discuss implications licensing might
have for information you obtain from these websites.

::::::::::::::::::::::::::::::::::::::::::::::::


## References

- [W3C HTML and CSS Description](https://www.w3.org/standards/webdesign/htmlcss)
- [Mozilla Developer Network HTML Tutorials](https://developer.mozilla.org/en-US/docs/Web/HTML)
- [HTML Named character references](https://html.spec.whatwg.org/multipage/named-characters.html#named-character-references)

::::::::::::::::::::::::::::::::::::: keypoints 

- A basic web page is an annotated text file

::::::::::::::::::::::::::::::::::::::::::::::::
