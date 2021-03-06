[![Build Status](https://travis-ci.org/EagleGenomics-cookbooks/RSEM.svg?branch=master)](https://travis-ci.org/EagleGenomics-cookbooks/RSEM)
# RSEM

Description
===========

This Cookbook installs RSEM, RNA-Seq by Expectation-Maximization

http://deweylab.biostat.wisc.edu/rsem/


Requirements
============

## Platform:

* Centos 6.5

Notes
=====
The 'make ebseq' command is not working. This is an issue with the software itself.

The executables are all placed in /usr/local/bin so this needs to be in your path.

Usage
=====
Simply include the recipe wherever you would like it installed, such as a run list (recipe[RSEM]) or a cookbook (include_recipe 'RSEM')


## Testing
To test the recipe we use chef test kitchen:

kitchen converge default-centos65

kitchen login default-centos65

kitchen verify default-centos65

kitchen destroy default-centos65

Attributes
==========

See attributes/default.rb for the install flavour:

    default['RSEM']['version'] =  'v1.2.20'


License and Authors
===================

* Authors:: Bart Ailey (<chef@eaglegenomics.com>)
* Authors:: Dan Barrell (<chef@eaglegenomics.com>)
* Authors:: Nick James (<chef@eaglegenomics.com>)    

Copyright:: 2016, Eagle Genomics Ltd, Apache License, Version 2.0


Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

ToDo
====
