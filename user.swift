print("Starting")
let m = Machine()

do {
    try m.misuseVector()
} catch {
    print(error)
}

print("Done!")