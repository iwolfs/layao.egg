'use strict';

const sha1 = require('sha1');
const jwt = require('jsonwebtoken');
const Controller = require('egg').Controller;

class UserController extends Controller {
  async getUsers() {
    const { ctx } = this;
    const list = await ctx.service.api.user.find();
    return ctx.body = {
      list,
      total: list.length,
    }
  }

  async create() {
    const { ctx } = this;
    const userName = ctx.query.name;
    const pwd = ctx.query.pwd;
    const password = sha1(pwd);
    return ctx.body = await ctx.service.api.user.create({userName, password});
  }

  async signin() {
    const { ctx } = this;
    const { userName, password } = ctx.request.body;
    const pwd = sha1(password);
    const user = await ctx.service.api.user.findOne({userName, password: pwd});
    if (user) {
      const userJson = {
        userName: user.userName,
        _id: user._id,
      }
      const token = jwt.sign(userJson, ctx.app.config.jwt.secret);
      console.log('jwt sectet', ctx.app.config.jwt.secret)
      return ctx.body = {
        success: true,
        data: {token, user},
      }
    } else {
      return ctx.body = {
        success: false,
        data: {
          msg: '账号或密码错误',

        }
      }
    }
  }
}

module.exports = UserController;