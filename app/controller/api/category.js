'use strict';

const Controller = require('egg').Controller;

class CategoryController extends Controller {
  async index() {
    const { ctx } = this;
    // return ctx.body = await ctx.service.api.category.find();
    const list = await ctx.service.api.category.find();
    return ctx.body = {
      list,
      total: list.length,
    }
  }

  async create() {
    const { ctx } = this;
    const name = ctx.request.body.name;
    const type = ctx.request.body.type || 0;
    return ctx.body = await ctx.service.api.category.create(name, type);
  }

  async update() {
    const { ctx } = this;
    const _id = ctx.params._id;
    const name = ctx.request.body.name;
    const type = ctx.request.body.type;
    const updateContent = {
      type,
      name,
      updateBy: Date.now(),
    }
    return ctx.body = await ctx.service.api.category.update(_id, updateContent)
  }

  async findById() {
    const { ctx } = this;
    const _id = ctx.params._id;
    return ctx.body = await ctx.service.api.category.findById(_id);
  }
}

module.exports = CategoryController;