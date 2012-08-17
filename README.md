LibraryToGo
=============

Open source integrated library system (ILS) built with Ruby on Rails.

Goals
=============

LibraryToGo will have all critical features of an ILS, but re-imagined from an outsider’s perspective. [Koha](https://github.com/liblime/LibLime-Koha) [v 3.8](http://manual.koha-community.org/3.8/en/) is the reference list of features and performance.

LibraryToGo will be developed using contemporary open source practices and seek maintainability. Code will be covered and tested.

Feature TODOs
=============

* pagination — will_paginate
* search — Sphinx
* taggings — acts_as_taggable_on
* email notifications — sidekiq workers
* scheduling and automation — clockwork
* admin cms
* moderation, acquisition queues
* import and export — FasterCSV? (MARC and Dublin core)
* circulation
* i18n
* reporting and visualization — ruport, googlecharts
* image processing — rmagick
* backups
* check out
* check in
* holds

Feature wants
=============

* payment integration
* comments
* ratings
* patron cards
* QR codes
* microformats
