# AGENTS.md

本项目用来维护各类软件的配置文件，并进行定制化设置。

## 结构约定

每个软件一个子目录，目录名为软件名，内含该软件原生的配置文件名（如 `starship/starship.toml`、`helix/config.toml`）。新增软件配置时请遵循此约定。

## 开发约定

- 涉及 Python 程序时，原则上使用 [uv](https://github.com/astral-sh/uv) 工具（而非 pip/venv/poetry 等）。

## 已包含

- `starship/starship.toml` — Starship 提示符配置
- `helix/config.toml` — Helix 编辑器配置
