const Service = require('egg').Service;

class CounterService extends Service {
  async getNextSequenceValue(sequenceName) {
    const sequenceDocument = await this.ctx.model.Counter.findOneAndUpdate({_id: sequenceName}, {
      $inc: {
        sequenceValue: 1
      }
    }, {new: true});
    
    return sequenceDocument.sequenceValue;
  }

  async find() {
    return await this.ctx.model.Counter.find();
  }

  async findOne(condition) {
    return await this.ctx.model.Counter.find(condition);
  }

  async addSequence(sequenceName) {
    return await this.ctx.model.Counter.create({_id: sequenceName, sequenceValue: 0});
  }

  async updateSequence(sequenceName) {
    return await this.ctx.model.Counter.updateOne({_id: sequenceName}, {sequenceValue: 0});
  }

  async deleteSequence(sequenceName) {
    return await this.ctx.model.Counter.deleteOne({_id: sequenceName});
  }
}

module.exports = CounterService;