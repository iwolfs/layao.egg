'use strict';

const Controller = require('egg').Controller;


class HomeController extends Controller {
  async index() {
    const { ctx } = this;
    // ctx.body = 'hi, egg';
    const dataSource = await ctx.service.home.index();
    await ctx.render('home/index.tpl', {navs: dataSource.NavDataSource});
  }
}

module.exports = HomeController;
