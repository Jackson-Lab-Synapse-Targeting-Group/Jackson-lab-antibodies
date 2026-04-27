# Jackson Lab Antibody Tracker

Standalone HTML antibody inventory tracker for the Jackson Lab.

**Live site:** https://jackson-lab-synapse-targeting-group.github.io/Jackson-lab-antibodies/antibody-tracker.html

---

## Daily use (editing data)

Open `antibody-tracker.html` in any browser. All edits are saved automatically in your browser's localStorage.

---

## Publishing updates to the shared site

### Option A — Auto-publish (recommended)

1. Double-click **`start-watcher.bat`** — leave the window open in the background
2. Make edits in the tracker as normal
3. When ready to publish, click **⬆ Export for Web** in the tracker toolbar
4. The watcher detects the saved file and pushes to GitHub automatically
5. The live site updates within ~1-2 minutes

### Option B — Manual publish

1. Make edits in the tracker
2. Click **⬆ Export for Web** — this downloads an updated `antibody-tracker.html`
3. Replace the file in this folder with the downloaded one
4. Run in a terminal:
   ```
   git add antibody-tracker.html
   git commit -m "update antibody data"
   git push
   ```
5. Changes appear on the live site within ~1-2 minutes

---

## Files

| File | Purpose |
|------|---------|
| `antibody-tracker.html` | Main tracker app |
| `index.html` | Redirect page (sends visitors to tracker) |
| `start-watcher.bat` | Launches auto-publish watcher |
| `watch-and-push.ps1` | PowerShell watcher script (used by start-watcher.bat) |
| `start-tracker.bat` | Launches local HTTP server for Export for Web feature |
| `save_server.py` | Local Python server (used by start-tracker.bat) |
