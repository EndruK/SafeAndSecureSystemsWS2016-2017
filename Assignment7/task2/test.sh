#!/bin/bash
cd tests
testgen -f full -p titles test.ts
cd ..
gprbuild test task2.gpr
./bin/test
