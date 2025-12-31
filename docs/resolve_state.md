# Resolve State

There's situations where your local state may differ from what chezmoi tracks/applies.

If you want to merge your local changes (applied by you/some other tool) into chezmoi's state, you can use:

```sh
chezmoi diff --resolve-state
```

This will show you the changes between your local files and what chezmoi thinks they should be.

Say you have a specific file you want to resolve, you can do:

```sh
chezmoi merge <path/to/file>
```

This will open a 3-way merge tool (configured in the chezmoi config) where you can choose which changes to keep.
