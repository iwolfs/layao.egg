const { Channel } = require('./enums');

module.exports.channels = [
  {_id: Channel.ALL, name: '未分类', key: 'all'},
  {_id: Channel.PRODUCT, name: '产品', key: 'product'},
  {_id: Channel.CASE, name: '案例', key: 'case'},
];