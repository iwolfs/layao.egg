module.exports = app => {
  const mongoose = app.mongoose;
  const Schema = mongoose.Schema;

  const CounterSchema = new Schema({
    _id: {
      type: String,
    },
    sequenceValue: {
      type: Number,
    }
  }, {versionKey: false});

  return mongoose.model('Counter', CounterSchema, 'counter');
}