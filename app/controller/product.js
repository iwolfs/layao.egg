'use strict';

const Controller = require('egg').Controller;


class ProductController extends Controller {
  async list() {
    const { ctx } = this;
    const dataSource = await ctx.service.api.article.find();
    console.log('products', dataSource)
    await ctx.render('product/list.tpl', {navs: dataSource.NavDataSource, products: dataSource});
  }

  async getProduct() {
    const { ctx } = this;
    const _id = ctx.params._id;
    const product = await ctx.service.api.article.findOne({_id})
    await ctx.render('product/detail.tpl', {product});
  }
}

module.exports = ProductController;
