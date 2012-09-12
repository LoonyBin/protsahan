
/*
 * GET home page.
 */

exports.index = function(req, res){
  res.render('index', { title: 'Express' });
};

exports.pages = function(req, res){
  res.render('pages/' + req.params[0], { title: 'Express' }, function(err, html) {
    if (err)
      res.send(404, 'Sorry, we cannot find that!');
    else
      res.send(200, html);
  });
};
