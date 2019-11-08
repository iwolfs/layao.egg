'use strict';

const Controller = require('egg').Controller;

class ArticleController extends Controller {
  async index() {
    const { ctx } = this;
    // return ctx.body = await ctx.service.api.article.find();
    const params = ctx.request.query;
    delete params._ // 移除系统自带参数
    const articleData = ctx.body = await ctx.service.api.article.find(ctx.request.query);
    return ctx.body = {
      success: true,
      data: articleData,
    }
  }

  async getArticle() {
    const { ctx } = this;
    const _id = ctx.params._id;
    const article = await ctx.service.api.article.findById(_id);
    return ctx.body = article;
  }

  async create() {
    const { ctx } = this;
    const category = ctx.request.body.category;
    const title = ctx.request.body.title;
    const summary = ctx.request.body.summary;
    const cover = ctx.request.body.cover;
    const content = ctx.request.body.content;
    const status = ctx.request.body.status;
    return ctx.body = await ctx.service.api.article.create({title, summary, cover, category, content, status});
  }

  async update() {
    const { ctx } = this;
    const _id = ctx.params._id;
    const category = ctx.request.body.category;
    const title = ctx.request.body.title;
    const summary = ctx.request.body.summary;
    const cover = ctx.request.body.cover;
    const content = ctx.request.body.content;
    const status = ctx.request.body.status;
    const updateContent = {
      category,
      title,
      summary,
      cover,
      content,
      status,
      updateBy: Date.now(),
    }
    return ctx.body = await ctx.service.api.article.update(_id, updateContent)
  }
}

module.exports = ArticleController;