#!/usr/bin/env python3

import numpy as np
import sys
np.set_printoptions(precision=10)
system2_x, system2_y = np.loadtxt(sys.argv[2], unpack=True,usecols=(1,2))
system1_x, system1_y = np.loadtxt(sys.argv[1], unpack=True,usecols=(1,2))
point_number = np.genfromtxt('system_1.txt',unpack=True,usecols=0,dtype='str')
A=np.arange(len(system2_x)*8,dtype=np.float64).reshape(len(system2_x)*2,4)
L=np.arange(len(system2_x)*2,dtype=np.float64).reshape(len(system2_x)*2,1)
point_n = len(system1_x)-len(system2_x)
transformed = np.arange(point_n*2,dtype=np.float64).reshape(point_n,2)
full_matrix = np.arange(len(system1_x)*3,dtype=np.float64).reshape(len(system1_x),3)

katsayi_2=[]
katsayi_1=[i for i in range(len(system2_x)*2)]
for i in range(len(system2_x)):
    katsayi_2.append(i)
    katsayi_2.append(i)

for i in range(1,len(katsayi_1),2):
    A[katsayi_1[i-1],:] = [1,0,system1_x[katsayi_2[i-1]],-system1_y[katsayi_2[i-1]]]
    A[katsayi_1[i],:] = [0,1,system1_y[katsayi_2[i]],system1_x[katsayi_2[i]]]

for i in range(1,len(katsayi_1),2):
   L[katsayi_1[i-1],:] = system2_x[katsayi_2[i]]
   L[katsayi_1[i],:] = system2_y[katsayi_2[i]]
   
N = np.dot(np.transpose(A),A)
n = np.dot(np.transpose(A),L)

x = np.dot(np.linalg.inv(N),n)
v = np.dot(A,x)-L

scale = np.sqrt(x[2]**2+x[3]**2)
rotation = np.arctan2(x[3],x[2])

print("X Shifting: %8.5f" % x[0])
print("Y Shifting: %8.5f" % x[1])
print("     Scale: %13.10f" % scale)
print("  Rotation: %13.10f" % rotation)

for i in range(point_n):
    transformed[i,:] = [x[2]*system1_x[point_n+i+1]-x[3]*system1_y[point_n+i+1]+x[0],
                x[3]*system1_x[point_n+i+1]+x[2]*system1_y[point_n+i+1]+x[1]]

for i in range(len(system2_x)):
    full_matrix[i,:] = [point_number[i],system2_x[i], system2_y[i]]

for i in range(point_n+1,len(system1_x)):
    full_matrix[i,:] = [point_number[i],transformed[i-len(system2_x)][0],transformed[i-len(system2_x)][1]]
    
filename = "Transformed_" + sys.argv[2] 
with open(filename,'w') as file:
    file.write("    Point ID             X               Y\n")
    for i in range(len(full_matrix)):
        file.write('%10s %20.5f %15.5f\n' % (full_matrix[i][0],full_matrix[i][1],full_matrix[i][2]))
