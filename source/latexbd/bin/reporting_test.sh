#!/bin/bash
rm ../reporting/test/test.pdf
latexbd -p ../reporting/test/test
acroread test-but.pdf