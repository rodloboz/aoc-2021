import os
import numpy as np


def main():
    dirname = os.path.dirname(__file__)
    filename = os.path.join(dirname, "../../data/day_9/input.txt")
    with open(filename, "r") as f:
        inp = f.read()

    challenge2(inp)


def inp_preprocessing(inp):
    inp = inp.split("\n")
    inp = [list(row) for row in inp]
    inp = [[int(n) for n in row] for row in inp]
    inp = np.array(inp)
    return inp


def append_basins(inp,basins,i,j):
    if not inp[i,j] == 9:
        for basin in basins:
            if i == 0:
                if (i+1,j) in basin:
                    basin.append((i,j))
            elif i == inp.shape[0]-1:
                if (i-1,j) in basin:
                    basin.append((i,j))
            else:
                if (i+1,j) in basin or (i-1,j) in basin:
                    basin.append((i,j))

            if j == 0:
                if (i,j+1) in basin:
                    basin.append((i,j))
            elif j == inp.shape[1]-1:
                if (i,j-1) in basin:
                    basin.append((i,j))
            else:
                if (i,j-1) in basin or (i,j+1) in basin:
                    basin.append((i,j))
        for ind,basin in enumerate(basins):
            basins[ind] = list(set(basin))
    return basins
    


def challenge1(inp, return_basins=False):
    print("----Calculating Solution 1----")
    inp = inp_preprocessing(inp)
    basins = []
    output = 0
    for i in range(inp.shape[0]):
        for j in range(inp.shape[1]):
            check = 0
            if i == 0:
                if inp[i+1,j] <= inp[i,j]:
                    check +=1
            elif i == inp.shape[0]-1:
                if inp[i-1,j] <= inp[i,j]:
                    check +=1
            else:
                if inp[i-1,j] <= inp[i,j] or inp[i+1,j] <= inp[i,j]:
                    check +=1

            if j == 0:
                if inp[i,j+1] <= inp[i,j]:
                    check +=1
            elif j == inp.shape[1]-1:
                if inp[i,j-1] <= inp[i,j]:
                    check +=1
            else:
                if inp[i,j-1] <= inp[i,j] or inp[i,j+1] <= inp[i,j]:
                    check +=1

            if check == 0:
                basins.append([(i,j)])
                output += 1+inp[i,j]
    output
    print(output)
    if return_basins:
        return inp, basins
    return output


def challenge2(inp):
    inp,basins = challenge1(inp, return_basins=True)
    print("----Calculating Solution 2----")
    
    rev = 1
    loop = 1
    while loop > 0:
        tmp = sum([len(basin) for basin in basins])
        
        for i in range(inp.shape[0])[::rev]:
            for j in range(inp.shape[1])[::rev]:
                basins = append_basins(inp,basins,i,j)
                
        if sum([len(basin) for basin in basins]) == tmp:
            loop = 0
        rev = rev*-1
    
    output = np.prod(sorted([len(basin) for basin in basins])[-3:])
    print(output)
    return output


if __name__ == "__main__":
    main()