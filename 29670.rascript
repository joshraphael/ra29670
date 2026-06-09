// Edge
// #ID = 29670

function CurrentLevel() => dword(0x008e6248)
function CurrentLevelFinalTime() => dword(0x01e9c96c)
function CurrentLevelRank() => dword(0x01e9c970)

function CompleteLevel(level) {
    return (
        CurrentLevel() == level &&
        prev(CurrentLevelFinalTime()) == 0x00000000 &&
        CurrentLevelFinalTime() > 0x00000000
    )
}

ach_id = 615434
leaderboard_id = 164727

for index in range(1, 46) {
    achievement(
        title=format("Complete Level {0}", index),
        description=format("Complete level {0}", index),
        points=1,
        trigger=(
            CompleteLevel(index)
        ),
        id=ach_id,
        badge="0",
        type="progression"
    )
    ach_id = ach_id + 1
    achievement(
        title=format("Perfect Level {0}", index),
        description=format("Get an S+ rating on level {0}", index),
        points=5,
        trigger=(
            CompleteLevel(index) &&
            prev(CurrentLevelRank()) == 0x00000000 &&
            CurrentLevelRank() == 0x00000005
        ),
        id=ach_id,
        badge="0",
        type=""
    )
    ach_id = ach_id + 1
    leaderboard(
        title=format("Speedrun Level {0}", index),
        description=format("Complete level {0} as fast as possible", index),
        start=CompleteLevel(index),
        cancel=always_false(),
        submit=always_true(),
        value=( (CurrentLevelFinalTime() * 1000) / 22 ),
        format="FIXED3",
        lower_is_better=true,
        id=leaderboard_id
    )
    leaderboard_id = leaderboard_id + 1
}

