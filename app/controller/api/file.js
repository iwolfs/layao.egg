'use strict';

const Controller = require('egg').Controller;
const fs = require('fs');
const path = require('path');
const pump = require('mz-modules/pump')

const formatNumber = n => {
    n = n.toString();
    return n[1] ? n : `0${n}`;
}

class FileController extends Controller {
    async upload () {
        const {ctx, service} = this;
        const parts = ctx.multipart({autoFields : true});
        const files = [];
        try {
            let stream
            while ((stream = await parts()) != null) {
                const filename = stream.filename.toLowerCase();
                const fileType = stream.mimeType;
                const timestamp = Date.now();
                const saveFilename = `${timestamp}_${filename}`;
                const d = new Date();
                const year = d.getFullYear();
                const month = d.getMonth() + 1;
                const day = d.getDate();
                const fileDirName = [year,month,day].map(formatNumber).join('');
                const fileDir = path.resolve(`app/public/upload/${fileDirName}`);
                if (!fs.existsSync(fileDir)) {
                    const isCreateDir = fs.mkdirSync(fileDir)
                }
                // const target = path.join(this.config.baseDir, 'app/public/img', `${timestamp}_${filename}`)
                const target = path.join(fileDir, saveFilename)
                const writeStream = fs.createWriteStream(target)
                await pump(stream, writeStream)
                files.push({fileName : saveFilename, originName: filename, type: 1, fileType, url : `/public/upload/${fileDirName}/` + saveFilename})
            }
            // 存入数据库
            const _files = await ctx.service.api.file.create(files);

            const resultData = {
                success: true,
                status:"ok", 
                msg: "upload success",
                data: files,
            }
            return ctx.body = JSON.stringify(resultData);
        } catch (e) {
            console.log(e)
            return ctx.body = {
                success: false,
                status: "error", 
                msg: "upload error",
                data: {
                    code: 'E001',
                    msg: 'upload error'
                }
            }
        }
        
    }
}

module.exports = FileController