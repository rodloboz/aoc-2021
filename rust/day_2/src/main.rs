use std::{
    fs::File,
    io::{BufRead, BufReader, Error, ErrorKind},
    path::Path,
};

#[derive(Debug)]
struct Coordinates {
    horizontal: i32,
    depth: i32
}

#[derive(Debug)]
struct Move(String, i32);

fn main() {
    let filepath = Path::new("../../data/day_2/input.txt");
    let inputs = lines_from_file(filepath).expect("invalid data");
}

fn lines_from_file(filename: impl AsRef<Path>) -> Vec<String> {
    let file = File::open(filename).expect("no such file");
    let buf = BufReader::new(file);
    buf.lines()
       .map(|line| line.and_then(|v| v.parse().map_err(|e| Error::new(ErrorKind::InvalidData, e))))
       .collect()
}

fn calculate_position_and_depth(inputs: &mut &[Move]) -> Coordinates {
    let mut coordinates = Coordinates {horizontal: 0, depth: 0};

    for input in inputs.iter() {
        match &input.0[..] {
            "forward" => coordinates.horizontal += input.1,
            "down" => coordinates.depth += input.1,
            "up" => coordinates.depth -= input.1,
            _ => panic!("Invalid command")
        }
    }

    return coordinates;
}

fn advanced_calculate_position_and_depth(inputs: &mut &[Move]) -> Coordinates {
    let mut coordinates = Coordinates {horizontal: 0, depth: 0};
    let mut aim = 0;

    for input in inputs.iter() {
        match &input.0[..] {
            "forward" => {
                coordinates.horizontal += input.1;
                coordinates.depth += aim * input.1;
            }
            "down" => aim += input.1,
            "up" => aim -= input.1,
            _ => panic!("Invalid command")
        }
    }

    return coordinates;
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn calculate_position_and_depth_works() {
        let inputs: [Move;6] = [
            Move("forward".to_string(), 5),
            Move("down".to_string(), 5),
            Move("forward".to_string(), 8),
            Move("up".to_string(), 3),
            Move("down".to_string(), 8),
            Move("forward".to_string(), 2)
          ];
        let result = calculate_position_and_depth(&mut &inputs[..]);
        let expected = Coordinates {horizontal: 15, depth: 10};
        assert_eq!(result.horizontal, expected.horizontal);
        assert_eq!(result.depth, expected.depth);
    }

    #[test]
    fn advanced_calculate_position_and_depth_works() {
        let inputs: [Move;6] = [
            Move("forward".to_string(), 5),
            Move("down".to_string(), 5),
            Move("forward".to_string(), 8),
            Move("up".to_string(), 3),
            Move("down".to_string(), 8),
            Move("forward".to_string(), 2)
          ];
        let result = advanced_calculate_position_and_depth(&mut &inputs[..]);
        let expected = Coordinates {horizontal: 15, depth: 60};
        assert_eq!(result.horizontal, expected.horizontal);
        assert_eq!(result.depth, expected.depth);
    }
}
