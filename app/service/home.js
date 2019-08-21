const Service = require('egg').Service;

class HomeService extends Service {
  async index() {
    const dataSource = require('../datas/data.source')
    return dataSource
  }
}

module.exports = HomeService;