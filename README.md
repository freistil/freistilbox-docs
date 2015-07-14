# freistilbox Customer Documentation

This repository contains the freistilbox Customer Documentation as a [Middleman](http://middlemanapp.com/ "Middleman: Hand-crafted frontend development") application. The documentation files themselves are in Markdown format.


## Importing into Zendesk Help Center

While we're using the Zendesk Help Center for publishing our documentation, transfer texts changes manually. Each text has the necessary details in its YAML frontmatter:

* `zendesk-title`: The title of the Help Center article
* `zendesk-article-id`: The ID number of the article inside Help Center
* `zendesk-article-tags`: The labels of the article inside Help Center


### Creating a new article:

1. Enter the article title into the frontmatter field `zendesk-title` and its labels into the frontmatter field `zendesk-article-tags`.
2. Create a new Help Center article. Switch to HTML mode.
3. Convert the text without any page layout, using `multimarkdown` or Marked.
4. Copy and paste the converted HTML into the Help Center editor. Save the article.
5. Add the new article's Zendesk ID into the text's frontmatter field `zendesk-article-id`.
6. Commit your frontmatter changes.


### Updating an article:

1. Find the Zendesk article identified by `zendesk-article-id`. Open it for editing and switch to HTML mode.
2. Convert the text without any page layout, using `multimarkdown` or Marked.
3. Copy and paste the converted HTML into the Help Center editor.
4. Update the article's title and labels, if necessary.
