class HTMLWithPants < Redcarpet::Render::HTML
    include Redcarpet::Render::SmartyPants
end


class ArticlesController < ApplicationController

    def index
        @articles = Article.all
    end

    def show
        @article = Article.find(params[:id])

        

        # renderer = Redcarpet::Render::HTML.new(filter_html: true)
        renderer = HTMLWithPants.new(filter_html: true)

        extensions = {
            no_intra_emphasis: true,
            tables: true,
            fenced_code_blocks: true,
            disable_indented_code_blocks: true, 
            autolink: true, 
            strikethrough: true
        }

        @display_text = Redcarpet::Markdown.new(renderer, extensions)

    end

    def new
    end

    def create
        @article = Article.new(article_params)
 
        @article.save
        redirect_to @article
    end

    private
    def article_params
        params.require(:article).permit(:title, :text)
    end
end
