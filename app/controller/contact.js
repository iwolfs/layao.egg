'use strict';

const Controller = require('egg').Controller;


class ContactController extends Controller {
  async list() {
    const { ctx } = this;
    // ctx.body = 'hi, egg';
    const dataSource = await ctx.service.home.index();
    await ctx.render('contact/index.tpl', {navs: dataSource.NavDataSource, cases: dataSource.CaseDataSource});
  }
}

module.exports = ContactController;
