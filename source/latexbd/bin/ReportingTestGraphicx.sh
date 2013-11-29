#!/bin/bash
rm ../reporting/TestGraphicx/TestGraphicx.pdf
latexbd -p ../reporting/TestGraphicx/TestGraphicx
acroread TestGraphicx-but.pdf
