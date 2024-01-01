import { getCollection } from "astro:content";
import rss from "@astrojs/rss";

export async function GET(context) {
    const notes = await getCollection("notes");
    return rss({
        title: "-ez momentary jots",
        description: "freely feed the bird thoughts",
        site: context.site,
        items: notes.map((note) => ({
            title: `note #${note.slug}`,
            pubDate: note.data.posted,
            content: note.body,
            link: `/blog/note/${note.slug}`,
        })),
    });
}
