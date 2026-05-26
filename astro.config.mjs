import { defineConfig } from 'astro/config';
import tailwind from '@astrojs/tailwind';

export default defineConfig({
  site: 'https://bfswebsite.louismilburn.workers.dev',
  integrations: [tailwind()],
  output: 'static',
});
