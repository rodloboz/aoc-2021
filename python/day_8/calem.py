import os


def main():
    dirname = os.path.dirname(__file__)
    filename = os.path.join(dirname, "../../data/day_8/input.txt")
    with open(filename, "r") as f:
        inp = f.read()

    unique_cost(inp)
    sum_output(inp)


def inp_spit(inp):
    inp = inp.split("\n")
    inp = [line.split(" | ") for line in inp]
    inp = [[sec.split(" ") for sec in line] for line in inp]
    return inp


def unique_cost(inp):
    inp = inp_spit(inp)
    count = 0
    for line in inp:
        for word in line[1]:
            if len(word) in [2, 3, 4, 7]:
                count += 1
    print(f"Solution 1: {count}")
    return count


def sum_output(inp):
    inp = inp_spit(inp)
    count = 0
    letters = ["a", "b", "c", "d", "e", "f", "g"]
    for line in inp:
        d = {}
        maps = {2: 1, 3: 7, 4: 4, 7: 8}
        for word in line[0]:
            if len(word) in maps.keys():
                d[maps[len(word)]] = word

        l13 = [l for l in letters if l in d[4] and not l in d[1]]

        for word in line[0]:
            if len(word) == 5:
                if all(l in word for l in d[1]):
                    d[3] = word
                elif all(l in word for l in l13):
                    d[5] = word
                else:
                    d[2] = word

        l2 = [l for l in letters if l in d[3] and not l in d[5]][0]

        for word in line[0]:
            if len(word) == 6:
                if all(l in word for l in l13 + [l2]):
                    d[9] = word
                elif all(l in word for l in l13) and not l2 in word:
                    d[6] = word
                else:
                    d[0] = word

        count += int(
            "".join(
                [str(k) for k, v in d.items() if sorted(word) == sorted(v)][0]
                for word in line[1]
            )
        )

    print(f"Solution 2: {count}")
    return count


if __name__ == "__main__":
    main()