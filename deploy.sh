# source: https://cli.vuejs.org/guide/deployment.html#github-pages

# abort on errors
set -e

# build
npm run build

# navigate into the build output directory
cd dist

# if you are deploying to a custom domain
# echo 'www.example.com' > CNAME

git init
git add -A
git commit -m 'deploy'


git push -f git@github.com:masmics/image-gallery.git master:gh-pages

cd -
TIP

You can also run the above script in your CI setup to enable automatic deployment on each push.

# GitLab Pages
