#!/bin/bash
rm ../reporting/CatalogueTopo/CatalogueTopo.pdf
latexbd -p ../reporting/CatalogueTopo/CatalogueTopo
acroread CatalogueTopo-but.pdf
