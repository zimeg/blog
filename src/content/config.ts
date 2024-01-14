import { defineCollection, z } from 'astro:content';

const about = defineCollection({
    type: 'content',
    schema: z.object({
        title: z.string(),
        description: z.string(),
    }),
});

const experiences = defineCollection({
    type: 'content',
    schema: z.object({
        organization: z.string(),
        title: z.string(),
        order: z.number(),
    }),
});

const notes = defineCollection({
    type: 'content',
    schema: z.object({
        title: z.string(),
        description: z.string(),
        posted: z.date(),
        draft: z.boolean().optional(),
    }),
});

const posts = defineCollection({
    type: 'content',
    schema: z.object({
        title: z.string(),
        description: z.string(),
        posted: z.date(),
        hidden: z.boolean().optional(),
        draft: z.boolean().optional(),
    }),
});

const projects = defineCollection({
    type: 'content',
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
