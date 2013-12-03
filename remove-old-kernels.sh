#!/bin/bash
yum remove $(rpm -qa | egrep kernel-'(2|3|PAE|dev)' | sort -n | grep -v `uname -r| sed 's/PAE//'` )
