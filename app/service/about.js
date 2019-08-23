const Service = require('egg').Service;

class AboutService extends Service {
  async index() {
    const dataSource = require('../datas/about.data.source')
    return dataSource
  }
}

module.exports = AboutService;