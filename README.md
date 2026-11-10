<!-- Allow this file to not have a first line heading -->
<!-- markdownlint-disable-file MD041 no-emphasis-as-heading -->

<!-- inline html -->
<!-- markdownlint-disable-file MD033 -->

<div align="center">

<!--- FIXME: Pick an emoji and name your project! --->
# `📦 Roblox Project Template`

<!--- FIXME: Write short catchy description/tagline of project --->
**A streamlined starting point for Roblox projects. Implements Rojo, Wally, Fusion, Asphalt, and more.**

</div>

## Getting started

1. Install the pinned tools: `rokit install`
2. Install packages and export their types: `scripts/install-packages.sh` (or `scripts\install-packages.bat` on Windows)
3. Serve `src/` straight to Studio: `rojo serve` (run `rojo sourcemap --watch --include-non-scripts -o sourcemap.json` alongside it for luau-lsp)

There is no build step: Rojo syncs `src/` as-is, and modules use instance-path requires
(`require(ReplicatedStorage.Common.Log)`, `require(script.Parent.Components.CounterButton)`).

## Assets

Put files under `asphalt/assets/`, set the owner in `asphalt.toml`, and run `scripts/asphalt-sync.sh`.
The first run creates `asphalt/api-key.env` for an Open Cloud key with `asset:read` and `asset:write`.
Asset ids are generated into `src/Common`.

## Editors

`.vscode/` and `.zed/` both format with StyLua on save and point luau-lsp at the Rojo sourcemap.
`.zed/tasks.json` has tasks for serving, installing packages, and syncing assets.
