import { defineConfig } from "astro/config";
import mdx from "@astrojs/mdx";
import tailwindcss from "@tailwindcss/vite";

export default defineConfig({
  site: "https://o526.net",
  integrations: [mdx()],
  markdown: {
    shikiConfig: {
      theme: "rose-pine-dawn",
    },
  },
  vite: {
    plugins: [tailwindcss()],
  },
});
