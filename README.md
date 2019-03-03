# Responsive Emails for OXID

This module makes OXID's emails responsive. It uses https://github.com/leemunroe/responsive-html-email-template as an email template.


## Compatibilty

This module works with OXID 6.x.
A version compatible with OXID 4.10.x is available in the [oxid-4.x branch](https://github.com/marten-seemann/oxid-responsive-emails/tree/oxid-4.x).


## Install instruction

See https://oxid-responsive.gitbooks.io/responsive-emails/content/.


## Build

* [build/getsql.php](build/getsql.php) reads the emails from the database of the current shop and writes them to an install script in [build/sql/install.sql](build/sql/install.sql). Only run this if you want to make changes to the default email texts.
* [build/getsnippets.php](build/getsnippets.php) creates [build/sql/snippets.sql](build/sql/snippets.sql). These snippets are additional blocks inserted into the emails, and by default they are all empty.


## OXID Emails

- *oxregisteremail*: normal registration mail
- *oxregisteraltemail*: registration mail if Private Sales is enabled
- *oxpricealarmemail*: price alarm email that is sent to the **shop owner**
