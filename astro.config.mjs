import { defineConfig } from 'astro/config';
import tailwind from '@astrojs/tailwind';

import cloudflare from "@astrojs/cloudflare";

export default defineConfig({
  site: 'https://bfswebsite.louismilburn.workers.dev',
  integrations: [tailwind()],
  output: "hybrid",
  adapter: cloudflare()
});