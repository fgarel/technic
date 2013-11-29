    a = 672
    b = 342

    def get_line(a, b, c):
        if c <> 0:
            return str(a)+r' & '+str(b)+r' & '+str(c)+r' \\'+'\n'
        else:
            return str(a)+r' & \mathbf{'+str(b)+r'} & '+str(c)+r' \\'+'\n'

    def print_begin_array(f, c1, c2, c3):
        f.write(r'\begin{displaymath}'+'\n')
        f.write(r'\begin{array}{|c|c|c|}'+'\n')
        f.write(r'\hline'+'\n')
        f.write(r'\makebox[15mm][c]{$'+str(c1)+r'$} & \makebox[15mm][c]{$'+str(c2)+r'$} & \makebox[15mm][c]{$'+str(c3)+r'$} \\'+'\n')
        f.write(r'\hline'+'\n')

    def print_end_array(f):
        f.write(r'\hline'+'\n')
        f.write(r'\end{array}'+'\n')
        f.write(r'\end{displaymath}')

    def print_pgcd_1(f, a, b):
        if a<b:
            print_pgcd_1(f, b, a)
        else:
            c = a-b
            f.write(get_line(a, b, c))
            if c <> 0:
                print_pgcd_1(f, b, c)

    def print_pgcd_2(f, a, b):
        if a<b:
            print_pgcd_2(f, b, a)
        else:
            c = a%b
            f.write(get_line(a, b, c))
            if c <> 0:
                print_pgcd_2(f, b, c)

    texfile_1 = 'pgcd_'+str(a)+'_'+str(b)+'_1.tex'
    texfile_2 = 'pgcd_'+str(a)+'_'+str(b)+'_2.tex'

    texfile = open(texfile_1,'w')
    print_begin_array(texfile, 'a', 'b', 'a-b')
    print_pgcd_1(texfile, a, b)
    print_end_array(texfile)
    texfile.close()

    texfile = open(texfile_2,'w')
    print_begin_array(texfile, 'a', 'b', 'r')
    print_pgcd_2(texfile, a, b)
    print_end_array(texfile)
    texfile.close()
