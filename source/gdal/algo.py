#!/usr/bin/env python
# -*- encoding: utf-8 -*-


# code vu à partir de cette page
# http://blog.rtwilson.com/simple-parameter-files-for-python-class-based-algorithms/
# 
# pour utiliser :
#   
#   # Create instance with code
#   alg = Algorithm("input.txt", "output", 0.25, n_iter=20)
#   alg.run()
#
#   # Create instance from parameter file
#   alg = Algorithm.fromparams('output_params.txt')


class Algorithm:
    def __init__(self, input_filename, output_basename, thresh, n_iter=10):
        self.input_filename = input_filename
        self.output_basename = output_basename
         
        self.thresh = thresh
         
        self.n_iter = n_iter
 
        self.write_params()
 
    def write_params(self):
        with open(self.output_basename + "_params.txt", 'w') as f:
            for key, value in self.__dict__.iteritems():
                if key not in ['m', 'c', 'filenames']:
                    if type(value) == int:
                        valuestr = "%d" % value
                    elif type(value) == float:
                        valuestr = "%.2f" % value
                    else:
                        valuestr = "%s" % repr(value)
 
                    f.write("%s = %s\n" % (key, valuestr))
             
    def run(self):
        self.preprocess()
         
        self.do_iterations()
         
        self.postprocess()
 
    @classmethod
    def fromparams(cls, filename):
        params = {}
        execfile(filename, params)
        del params['__builtins__']
        return cls(**params)
         
    def preprocess(self):
        # Do something, using the self.xxx parameters
 
    def do_iterations(self):
        # Do something, using the self.xxx parameters
     
    def postprocess(self):
        # Do something, using the self.xxx parameters
