/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./src/**/*.{astro,html,js,jsx,md,mdx,ts,tsx}"],
  theme: {
    extend: {
      cursor: {
        wait: 'url(/blog/note/f08df0e4/brick.png) 6 12, wait',
      },
    },
  },
  plugins: [],
};
