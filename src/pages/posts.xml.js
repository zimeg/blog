import { getCollection } from "astro:content";
import rss from "@astrojs/rss";

export async function GET(context) {
    const posts = await getCollection("posts");
    return rss({
        title: "-ez longer ramblings",
        description: "writings of curious ideas",
        site: context.site,
        items: posts.filter((post) => !post.data.hidden)
            .map((post) => ({
                title: post.data.title,
                pubDate: post.data.posted,
                content: post.body,
                link: `/blog/post/${post.slug}`,
            })),
    });
}
