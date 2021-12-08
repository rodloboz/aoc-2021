export const schoolSize = (initial_state: number[], days: number) : number => {
  const school: number[] = new Array(9).fill(0);
  initial_state.map(state => {
    school[state] = school[state] ? school[state] + 1 : 1;
  })

  for (const _day of Array(days).keys()) {
    let zeros = school.shift();
    if(zeros !== undefined) {
      school.push(zeros);
      school[6] += zeros;
    }
  }

  return school.reduce((acc, value) => acc + value);
}
