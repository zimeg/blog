import MarkdownIt from "markdown-it";
import { getCollection } from "astro:content";
import rss from "@astrojs/rss";
import sanitizeHtml from "sanitize-html";

const parser = new MarkdownIt({ html: true });

export async function GET(context) {
    const posts = await getCollection("posts");
    return rss({
        title: "-ez longer ramblings",
        description: "writings of curious ideas",
        site: context.site,
        items: posts.filter((post) => !post.data.hidden)
            .map((post) => ({
                title: post.data.title,
                description: post.data.description,
                pubDate: post.data.posted,
                content: sanitizeHtml(parser.render(post.body), {
                    allowedTags: sanitizeHtml.defaults.allowedTags.concat(["img"]),
                }),
                link: `/blog/post/${post.slug}`,
            })),
    });
}
