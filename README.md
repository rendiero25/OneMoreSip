# One More Sip ("Sip!")

Water-intake reminder & tracking app for iOS and Android — Flutter + Supabase. Mascot: Sippy.

## Start here
1. [`CLAUDE.md`](CLAUDE.md) — rules for Claude Code and the document map.
2. [`docs/decisions.md`](docs/decisions.md) — every product decision (D-xx). Highest precedence.
3. [`docs/PRD.md`](docs/PRD.md) — features (F-xx), business rules (BR-xx), pricing, ads policy, flows.
4. [`docs/system-design.md`](docs/system-design.md) — architecture, data model, security (SD-x).
5. [`docs/design-system.md`](docs/design-system.md) — tokens and components (DS-x).
6. [`docs/store-compliance.md`](docs/store-compliance.md) — App Store & Play checklist (SC-xx).
7. [`docs/task.md`](docs/task.md) — Phase 1 backlog to v1.0 (T-xxx, owner tasks O-xx).
8. [`docs/claude-design-prompts.md`](docs/claude-design-prompts.md) — screen list and prompts (UI-xx).
9. [`data/`](data/README.md) — drink database draft.

## How the IDs connect
```
decisions (D) ─▶ PRD (F, BR) ─▶ system-design (SD) ─▶ task (T) ◀─ store-compliance (SC)
                     │                                   ▲
                     └──▶ design-system (DS) ─▶ claude-design-prompts (UI)
```
Every task cites the IDs it implements; every compliance item cites the task that satisfies it.
