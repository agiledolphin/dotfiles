# AGENTS.md

本项目用来维护各类软件的配置文件，并进行定制化设置。

## 结构约定

每个软件一个子目录，目录名为软件名，内含该软件原生的配置文件名（如 `starship/starship.toml`、`helix/config.toml`）。新增软件配置时请遵循此约定。

## 安装

运行 `./install.sh` 将各配置软链接到实际路径（可重复执行，已存在的普通文件会备份为 `*.bak`）。新增软件配置时，同步在脚本的 `links` 数组中追加一行。已在 macOS 与 Omarchy 上测试通过。

## 开发约定

- 涉及 Python 程序时，原则上使用 [uv](https://github.com/astral-sh/uv) 工具，不使用 pip、venv、poetry、conda 等：
  - 创建/管理虚拟环境：`uv venv`
  - 安装、添加依赖：`uv add <package>`（而非 `pip install`）
  - 同步依赖：`uv sync`
  - 运行脚本：`uv run <script>.py`（而非直接用 `python`）
  - 单文件脚本的依赖声明使用 PEP 723 内联元数据（`# /// script` 块），配合 `uv run` 执行
  - 依赖锁定使用 `uv.lock`，并纳入版本控制

## 已包含

- `starship/starship.toml` — Starship 提示符配置（已在 macOS 与 Omarchy 上测试通过）
- `helix/config.toml` — Helix 编辑器配置（已在 macOS 与 Omarchy 上测试通过）
- `fastfetch/config.jsonc` — Fastfetch 系统信息配置（Hardware / Software / Network / Status 分栏；已在 macOS 与 Omarchy 上测试通过）
