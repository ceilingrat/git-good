#!/bin/bash

# repl.it's 'run' button triggers this script

# test the following:
# - is `.replit` file configured to run this script?
# - is this script accessing the repl's environment variable secrets?
echo $testsecret


# run jekyll to do the following:
# - generate site files
# - run http server listening for public requests
# - watch for changes to source files and generate new site files when necessary

bundler exec jekyll s -s "docs" -H 0.0.0.0

# if using 'run' button to activate jekyll, then other services and other scripts need to go into other script files