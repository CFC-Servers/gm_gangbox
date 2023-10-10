# Gangbox
A collection of helpful functions for any GMod developer


# Features
Gangbox offers a lot of useful, time-saving modules. Here are a few of the major ones:
- :warning: Alerts for no-op or silent failures in the GMod API
- :left_right_arrow: Git-Like Table Diffs
- :wastebasket: Helpful Garbage Collector functions
- :mag_right: Asynchronous, grep-like file finding
- :game_die: Functions to return random datasets for testing
- :memo: Table helper functions (like Map/Filter)
- :thread: Super simple Threading functions to run large amounts of work asynchronously

# Modules

## Alerts
Alert modules simply give you printed feedback if you mess something up and it's not immediately clear what you did.

### `file.Write` with an invalid suffix

In GMod, if you do:
```lua
file.Write( "test.blah", "this is a test" )

-- or

file.Write( "test", "this is a test" )
```

It will simply do nothing, because the filename does not have a [valid suffix](https://wiki.facepunch.com/gmod/file.Write).

With Gangbox, a message is printed in your terminal/output if you write to an invalid suffix:
TODO: Image here

### `Entity:AddCallback()` with nil return
If you add a Callback function to an entity with an invalid function, or an invalid hook, `AddCallback` [will return nil](https://wiki.facepunch.com/gmod/Entity:AddCallback).

Developers typically don't check for this, because realistically it's just a development mistake.

As a result, there's really no way to know that this failed. Gangbox prints an alert and raises a (non-halting) error if this happens, giving you visibility to an otherwise frustrating situation:

TODO: Image here

## `gb.Diff( t1, t2 )`
Sometimes you need to compare two similar, but different tables.
Usually this means you print both tables and manually compare them.

But that's tedious. Gangbox offers **`gb.Diff( t1, t2 )`**, which will print a git-like Diff between two tables.

TODO: Image here

<details>
<summary><h4> <strong><img src="https://user-images.githubusercontent.com/7936439/200705159-4c51d043-82a3-4d15-a335-291bb26a5528.png" width="15"> <code>gb.Grep( string search, string scope, string path)</code></strong> </h4></summary>

#### <ins>**Description**</ins>
If you ever need to find certain files by name, **`gb.Grep`** is the tool for you.

It will asynchronously search through all (or a subset) of the Game files and print a list of any files that match your string search.

You may also use the `grep` concommand.

#### <ins>**Arguments**</ins>
1. **`string search`**
    - The substring to search for in all qualifying file names
2. **`string scope`** _(optional)_
    - The Game Scope to search in _(defaults to `GAME`)_
    - Full list [here](https://wiki.facepunch.com/gmod/File_Search_Paths)
3. **`string path`** _(optional)_
    - The file path to start searching in _(defaults to root of the given Scope)_

#### <ins>**Example**</ins>
Searches all addons for the string `"wiremonitorbig"`
```lua
gb.Grep( "wiremonitorbig", "THIRDPARTY" )
````

Or, in your console:
```
grep wiremonitorbig THIRDPARTY
```

TODO: add video clip here
</details>
