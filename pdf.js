const puppeteer = require("puppeteer");

const util = require('util');
const exec = util.promisify(require('child_process').exec);

chpater = 'exp6';

(async () => {
  // md -> html
  await exec(`pandoc ${chpater}.md -o ${chpater}.html -s -N --katex --toc --css ../pandoc.css`);

  // html -> pdf
  const browser = await puppeteer.launch();
  const page = await browser.newPage();
  await page.goto(
    `file://${__dirname}/${chpater}/${chpater}.html`
  );

  await page.pdf({
    path: `${chpater}.pdf`,
    format: "a4",
    margin: {
      top: "1cm",
      bottom: "1cm",
      left: "1cm",
      right: "1cm",
    },
  });

  await browser.close();
})();
