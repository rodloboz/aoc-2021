import os

import numpy as np


def main():
    dirname = os.path.dirname(__file__)
    filename = os.path.join(dirname, "../../data/day_4/boards.txt")
    with open(filename, "r") as f:
        boards = f.read()

    filename = os.path.join(dirname, "../../data/day_4/draw.txt")
    with open(filename, "r") as f:
        draw = f.read()

    print(f"First solution: {first_winner(boards,draw)}")
    print(f"Second solution: {last_winner(boards,draw)}")


def input_processing(boards, draw):
    boards = boards.split("\n\n")
    boards = [board.split("\n") for board in boards]
    boards = [
        [line.replace("  ", " ").strip().split(" ") for line in board]
        for board in boards
    ]
    boards = [np.array([[int(n) for n in line] for line in board]) for board in boards]
    draw = draw.split(",")
    draw = [int(n) for n in draw]
    return boards, draw


def first_winner(boards, draw, processing=True):
    if processing:
        boards, draw = input_processing(boards, draw)
    for n in draw:
        for board in boards:
            board[board == n] = -1
            if -5 in board.sum(axis=0) or -5 in board.sum(axis=1):
                board[board == -1] = 0
                output = n * board.sum()
                return output


def last_winner(boards, draw):
    boards, draw = input_processing(boards, draw)
    for n in draw:
        for board in boards:
            board[board == n] = -1
        losers = []
        for i, board in enumerate(boards):
            if not -5 in board.sum(axis=0) and not -5 in board.sum(axis=1):
                losers.append(i)
        if len(losers) == 1:
            board = boards[losers[0]]
            output = first_winner([board], draw, processing=False)
            return output


if __name__ == "__main__":
    main()
    