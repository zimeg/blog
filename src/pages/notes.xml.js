import MarkdownIt from "markdown-it";
import { getCollection } from "astro:content";
import rss from "@astrojs/rss";
import sanitizeHtml from "sanitize-html";

const parser = new MarkdownIt({ html: true });

export async function GET(context) {
    const notes = await getCollection("notes");
    return rss({
        title: "-ez momentary jots",
        description: "freely feed the bird thoughts",
        site: context.site,
        items: notes.map((note) => ({
            title: `note #${note.slug}`,
            pubDate: note.data.posted,
            content: sanitizeHtml(parser.render(note.body), {
                allowedTags: sanitizeHtml.defaults.allowedTags.concat(["img"]),
            }),
            link: `/blog/note/${note.slug}`,
        })),
    });
}
