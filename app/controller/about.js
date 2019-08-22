'use strict';

const Controller = require('egg').Controller;


class AboutController extends Controller {
  async list() {
    const { ctx } = this;
    // ctx.body = 'hi, egg';
    const dataSource = await ctx.service.home.index();
    await ctx.render('about/index.tpl', {navs: dataSource.NavDataSource, cases: dataSource.CaseDataSource});
  }
}

module.exports = AboutController;
