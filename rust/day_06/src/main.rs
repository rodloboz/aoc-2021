use num_bigint::{BigInt};
use num_traits::{Zero};
use std::collections::VecDeque;
use std::time::Instant;

fn main() {
    let start = Instant::now();

    let initial_state = [3, 4, 3, 1, 2];
    let mut count: BigInt;
    let mut days = 80;

    count = lanternfish_school_size(&initial_state, days);
    println!("The total number of fish after 80 days: {}", count.to_str_radix(10));

    days = 256;
    count = lanternfish_school_size(&initial_state, days);
    println!("The total number of fish after 256 days: {}", count.to_str_radix(10));

    let elapsed = start.elapsed();
    println!("Elapsed: {:.2?}", elapsed);
}

fn lanternfish_school_size(individuals: &[usize], days: u32) -> BigInt {
    let mut school: VecDeque<BigInt> = VecDeque::new();

    for _ in 0..9 {
        school.push_back(Zero::zero());
    }

    for state in individuals.iter() {
        let value = school.get(*state).unwrap();
        school[*state] = value + BigInt::from(1);
    }

    for _ in 1..days + 1 {
        let t8 = school.pop_front().unwrap().clone();
        let t6 = school.get(6).unwrap().clone() + t8.clone();
        school.push_back(t8);
        school[6] = t6;
    }

    return school.iter().fold(Zero::zero(), |sum, value| sum + value);
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn lanternfish_school_size_works() {
        let initial_state = [3, 4, 3, 1, 2];
        let days = 80;
        let result = lanternfish_school_size(&initial_state, days);
        assert_eq!(result, BigInt::from(5934));
    }
}
