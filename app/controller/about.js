'use strict';

const Controller = require('egg').Controller;


class AboutController extends Controller {
  async index() {
    const { ctx } = this;
    const dataSource = await ctx.service.about.index();
    const randomIndex = Math.floor(Math.random() * 3)
    await ctx.render('about/index.tpl', {aboutBg: dataSource.AboutBgs[randomIndex]});
  }
}

module.exports = AboutController;
