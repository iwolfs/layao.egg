'use strict'

const Service = require('egg').Service;

class FileService extends Service {
  async find(condition) {
    return await this.ctx.model.File.find(condition);
  }
  
  async create(files) {
    const { ctx } = this;
    const saveFiles = []
    if (Array.isArray(files)) {
      for (let k in files) {
        const _id = await ctx.service.api.counter.getNextSequenceValue('fileId');
        const file = files[k];
        saveFiles.push({_id, ...file});
      }
    } else {
      const _id = await ctx.service.api.counter.getNextSequenceValue('fileId');
      saveFiles.push({_id, ...files});
    }
    return await ctx.model.File.create(saveFiles);
  }

  async findOne(condition) {
    return await this.ctx.model.File.findOne(condition);
  }
}

module.exports = FileService;