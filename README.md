# InquiryLab — Free Online Course Demo

This deployment repository stores the complete sanitized source in `InquiryLab-source.zip`. The root Dockerfile extracts that release during the image build. To update the app, replace the archive with a newly sanitized source release. No API keys, passwords, local student databases or uploads are included.

An interactive science-inquiry prototype with five stages, selectable AI roles, revision history, experimental notes, charts, attachments, and a password-protected teacher dashboard. Chinese and English interfaces are supported.

## Publish on Render (free)

1. Upload this source project to your own GitHub repository. Do not upload your original local project directory: it can contain API keys and student records.
2. In Render, create a Blueprint and select the repository. The included `render.yaml` declares a **Free** Docker web service with an HTTP health check.
3. Wait for deployment to finish. Share the generated `https://...onrender.com` service URL, rather than the Render dashboard URL.
4. Render generates `TEACHER_PASSWORD`. View or replace this secret in the service's Environment section; share it only with the teacher. Open the teacher dashboard from the application footer.

Alternatively, create a Docker Web Service manually, select Free, and configure:

| Variable | Value |
| --- | --- |
| HOST | 0.0.0.0 |
| PORT | 10000 |
| APP_MODE | demo |
| PUBLIC_DEMO | 1 |
| DB_PATH | /tmp/inquiry-data/inquiry.sqlite3 |
| TEACHER_PASSWORD | Set a unique password in Render, not in this repository |

Render supplies `RENDER_EXTERNAL_URL`; the application uses this exact origin for browser API requests. Other hosts should set `PUBLIC_URL` to their HTTPS origin, without a path.

## Demonstration behavior

- A new visitor starts with a complete fictional inquiry. Click Next through the five stages, or select one or more partners for scripted feedback.
- `PUBLIC_DEMO=1` forces demo mode and disables use of Kimi credentials, even if a key or live mode is accidentally supplied.
- The browser displays a notice that the responses and values are fictional and storage is temporary.
- The teacher dashboard shows anonymous sessions on this service. This demonstration does not provide school accounts or formal class separation.
- Records and uploaded attachments can be lost when a free service restarts, redeploys, or spins down. Export records you need to keep. Use only fictional content for this public course demonstration.
- Free Render services sleep after 15 minutes without traffic. The next visit wakes the service and can take roughly a minute. Open the link before your presentation.

Render's current free-service documentation: https://render.com/docs/free

## Local preview

Python 3.10 or later; the application uses the standard library.

```sh
python3 main.py
```

This local command retains the existing local behavior. It does not turn on cloud demo mode by default.

## Testing

```sh
python3 -m unittest test_cloud test_main -q
python3 -m unittest discover -s backend -q
```

The cloud test checks public-origin requests, default English fixtures, teacher authentication, sensitive paths returning 404, and zero paid API calls.

## Files excluded from release

API keys, `.env` files, teacher access files, local SQLite databases, uploaded media, and local screenshots are not part of this source release. Runtime-config is served from the same origin as the application.
