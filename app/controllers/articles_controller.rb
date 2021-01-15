require 'wikipedia'
require 'pry'
class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def show
    @article = Article.find(params[:id])
  end

  def create
    article = Wikipedia.find(params[:article][:title])
    @article = Article.new(title: article.title, summary: article.summary, text: article.text, url: article.fullurl)
    @article.save
    redirect_to articles_path
  end

  def destroy
    Article.find(params[:id]).destroy
    redirect_to articles_path
  end
end
