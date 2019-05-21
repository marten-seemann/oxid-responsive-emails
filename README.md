# Responsive Emails for OXID

## Install instruction

See https://oxid-responsive.gitbooks.io/responsive-emails/content/.

## Build

* [build/getsql.php](build/getsql.php) reads the emails from the database of the current shop and writes them to an install script in [build/sql/install.sql](build/sql/install.sql). Only run this if you want to make changes to the default email texts.
* [build/get_snippets.php](build/get_snippets.php) outputs SQL code to create CMS snippets for additional blocks inserted into the emails, which by default are all empty.

## OXID Emails

- *oxregisteremail*: normal registration mail
- *oxregisteraltemail*: registration mail if Private Sales is enabled
- *oxpricealarmemail*: price alarm email that is sent to the **shop owner**
