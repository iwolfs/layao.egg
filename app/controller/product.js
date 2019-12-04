'use strict';

const Controller = require('egg').Controller;
const { Channel } = require('../common/enums');


class ProductController extends Controller {
  async list() {
    const { ctx } = this;
    const params = {channel: Channel.PRODUCT}
    const dataSource = await ctx.service.api.article.find(params);
    await ctx.render('product/list.tpl', {products: dataSource});
  }

  async getProduct() {
    const { ctx } = this;
    const _id = ctx.params._id;
    const product = await ctx.service.api.article.findOne({_id})
    await ctx.render('product/detail.tpl', {product});
  }
}

module.exports = ProductController;
