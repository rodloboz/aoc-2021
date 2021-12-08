import os

def file_reader(f):
    while True:
        data = f.readline()
        if not data:
            break
        yield data.strip()


def diagnostic(filepath):
    counters = {}
    size = 0

    # lazy file reading
    with open(filepath, 'r') as f:
        for code in file_reader(f):
            size += 1
            for ix,nr in enumerate(code):
                if ix not in counters:
                    counters[ix] = 0
                counters[ix] += int(nr)

        gamma = "".join(['1' if v>=size//2 else '0' for v in counters.values()])
        epsilon = gamma.replace('1', '2').replace('0', '1').replace('2', '0')

    return gamma, epsilon

def count_ones_and_zeros(codes, to_count='ones', i = 1):
    counters = {}
    for code in codes:
        for ix,c in enumerate(code):
            if ix not in counters:
                counters[ix] = 0
            counters[ix] += int(c)

    ones = "".join(['1' if v>=(len(codes)/2) else '0' for v in counters.values()])
    zeros = ones.replace('1', '2').replace('0', '1').replace('2', '0')
    rate = ones if to_count == 'ones' else zeros

    filtered = [ c for c in codes if c[i] == rate[i] ]

    # recursive filtering until filtered has 1 code
    if len(filtered) > 1:
        i+=1
        filtered = count_ones_and_zeros(filtered, to_count=to_count, i=i)

    return filtered

def oxygen_generator_rating(filepath):
    filtered = []

    with open(filepath, 'r') as f:
        for code in file_reader(f):
            # codes that start with 1
            if code[0] == '1':
                filtered.append(code)

    final = count_ones_and_zeros(filtered, to_count='ones')

    return final[0]

def co2_scrubber_rating(filepath):
    filtered = []

    with open(filepath, 'r') as f:
        for code in file_reader(f):
            # codes that start with 0
            if code[0] == '0':
                filtered.append(code)

    final = count_ones_and_zeros(filtered, to_count='zeros')

    return final[0]


if __name__ == '__main__':
    dirname = os.path.dirname(__file__)
    filename = os.path.join(dirname, '../../data/day_3/input.txt')

    gamma,epsilon = diagnostic(filename)
    g = int(gamma, 2)
    e = int(epsilon, 2)

    o2rating = oxygen_generator_rating(filename)
    co2rating = co2_scrubber_rating(filename)
    o2_rating = int(o2rating, 2)
    co2_rating = int(co2rating, 2)

    print(f"Part I: power={g*e} | Part II o2={o2_rating}; co2_rating={co2_rating}")
