const Service = require('egg').Service;

class CityService extends Service {

  async find(condition) {
    return await this.ctx.model.City.find(condition);
  }

}

module.exports = CityService;