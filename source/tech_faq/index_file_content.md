---
title: How do I index file contents with Solr?
zendesk-id: 201084475
tags:
  - solr
  - search
---

# How to index asset files with Solr

If you want to index file contents (PDF files for example), you'll need a parser
software named Tika. This software will extract searchable content from a file
and pass it to Solr for indexing.

## Using Tika in Drupal

To use Tika in Drupal, you need the "Apache Solr Attachments" module. Configure
it as follows:

* Extract using: "Tika (local java application)"
* Tika directory path: "/usr/local/bin"
* Tika jar file: "tika.jar"
