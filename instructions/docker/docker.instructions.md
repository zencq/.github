---
applyTo: "**/compose.yaml,**/Dockerfile,**/.dockerignore,**/*.env.example"
---

<!-- Synced from zencq/.github (instructions/docker/). Edit it there; changes made in a consuming repository are overwritten. -->

# Docker and Compose

## Stacks

- Each stack has its own folder with `compose.yaml`, `.env.example`, and the untracked `.env`. Compose takes the project name from the folder, so commands run in that folder without `-f` or `-p`.
- Container names come from Compose (`<project>-<service>-<number>`). Set `container_name` only when the name is used from outside, such as in `docker exec`.
- Application data lives in bind mounts under `/opt/<stack>/`, owned by the user the image runs as, so it can be backed up and edited with normal tools on the host. Database engines such as Postgres keep a named volume.
- Keep the files lean: leave out settings that repeat a default, and comments that repeat what a key already says. Check the default in the image's documentation before dropping a setting; a guessed default breaks the stack only when it starts.

## Network

- Public services join the external network `proxy`, declared as `name: ${PROXY_NETWORK:-proxy}`, under a short alias that names the service (for example `orders`). The tunnel's hostnames point to `<alias>:<port>`; the alias, not the service name, is what other stacks use, because service names such as `web` can repeat across stacks.
- Publish no ports. Everything public goes through the Cloudflare Tunnel of the `cloudflared` stack.
- A service with a `networks:` list joins only the networks listed, so list `default` as well when it talks to other services of its stack. Databases and other internal services stay on `default` only.

## Configuration

- Secrets and per-server values live only in `.env`. `.env.example` lists every key with a safe placeholder and is tracked; `.env` is ignored by git.
- The `.env` next to `compose.yaml` only fills in `${…}` in the file. Map each value into the service that needs it under `environment:`, with `${KEY:?set KEY in .env}`, so a missing value stops Compose with a clear message and no container gets values it doesn't use. Use `env_file` only for an application that reads many settings and gets all of them, with a `*.env.example` next to it as well.
- Compose fills in the whole file for every command, `down` and `logs` included. Write `$$` for a variable the container resolves itself (such as in a healthcheck), and quote a `.env` value that contains `$` in single quotes.
- `depends_on` names services, not containers. Wait for a dependency with `condition: service_healthy`.

## Images and lifecycle

- Pin application and database images to their major version (such as `postgres:18`), so an update never runs an unplanned major upgrade with migrations. Below 1.0 pin the minor version (`0.4`), because there the minor version is the breaking one. Tools without state may use `latest`.
- Our own applications are built by the release workflow of their repository and pushed to `ghcr.io/zencq/<app>` with the tags `<major>.<minor>.<patch>`, `<major>.<minor>`, and (from 1.0) `<major>`. A stack runs them with `image:`, never with `build:`.
- Update with `docker compose up --pull always --detach`.
- Every service has `restart: unless-stopped` and a `healthcheck`. Images without a shell (distroless) need the `CMD` form; `CMD-SHELL` fails there.
- A `Dockerfile` builds in stages, runs as a non-root user, and declares a `HEALTHCHECK` against the application's health endpoint.

## Postgres

- From Postgres 18 the data lives in `/var/lib/postgresql/<major>/docker`: mount the volume at `/var/lib/postgresql`, not at `/var/lib/postgresql/data`.
- A major upgrade is a dump and a restore:
  - Dump with `docker compose exec -T db sh -c 'pg_dump -U "$POSTGRES_USER" -Fc "$POSTGRES_DB"' > dump`. Without `-T` the binary dump passes through a terminal and breaks.
  - Start only the new database with `docker compose up db --detach --wait`, so the application doesn't create its tables before the restore.
  - Restore with `pg_restore --no-owner` from standard input, then start the rest.
  - `docker compose down` keeps named volumes; remove the old one only after the application works.

## Validating

- Check every changed `compose.yaml` with `docker compose config -q` in its folder, once with a `.env` copied from `.env.example`.
