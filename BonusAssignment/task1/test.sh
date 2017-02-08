#!/bin/bash
cd tests
testgen -f full -p titles test.ts
cd ..
gprbuild test task1.gpr
./bin/test
