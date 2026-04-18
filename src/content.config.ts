import { defineCollection } from "astro:content";
import { z } from "zod";
import { glob } from "astro/loaders";

const about = defineCollection({
  loader: glob({ pattern: "**/*.{md,mdx}", base: "./src/content/about" }),
  schema: z.object({
    title: z.string(),
    description: z.string(),
  }),
});

const experiences = defineCollection({
  loader: glob({ pattern: "**/*.{md,mdx}", base: "./src/content/experiences" }),
  schema: z.object({
    organization: z.string(),
    title: z.string(),
    order: z.number(),
  }),
});

const notes = defineCollection({
  loader: glob({ pattern: "**/*.{md,mdx}", base: "./src/content/notes" }),
  schema: z.object({
    title: z.string(),
    description: z.string(),
    posted: z.date(),
    draft: z.boolean().optional(),
  }),
});

const posts = defineCollection({
  loader: glob({ pattern: "**/*.{md,mdx}", base: "./src/content/posts" }),
  schema: z.object({
    title: z.string(),
    description: z.string(),
    posted: z.date(),
    hidden: z.boolean().optional(),
    draft: z.boolean().optional(),
  }),
});

const projects = defineCollection({
  loader: glob({ pattern: "**/*.{md,mdx}", base: "./src/content/projects" }),
  schema: z.object({
    title: z.string(),
    heading: z.string().optional(),
    description: z.string(),
    order: z.number(),
    repo: z.string().url(),
  }),
});

export const collections = {
  about,
  experiences,
  notes,
  posts,
  projects,
};
