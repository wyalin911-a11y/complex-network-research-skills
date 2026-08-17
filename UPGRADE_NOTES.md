# Upgrade Notes: v1 → v2

## v1
The two custom skills were installed with `cp -R`.

That meant:

```text
suite folder → copied files → ~/.codex/skills
```

If the suite changed later, the installed copies could become stale.

## v2
The custom skills are installed with `ln -s`.

Now:

```text
suite folder → symlink → ~/.codex/skills
```

When the source `SKILL.md` changes, Codex sees the changed source through the same symlink.

## New scripts

### `install_custom_symlinks.sh`
Installs or refreshes the two custom skill links.

### `bootstrap.sh`
Performs first-time setup for:
- custom skill symlinks,
- Microsoft ResearchStudio-Idea,
- ARIS clone,
- optional initial ARIS project setup.

### `update_all.sh`
Updates the available source repositories and reconciles links/installations.

### `register_aris_project.sh`
Adds a project path to the ARIS update list.

### `doctor.sh`
Checks symlinks and repository state.

## Important limitation

If the custom suite is only an extracted ZIP, it has no remote repository, so
`update_all.sh` cannot `git pull` new custom-skill versions.

For full automated updates, store this suite in your own Git repository and clone it to
a stable location.
