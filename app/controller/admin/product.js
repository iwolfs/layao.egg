'use strict';

const Controller = require('egg').Controller;


class ProductController extends Controller {
  async index() {
    const { ctx } = this;
    await ctx.render('admin/product/list.tpl', {});
  }

  async edit() {
    const { ctx } = this;
    const _id = ctx.params._id;
    const product = _id ? await ctx.service.api.article.findById(_id) : {};
    const categories = await ctx.service.api.category.find()
    await ctx.render('admin/product/edit.tpl', {_id, product, categories});
  }
}

module.exports = ProductController;