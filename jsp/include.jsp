<!--改动-->

<link href="/starbooks/resource/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!-- 需要用到bootstrap 由于bootstrap的css效果要依赖于jquery 所以 最后也引入了jquery的几个文件  -->
<link href="/starbooks/resource/css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="/starbooks/resource/css/style4.css" rel="stylesheet" type="text/css" media="all" />
<link href="/starbooks/resource/css/form.css" rel="stylesheet" type="text/css" media="all" />
<script src="/starbooks/resource/js/jquery.min.js"></script>
<script src="/starbooks/resource/js/jstarbox.js"></script>
<link rel="stylesheet" href="/starbooks/css/jstarbox.css" type="text/css" media="screen" charset="utf-8" />
<script type="text/javascript">
    jQuery(function () {
        jQuery('.starbox').each(function () {
            var starbox = jQuery(this);
            starbox.starbox({
                average: starbox.attr('data-start-value'),
                changeable: starbox.hasClass('unchangeable') ? false : starbox.hasClass('clickonce') ? 'once' : true,
                ghosting: starbox.hasClass('ghosting'),
                autoUpdateAverage: starbox.hasClass('autoupdate'),
                buttons: starbox.hasClass('smooth') ? false : starbox.attr('data-button-count') || 5,
                stars: starbox.attr('data-star-count') || 5
            }).bind('starbox-value-changed', function (event, value) {
                if (starbox.hasClass('random')) {
                    var val = Math.random();
                    starbox.next().text(' ' + val);
                    return val;
                }
            })
        });
    });
</script>