#!/bin/bash
rm ../reporting/catalogue_topo_2/catalogue_topo_2.pdf
latexbd -p ../reporting/catalogue_topo_2/catalogue_topo_2
acroread catalogue_topo_2-but.pdf
