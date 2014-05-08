pgduty-tools
============

This repo is currently just one script that displays "triggered" incidents from pagerduty. Useful stuff if you spend all day on the command line and hate checking a website constantly. I'd like to add an option so I can just display counts or a boolean value for tmux's status line too.

Add your api key and org from the https://ORG.pagerduty.com url you use to access pagerduty into your environment. I added the following lines into my ~/.bashrc.

export PGDuty_API_KEY='gobbledygoodandgibberish'

export PGDuty_ORG='mycoolcompany'

Pagerduty CLI Stuff
