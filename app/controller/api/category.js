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
    return ctx.body = await ctx.service.api.category.create(name);
  }

  async update() {
    const { ctx } = this;
    const _id = ctx.params._id;
    const name = ctx.request.body.name;
    const updateContent = {
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