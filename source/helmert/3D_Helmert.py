#!/usr/bin/env python3

import numpy as np
import sys

np.set_printoptions(precision=10)
system1x,system1y,system1z = np.loadtxt(sys.argv[1],unpack=True,usecols=(1,2,3))
system2x,system2y,system2z = np.loadtxt(sys.argv[2],unpack=True,usecols=(1,2,3))

A=np.arange(len(system2x)*21,dtype=np.float64).reshape(len(system2x)*3,7)
L=np.arange(len(system2x)*3,dtype=np.float64).reshape(len(system2x)*3,1)
point_number = np.genfromtxt(sys.argv[1],unpack=True,usecols=0,dtype='str')
transformed = np.arange((len(system1x)-len(system2x))*3,dtype=np.float64).reshape(len(system1x)-len(system2x),3)
full_matrix = np.arange(len(system2x)*3,dtype=np.float64).reshape(len(system2x),3)

a=0
for i in range(len(system2x)):
    
    A[a,:] = [1,0,0,system1x[i],0,-system1z[i],system1y[i]]
    A[a+1,:] = [0,1,0,system1y[i],system1z[i],0,-system1x[i]]
    A[a+2,:] = [0,0,1,system1z[i],-system1y[i],system1x[i],0]
    a += 3
a=0
for i in range(len(system2x)):
    L[a,:] = system2x[i]-system1x[i]
    L[a+1,:] = system2y[i]-system1y[i]
    L[a+2,:] = system2z[i]-system1z[i]
    a +=3

N = np.dot(np.transpose(A),A)
Ninv = np.linalg.inv(N)

n = np.dot(np.transpose(A),L)

x = np.dot(Ninv,n)
x[3] += 1
v = np.dot(A,x)-L

k1 = np.sin(x[4]); k2 = np.cos(x[4])
k3 = np.sin(x[5]); k4 = np.cos(x[5])
k5 = np.sin(x[6]); k6 = np.cos(x[6])

a = len(system2x)
for i in range(0,-len(system2x)+len(system1x),1):
    transformed[i,:] = [x[0] + x[3]*(system1x[a]*k4*k6 + system1y[a]*(k2*k5+k1*k3*k6) + system1z[a]*(k1*k5-k2*k3*k6)),
    x[1] + x[3]*(system1x[a]*-k4*k5 + system1y[a]*(k2*k6-k1*k3*k5) + system1z[a]*(k1*k6+k2*k3*k5)),
    x[2] + x[3]*(system1x[a]*k3 + system1y[a]*-k1*k4 + system1z[a]*k2*k4)]
    a += 1

for i in range(len(system2x)):
    full_matrix[i,:] = [system2x[i],system2y[i],system2z[i]]

full_matrix = np.vstack((full_matrix,transformed))

filename = "Transformed_" + sys.argv[2] 
with open(filename,'w') as file:
    file.write("    Point ID             X               Y               Z\n")
    for i in range(len(full_matrix)):
        file.write('%10s %20.5f %15.5f %15.5f\n' % (point_number[i],full_matrix[i][0],full_matrix[i][1],full_matrix[i][2]))