# CLAUDE.md

## Project Overview

**pokusy** is a simple static web app for controlling a LIFX smart lamp. It allows users to pick a color via a color picker and sends that color to a remote API. The lamp's current color is reflected in real time via a SignalR WebSocket connection.

## Architecture

- **Frontend only** — pure HTML + vanilla JavaScript, no build step required
- **Real-time updates** via SignalR (WebSocket)
- **API** hosted at `https://lifx-lamp-api.azurewebsites.net/api`

## Project Structure

```
index.html        # Main page with SVG light bulb, color picker, and UI
src/
  app.js          # Application logic (SignalR connection, color updates)
vendor/
  signalr.min.js  # Vendored SignalR client library (do not modify)
images/
  background.jpeg # Background image
  logo.png        # Logo
```

## Running Locally

Since there is no build step, simply open `index.html` in a browser or serve it with any static file server:

```bash
# Python
python3 -m http.server 8080

# Node (npx)
npx serve .
```

## Key Source Files

- `src/app.js` — main app class with three methods:
  - `init()` — sets up SignalR connection and button listener
  - `setColor(color)` — POSTs color to API (`/api/setColor?color=<hex>`)
  - `updateColor(color)` — updates SVG bulb fill and text display
- `index.html` — uses Bulma CSS (CDN) for layout; no local CSS files

## Dependencies

All dependencies are either CDN-loaded or vendored:

| Dependency | Source |
|---|---|
| Bulma 0.7.5 | CDN (`cdnjs.cloudflare.com`) |
| SignalR | `vendor/signalr.min.js` |

**No package manager** (no `package.json`, `requirements.txt`, etc.) — nothing to install.

## Development Notes

- The `index.html` has a minor typo in the viewport meta tag (`content="width=\`` — the backtick before `initial-scale`). Be careful when editing this line.
- There are no tests or linters configured for this project.
- `vendor/` files should not be modified.
