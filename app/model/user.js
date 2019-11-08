module.exports = app => {
  const mongoose = app.mongoose;
  const Schema = mongoose.Schema;

  const UserSchema = new Schema({
    _id: {
      type: Number,
    },
    userName: {
      type: String,
      required: true,
    },
    password: {
      type: String,
      required: true,
    },
    email: {
      type: String,
    },
    role: {
      type: Number,
      enum: [1, 2], // 1 管理员， 2 普通用户
      default: 1
    },
    status: {
      type: Number,
      enum: [1, 2, 3], // 1 正常，2 关闭，3 删除
      default: 1,
    },
    createAt: {
      type: Number,
      default: Date.now,
    },
    updateAt: {
      type: Number,
    },
    deleteAt: {
      type: Number,
    },
    createBy: {
      type: String,
    }
  }, { versionKey: false });

  return mongoose.model('User', UserSchema, 'user');
}