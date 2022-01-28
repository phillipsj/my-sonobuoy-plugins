#! /bin/bash

sh t/workload.t -j
mv t/workload.t-tests.xml /tmp/sonobuoy/results