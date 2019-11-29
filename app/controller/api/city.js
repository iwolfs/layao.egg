'use strict';

const Controller = require('egg').Controller;

class CityController extends Controller {
  async find() {
    const { ctx } = this;
    const list = await ctx.service.api.city.find();
    return ctx.body = list;
    // return ctx.body = {
    //   list,
    //   total: list.length,
    // }
  }

}

module.exports = CityController;