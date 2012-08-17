LibraryToGo
=============

Open source integrated library system (ILS) built with Ruby on Rails on a threaded stack. It treats patron experience and search as its core competency while supporting day-to-day operations.

The project’s name is not final.

Goals
=============

LibraryToGo will have all critical features of an ILS, but re-imagined from an outsider’s perspective. [Koha](https://github.com/liblime/LibLime-Koha) [v 3.8](http://manual.koha-community.org/3.8/en/) is the reference list of features and performance. [LibraryFind](http://libraryfind.org/) is a reference for implementation and design considerations.

LibraryToGo will be developed using contemporary open source practices and seek maintainability. Code will be covered and tested. The deployment will be effortless. Dependencies will be reasonable and integrated with version control and/or software packaging services.

Considerations
=============

* User privacy is important, as what they view, search for, and circulate is sensitive information
* High read throughput with infrequent updates (caching is important)
* State machine transitions for inventory objects
* User groups authorized to implement and override the business rules
* Business rules in centralized configurations
* Users need persistable and replaceable authentication tokens, as ID cards get lost
* This facilitates in-real-life operations; (almost) everything relates to timings and quantities

Privacy concerns
=============

* aggregate counts are generally not sensitive (number of times record X has done Y) and can be stored with their parent record
* any record that serializes users’ actions should be sensitive (reads should be restricted to privileged users) and the structure of this serialization allows class-level restrictions

Feature TODOs
=============

* search — [Sphinx](http://sphinxsearch.com/) and [Thinking Sphinx](https://rubygems.org/gems/thinking-sphinx)
* taggings — [acts-as-taggable-on](https://rubygems.org/gems/acts-as-taggable-on)
* automation and notifications — [sidekiq](https://rubygems.org/gems/sidekiq)
* admin cms
* moderation, acquisition queues
* import and export — FasterCSV? (MARC and Dublin core)
* circulation
* i18n
* reporting and visualization — [ruport](https://rubygems.org/gems/ruport), [googlecharts](https://rubygems.org/gems/googlecharts)
* image processing — [rmagick](https://rubygems.org/gems/rmagick)
* backups
* check out
* check in
* holds

Features integrated
=============

* users and authentication — [Devise](https://rubygems.org/gems/devise)
* user roles — simple, roll-your-own
* abilities granted to roles — [cancan](https://rubygems.org/gems/cancan)
* pagination — [will_paginate](https://rubygems.org/gems/will_paginate)
* scheduling — [clockwork](https://rubygems.org/gems/clockwork)
* testing — [Guard](https://rubygems.org/gems/guard) dispatches [RSpec](https://rubygems.org/gems/rspec) through [spork](https://rubygems.org/gems/spork)

Feature wants
=============

* payment integration
* comments
* ratings
* patron cards
* QR codes
* microformats
