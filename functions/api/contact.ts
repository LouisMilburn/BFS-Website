interface Env {
  RESEND_API_KEY?: string;
}

export const onRequestPost: PagesFunction<Env> = async ({ request, env }) => {
  const formData = await request.formData();
  const firstName = formData.get('firstName')?.toString().trim() ?? '';
  const lastName  = formData.get('lastName')?.toString().trim()  ?? '';
  const email     = formData.get('email')?.toString().trim()     ?? '';
  const phone     = formData.get('phone')?.toString().trim()     ?? '';
  const message   = formData.get('message')?.toString().trim()   ?? '';

  if (!firstName || !email || !message) {
    return new Response('Missing required fields', { status: 400 });
  }

  const body = `
Name:    ${firstName} ${lastName}
Email:   ${email}
Phone:   ${phone}

Message:
${message}
  `.trim();

  // Send via Resend if key is configured; otherwise log and return 200 (useful for staging)
  if (env.RESEND_API_KEY) {
    const res = await fetch('https://api.resend.com/emails', {
      method: 'POST',
      headers: {
        Authorization: `Bearer ${env.RESEND_API_KEY}`,
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        from:    'Website Enquiry <noreply@brightfuturesschool.co.uk>',
        to:      ['office@brightfuturesschool.co.uk'],
        replyTo: email,
        subject: `Website enquiry from ${firstName} ${lastName}`,
        text:    body,
      }),
    });

    if (!res.ok) {
      console.error('Resend error:', await res.text());
      return new Response('Failed to send email', { status: 500 });
    }
  } else {
    // No key set yet — log to console so we can verify during development
    console.log('Contact form submission (no RESEND_API_KEY set):\n', body);
  }

  return new Response(JSON.stringify({ ok: true }), {
    status: 200,
    headers: { 'Content-Type': 'application/json' },
  });
};
