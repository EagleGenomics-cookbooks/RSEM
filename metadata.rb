name 'RSEM'
maintainer 'Eagle Genomics'
maintainer_email 'chef@eaglegenomics.com'
license 'apache2'
description 'Installs/Configures RSEM'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '1.0.2'

supports 'centos', '= 6.5'

depends 'build-essential'
depends 'magic_shell'
depends 'git'
depends 'r'
depends 'git'
