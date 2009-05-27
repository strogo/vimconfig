from os import symlink
from os.path import join, dirname, expanduser

here = dirname(__file__)
symlink(join(here, 'vimrc'), join(expanduser('~'), '.vimrc'))
symlink(join(here, 'vim'), join(expanduser('~'), '.vim'))
