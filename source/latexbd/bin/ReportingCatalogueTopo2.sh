#!/bin/bash
rm ../reporting/CatalogueTopo2/CatalogueTopo2.pdf
latexbd -p ../reporting/CatalogueTopo2/CatalogueTopo2
acroread CatalogueTopo2-but.pdf
