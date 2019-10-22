'use strict';

const Controller = require('egg').Controller;


class HomeController extends Controller {
  async index() {
    const { ctx, app } = this;

    // ctx.body = 'hi, egg admin';
    console.log('ctx', ctx.headers)
    await ctx.render('admin/index.tpl', {});
  }
}

module.exports = HomeController;