fn main() {
    println!("Hello, world!");
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

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn measurement_increases_works() {
        let mut inputs: [i32;10] = [199,200,208,210,200,207,240,269,260,263];
        let result = measurement_increases(&mut inputs);
        assert_eq!(result, 7);
    }
}
