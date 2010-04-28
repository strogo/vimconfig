from os import symlink
from os.path import join, dirname, expanduser, abspath

here = dirname(abspath(__file__))
symlink(join(here, 'vimrc'), join(expanduser('~'), '.vimrc'))
symlink(join(here, 'vim'), join(expanduser('~'), '.vim'))
