#!/bin/bash
rm ../reporting/catalogue_topo/catalogue_topo.pdf
latexbd -p ../reporting/catalogue_topo/catalogue_topo
acroread catalogue_topo-but.pdf
