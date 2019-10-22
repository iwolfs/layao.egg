'use strict';

const Controller = require('egg').Controller;


class CategoryController extends Controller {
  async index() {
    const { ctx } = this;
    await ctx.render('admin/category/list.tpl', {});
  }

  async edit() {
    const { ctx } = this;
    const _id = ctx.params._id;
    const category = _id ? await ctx.service.api.category.findById(_id) : {};
    await ctx.render('admin/category/edit.tpl', {_id, category});
  }
}

module.exports = CategoryController;