#!/bin/bash
rm ../reporting/Test/Test.pdf
latexbd -p ../reporting/Test/Test
acroread Test-but.pdf
