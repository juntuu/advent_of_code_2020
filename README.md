## Advent of Code 2020 in Awk

Each day's solution solves both part of the puzzle for that day. The answers
are printed on separate lines. Input can be provided to standard in.

For the problem descriptions, and to get your own input, head over to
[Advent of Code](https://adventofcode.com/2020).

```bash
awk -f "day_$N/solution.awk" < input
```

The solutions may not work on every input, even though I tried to keep them
reasonably general.


### TL;DR

Not feeling like browsing through 25 separate files, with extranious
whitespace, longer than one letter names and relatively straight forward code?

Check `tldr.awk` for short and sweat solutions for all the problems.

**Note worthy**:
- the form factor is "less than 5 lines at 80 columns" to fit within the
  [r/adventofcode](https://www.reddit.com/r/adventofcode/) Megathread format
- these are not runnable as is, you can copy/paste the relevant section,
  and run it separately
- these may rely on specific, non standard, behaviour (e.g. [this fix](
  onetrueawk/awk@ffee7780fe08fa77f662a0903477545d9e26334f) breaks day 17
  formatting)
- there is one day (20), with only part 1 solution, otherwise, each solves both
  parts
- the algorithms used may not always be as efficient as the more verbose ones,
  but not total garbage either
