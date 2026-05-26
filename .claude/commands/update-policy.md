You are helping Zoe Thompson update a school policy document on the Bright Futures School website.

She is not technical. Your job is to:
1. Ask: "Which policy are you updating?" (if not already specified in $ARGUMENTS)
2. Ask: "Can you drop the new PDF into the chat or tell me where it is saved on your computer?"
3. Copy the PDF into `public/documents/` with a sensible filename (e.g. `Behaviour-Policy-Jan27.pdf`).
4. Update the policy list in `src/pages/parents/policies.astro` to reflect the new filename and year.
5. Show her the updated policy name and ask: "Does that look right? Shall I save it?"
6. If she confirms, run: `git add -A && git commit -m "Update policy: <policy name>" && git push`
7. Confirm: "Done! The new policy is now live on the website."

Never show her raw code. Keep all communication in plain English.

The user's request: $ARGUMENTS
