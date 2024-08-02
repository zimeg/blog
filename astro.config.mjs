import { defineConfig } from "astro/config";
import tailwind from "@astrojs/tailwind";
import mdx from "@astrojs/mdx";

export default defineConfig({
  site: "https://o526.net",
  integrations: [tailwind(), mdx()],
  markdown: {
    remarkRehype: {
      footnoteLabel: "footnotes and further reading",
      footnoteBackLabel: "back to the content",
    },
    shikiConfig: {
      theme: "rose-pine-dawn",
    },
  },
});
