# Bright Futures School Website

## What this is

This is the official website for Bright Futures School (brightfuturesschool.co.uk).
It is built with Astro + Tailwind CSS and hosted on Cloudflare Pages.

Changes pushed to the `main` branch on GitHub are automatically deployed — usually live within 1–2 minutes.

## For Zoe (making changes without coding)

Welcome! You don't need to understand code to make changes. Just open Claude Code on your computer, make sure you're in this folder, and type one of these commands:

| Command | What it does |
|---|---|
| `/edit-text` followed by what you want to change | Change any text on the site |
| `/update-policy` | Replace a policy PDF |
| `/swap-image` | Replace a photo |
| `/preview` | See your changes before publishing |

**Example:** Type `/edit-text` and then "The school hours on the contact page are wrong — change Friday to finish at 2.30pm"

Claude will find the right place, show you what it will change, ask you to confirm, and then publish it automatically.

If you're unsure what to type, just describe what you want to change in plain English and Claude will figure it out.

---

## For developers (technical reference)

### Local development

```bash
npm install
npm run dev       # → http://localhost:4321
npm run build     # static output → dist/
```

### Project structure

```
src/
  components/     Header, Footer, ContactBlock
  layouts/        BaseLayout, PageLayout
  pages/          One .astro file per route
  styles/         global.css (Tailwind + brand tokens)
public/
  images/         Site images (logo, gallery, badges)
  documents/      PDFs (policies, prospectus, calendars, reports)
functions/
  api/contact.ts  Cloudflare Pages Function — contact form handler
```

### Brand tokens (Tailwind)

| Token | Hex | Usage |
|---|---|---|
| `brand-cyan` | `#33c4f3` | Primary accent, nav, buttons |
| `brand-green` | `#4f9c45` | Secondary accent |
| `brand-navy` | `#3d526c` | Headings, nav text, footer background |

Font: Open Sans (Google Fonts)

### Contact form

The contact form at `/contact` posts to `/api/contact` (Cloudflare Pages Function).

To enable email sending:
1. Sign up at [resend.com](https://resend.com) and verify `brightfuturesschool.co.uk`.
2. Create an API key.
3. In Cloudflare Pages → Settings → Environment Variables, add `RESEND_API_KEY = <your key>`.

Until the key is set, form submissions are logged to the Cloudflare Pages console (no email sent — safe for staging).

### Deployment

Automatic on push to `main`. Manual trigger: Cloudflare Pages dashboard → Deployments → Retry.

### Adding a new page

1. Create `src/pages/<slug>.astro`
2. Use `<PageLayout title="Page Title">` as the wrapper
3. Add a link to it in `src/components/Header.astro` (nav) and `src/components/Footer.astro` if needed
4. Commit and push

### Updating a policy PDF

1. Place the new PDF in `public/documents/` with a clear filename (e.g. `Behaviour-Policy-Jan27.pdf`)
2. Update the filename reference in `src/pages/parents/policies.astro`
3. Commit and push

### Open items (confirm with Zoe)

- School hours inconsistency: 9.10am vs 9.15am appears on different original pages. Currently set to **9.15am** throughout — please confirm.
- Several policy links on the old site pointed to the same "Curriculum and Assessment Policy 2026" PDF. This may be intentional consolidation or broken links — please review.
- Newsletter content: the original site mentioned newsletters on the History page. If Zoe has newsletter PDFs to add, place them in `public/documents/` and link from `src/pages/about/history.astro`.
- Social media: the school has no social media currently linked. Let Louis know if any should be added.
