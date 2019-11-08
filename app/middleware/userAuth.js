// const jwt = require('jsonwebtoken');

module.exports = () => {
  return async (ctx, next) => {
    const token = ctx.cookies.get('authorization', { httpOnly: false, signed: false });
    // console.log('user auth token', token, ctx.get('cookie'))
    // console.log(ctx.request)
    if (token) {
      await next();
      // try {
      //   const jwtInfo = jwt.verify(token, ctx.app.config.jwt.secret);
      //   if (!jwtInfo && !jwtInfo.userName) {
      //     ctx.cookies.set('authorization', null);
      //     ctx.redirect('/admin/signin');
      //   } else {
      //     await next();
      //   }
      // } catch (error) {
      //   // ctx.cookies.set('authorization', null);
      //   // ctx.redirect('/admin/signin');
      // }
    } else {
      ctx.redirect(`/admin/signin?c=${ctx.request.url}`);
    }
  }
}