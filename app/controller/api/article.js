'use strict';

const Controller = require('egg').Controller;

class ArticleController extends Controller {
  async index() {
    const { ctx } = this;
    // return ctx.body = await ctx.service.api.article.find();
    const list = ctx.body = await ctx.service.api.article.find();
    return ctx.body = {
      list,
      total: list.length,
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
    const title = ctx.request.body.title;
    const category = ctx.request.body.category;
    return ctx.body = await ctx.service.api.article.create({title, category});
  }

  async update() {
    const { ctx } = this;
    const _id = ctx.params._id;
    const title = ctx.request.body.title;
    const category = ctx.request.body.category;
    const content = ctx.request.body.content;
    const updateContent = {
      title,
      category,
      content,
      updateBy: Date.now(),
    }
    return ctx.body = await ctx.service.api.article.update(_id, updateContent)
  }
}

module.exports = ArticleController;