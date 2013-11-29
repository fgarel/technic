#!/bin/bash
rm ../reporting/CatalogueTopo3/CatalogueTopo3.pdf
latexbd -p ../reporting/CatalogueTopo3/CatalogueTopo3
acroread CatalogueTopo3-but.pdf
