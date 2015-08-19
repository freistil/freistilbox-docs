# freistilbox Customer Documentation

This repository contains the freistilbox Customer Documentation as a [Middleman](http://middlemanapp.com/ "Middleman: Hand-crafted frontend development") application. The documentation files themselves are in Markdown format.


## Importing articles into Zendesk Help Center

While we're using Zendesk Help Center for publishing our documentation, article changes have to be transferred manually. Each article has the necessary metadata in its YAML frontmatter:

* `title`: article title (deprecated: `zendesk-title`)
* `tags`: article labels (deprecated: `zendesk-article-tags`)
* `zendesk-id`: ID of the article in the Zendesk Help Center (deprecated: `zendesk-article-id`)


### Creating a new article:

1. Enter the article title into the frontmatter field `title` and its labels into the frontmatter field `tags`.
2. Create a new Help Center article. Switch to HTML mode.
3. Convert the article without any page layout by using `multimarkdown` or the Mac OS X app "Marked".
4. Copy and paste the resulting HTML into the Help Center editor. Save the article.
5. Add the new article's Zendesk ID into the text's frontmatter field `zendesk-id`.
6. Commit your frontmatter changes.


### Updating an article:

1. Find the Zendesk article identified by `zendesk-id`. Open it for editing and switch to HTML mode.
2. Convert the text without any page layout, using `multimarkdown` or Marked.
3. Copy and paste the converted HTML into the Help Center editor.
4. Update the article's title and labels, if necessary.

