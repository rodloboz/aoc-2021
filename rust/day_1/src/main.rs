extern crate arrayvec;

use arrayvec::ArrayVec;

use std::{
    fs::File,
    io::{BufRead, BufReader, Error, ErrorKind},
    path::Path,
};

fn main() {
    let filepath = Path::new("../../data/day_1/input.txt");
    let lines = lines_from_file(filepath).expect("invalid data");
    let mut inputs:  ArrayVec<_> = lines.into_iter().collect();
    let result = measurement_increases(&mut inputs);
    let window = sliding_window_increases(&mut inputs);

    println!("{:?}", result);
}

fn lines_from_file(filename: impl AsRef<Path>) -> Result<Vec<i32>, Error> {
    let file = File::open(filename).expect("no such file");
    let buf = BufReader::new(file);
    buf.lines()
        .map(|line| line.and_then(|v| v.parse().map_err(|e| Error::new(ErrorKind::InvalidData, e))))
        .collect()
}

fn measurement_increases(inputs: &mut [i32]) -> i32 {
    let mut counter = 0;

    for i in 1..inputs.len() {
        if inputs[i] > inputs[i-1] {
            counter += 1;
        }
    }

    return counter;
}

fn sliding_window_increases(inputs: &mut [i32]) -> i32 {
    let mut vec = Vec::new();

    for i in 0..inputs.len()-2 {
        vec.push(inputs[i] + inputs[i+1] + inputs[i+2]);
    }

    return measurement_increases(&mut vec);
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn measurement_increases_works() {
        let mut inputs: [i32;10] = [199,200,208,210,200,207,240,269,260,263];
        let result = measurement_increases(&mut inputs);
        assert_eq!(result, 7);
    }

    #[test]
    fn sliding_window_increases_works() {
        let mut inputs: [i32;10] = [199,200,208,210,200,207,240,269,260,263];
        let result = sliding_window_increases(&mut inputs);
        assert_eq!(result, 5);
    }
}
