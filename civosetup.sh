#!/bin/sh
civo apikey save test $CIVO_API_KEY
civo apikey current test
civo region current FRA1
civo kubernetes config cluster1 -s