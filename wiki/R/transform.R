locate_separatrix <- function(html) {
    which(stringr::str_detect(html, stringr::fixed('<!--separatrix-->')));
}

make_wiki_local <- function() {
    wiki <- readr::read_lines('.wiki.html');
    wiki = wiki[1:locate_separatrix(wiki)];

    local <- readr::read_lines('.local.html');
    local[1] = '<!DOCTYPE html>'
    local = local[1:locate_separatrix(local)];

    list(wiki = wiki, local = local);
}
wiki.local <- make_wiki_local();

#' @export
to_local <- function(input, output = input) {
    html <- readr::read_lines(input);
    rest <- html[(locate_separatrix(html) + 1):length(html)];
    result <- c(wiki.local$local, rest);
    result = transfrom_link(result, TRUE);

    readr::write_lines(result, output);
}

#' @export
to_wiki <- function(input, output = input) {
    html <- readr::read_lines(input);
    rest <- html[(locate_separatrix(html) + 1):length(html)];
    result <- c(wiki.local$wiki, rest);
    if (input == 'template.menubar.html' || input == 'template.footer.html')
        result[1] = '{{NKU_China/wiki}}';
    result = transfrom_link(result, FALSE);
    readr::write_lines(result, output);
}

#' @export
wiki_backup <- function() {
    backup.dir <- stringr::str_replace_all(paste0('../wiki backup/',Sys.time()), ':','-')
    dir.create(backup.dir)
    file.copy('.', backup.dir, recursive = T)
}

#' @export
transform_whole <- function(fun) {
    file <- c('Lab_Notes.html', 'Team.html', 'index.html', 'Attributions.html', 'Collaborations.html', 'Description.html', 'Parts.html', 'Safety.html', 'Demonstrate.html', 'InterLab.html',  'template.menubar.html', 'Proof.html', 'Experiments.html', 'template.footer.html', 'Protocols.html', 'Human_Practices.html', 'Silver.html', 'Gold.html', 'Model.html')
    for (i in seq_along(file)) {
        fun(file[i]);
    }
}

transfrom_link <- function(html, wiki.to.local) {
    map = if (wiki.to.local) map else cbind(map[,2], map[,1])

    for (i in seq(nrow(map)))
        html <- stringr::str_replace(html, stringr::fixed(map[i,1]), map[i,2])
    html
}

create_map <- function() {
    map <- matrix('', 1000, 2);
    i = 0;



    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/d/dd/Main-Page-Introduction-1.jpg';
    map[i,2] = '../image/index/Introduction-1.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/f/f8/Main-Page-Introduction-2.jpg';
    map[i,2] = '../image/index/Introduction-2.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/b/b8/T--NKU_China--Main-Page-Introduction-3.jpg';
    map[i,2] = '../image/index/Introduction-3.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/7/78/Main-Page-Introduction-4.jpg';
    map[i,2] = '../image/index/Introduction-4.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/0/06/T--NKU_China--Main-Page-result-1.jpg';
    map[i,2] = '../image/index/result-1.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/e/e5/T--NKU_China--Main-Page-result-2.jpg';
    map[i,2] = '../image/index/result-2.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/0/02/T--NKU_China--Main-Page-result-3.jpg';
    map[i,2] = '../image/index/result-3.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/6/69/T--NKU_China--Main-Page-HP-1.jpg';
    map[i,2] = '../image/index/HP-1.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/f/f9/T--NKU_China--Main-Page-HP-2.jpg';
    map[i,2] = '../image/index/HP-2.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/5/5c/T--NKU_China--Main-Page-HP-3.jpg';
    map[i,2] = '../image/index/HP-3.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/b/b3/T--NKU_China--Main-Page-HP-4.jpg';
    map[i,2] = '../image/index/HP-4.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/8/82/T--NKU_China--Main-Page-HP-5.jpg';
    map[i,2] = '../image/index/HP-5.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/3/3c/T--NKU_China--Main-Page-HP-6.jpg';
    map[i,2] = '../image/index/HP-6.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/6/6b/T--NKU_China--Main-Page-HP-7.jpg';
    map[i,2] = '../image/index/HP-7.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/7/70/T--NKU_China--Main-Page-HP-8.jpg';
    map[i,2] = '../image/index/HP-8.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/e/eb/T--NKU_China--footer-1.png';
    map[i,2] = '../image/footer/1.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/f/f2/T--NKU_China--footer-2.png';
    map[i,2] = '../image/footer/2.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/1/12/T--NKU_China--footer-3.png';
    map[i,2] = '../image/footer/3.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/d/d2/T--NKU_China--footer-4.png';
    map[i,2] = '../image/footer/4.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/8/81/T--NKU_China--logo.png';
    map[i,2] = '../image/logo.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/0/0a/T--NKU_China--mascot.png';
    map[i,2] = '../image/mascot.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/4/44/T--NKU_China--Model-01.png';
    map[i,2] = '../image/Model/1.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/7/72/T--NKU_China--Model-02.png';
    map[i,2] = '../image/Model/2.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/e/e5/T--NKU_China--Model-03.png';
    map[i,2] = '../image/Model/3.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/6/69/T--NKU_China--Model-04.png';
    map[i,2] = '../image/Model/4.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/9/90/T--NKU_China--Model-05.png';
    map[i,2] = '../image/Model/5.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/c/cc/T--NKU_China--parts-1.png';
    map[i,2] = '../image/Parts/1.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/2/2a/T--NKU_China--parts-2.jpg';
    map[i,2] = '../image/Parts/2.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/6/65/T--NKU_China--parts-3.png';
    map[i,2] = '../image/Parts/3.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/4/40/T--NKU_China--parts-4.png';
    map[i,2] = '../image/Parts/4.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/c/c8/T--NKU_China--Proof-01.png';
    map[i,2] = '../image/Proof/01.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/2/25/T--NKU_China--Proof-02.png';
    map[i,2] = '../image/Proof/02.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/f/f4/T--NKU_China--Proof-03.png';
    map[i,2] = '../image/Proof/03.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/9/9d/T--NKU_China--Proof-04.png';
    map[i,2] = '../image/Proof/04.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/d/d7/T--NKU_China--Proof-05.jpg';
    map[i,2] = '../image/Proof/05.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/b/b1/T--NKU_China--Proof-06.png';
    map[i,2] = '../image/Proof/06.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/7/73/T--NKU_China--Proof-07.png';
    map[i,2] = '../image/Proof/07.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/7/71/T--NKU_China--Proof-08.png';
    map[i,2] = '../image/Proof/08.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/6/60/T--NKU_China--Proof-09.png';
    map[i,2] = '../image/Proof/09.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/7/77/T--NKU_China--Proof-10.png';
    map[i,2] = '../image/Proof/10.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/3/36/T--NKU_China--Proof-11.png';
    map[i,2] = '../image/Proof/11.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/b/b0/T--NKU_China--Proof-12.png';
    map[i,2] = '../image/Proof/12.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/4/49/T--NKU_China--Proof-13.png';
    map[i,2] = '../image/Proof/13.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/9/91/T--NKU_China--Proof-14.png';
    map[i,2] = '../image/Proof/14.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/9/98/T--NKU_China--Proof-15.png';
    map[i,2] = '../image/Proof/15.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/d/d1/T--NKU_China--Proof-16.png';
    map[i,2] = '../image/Proof/16.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/5/5a/T--NKU_China--Demonstrate-01.png';
    map[i,2] = '../image/Demonstrate/01.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/9/96/T--NKU_China--Demonstrate-02.png';
    map[i,2] = '../image/Demonstrate/02.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/7/75/T--NKU_China--Demonstrate-03.jpg';
    map[i,2] = '../image/Demonstrate/03.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/a/a8/T--NKU_China--Demonstrate-04.png';
    map[i,2] = '../image/Demonstrate/04.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/c/c3/T--NKU_China--Demonstrate-05.png';
    map[i,2] = '../image/Demonstrate/05.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/d/de/T--NKU_China--Demonstrate-06.png';
    map[i,2] = '../image/Demonstrate/06.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/1/16/T--NKU_China--Demonstrate-07.png';
    map[i,2] = '../image/Demonstrate/07.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/0/0d/T--NKU_China--Interlab-1.png';
    map[i,2] = '../image/Interlab/1.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/2/2d/T--NKU_China--Interlab-2.png';
    map[i,2] = '../image/Interlab/2.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/e/e1/T--NKU_China--Interlab-3.png';
    map[i,2] = '../image/Interlab/3.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/0/05/T--NKU_China--Interlab-4.png';
    map[i,2] = '../image/Interlab/4.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/3/3f/T--NKU_China--Interlab-5.png';
    map[i,2] = '../image/Interlab/5.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/2/29/T--NKU_China--Nankai_bottom1.jpg';
    map[i,2] = '../image/Nankai_bottom1.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/c/c6/T--NKU_China--Nankai_bottom2.jpg';
    map[i,2] = '../image/Nankai_bottom2.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/6/61/T--NKU_China--Nankai_bottom3.jpg';
    map[i,2] = '../image/Nankai_bottom3.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/4/47/T--NKU_China--Description-01.png';
    map[i,2] = '../image/Description/01.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/3/35/T--NKU_China--Description-02.png';
    map[i,2] = '../image/Description/02.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/9/90/T--NKU_China--Description-03.png';
    map[i,2] = '../image/Description/03.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/3/31/T--NKU_China--Description-04.png';
    map[i,2] = '../image/Description/04.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/3/3c/T--NKU_China--Description-05.png';
    map[i,2] = '../image/Description/05.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/7/78/T--NKU_China--Collaborations-01.jpg';
    map[i,2] = '../image/Collaborations/01.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/8/8b/T--NKU_China--Collaborations-02.png';
    map[i,2] = '../image/Collaborations/02.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/2/21/T--NKU_China--Collaborations-03.png';
    map[i,2] = '../image/Collaborations/03.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/5/59/T--NKU_China--Collaborations-04.png';
    map[i,2] = '../image/Collaborations/04.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/1/19/T--NKU_China--Collaborations-05.png';
    map[i,2] = '../image/Collaborations/05.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/5/59/T--NKU_China--Protocols-01.jpg';
    map[i,2] = '../image/Protocols/image001.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/6/61/T--NKU_China--Protocols-02.jpg';
    map[i,2] = '../image/Protocols/image002.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/d/da/T--NKU_China--Protocols-03.jpg';
    map[i,2] = '../image/Protocols/image003.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/c/c1/T--NKU_China--Protocols-04.jpg';
    map[i,2] = '../image/Protocols/image004.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/f/fb/T--NKU_China--Protocols-05.jpg';
    map[i,2] = '../image/Protocols/image005.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/5/5e/T--NKU_China--Experiments-1.png';
    map[i,2] = '../image/Experiments/1.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/a/a3/T--NKU_China--Experiments-2.png';
    map[i,2] = '../image/Experiments/2.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/d/dd/T--NKU_China--Experiments-3.png';
    map[i,2] = '../image/Experiments/3.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/c/c6/T--NKU_China--Experiments-4.png';
    map[i,2] = '../image/Experiments/4.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/2/2b/T--NKU_China--Experiments-5.png';
    map[i,2] = '../image/Experiments/5.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/2/20/T--NKU_China--Experiments-6.png';
    map[i,2] = '../image/Experiments/6.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/9/9c/T--NKU_China--whole-group-1366-768.jpg';
    map[i,2] = '../image/whole-group.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/a/ae/T--NKU_China--765-574-shifuchen.jpg';
    map[i,2] = '../image/Team 765 574/shifuchen.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/c/ce/T--NKU_China--765-574-qiaomingqiang-4-3.jpg';
    map[i,2] = '../image/Team 765 574/qiaomingqiang-4-3.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/9/93/T--NKU_China--765-574-chenlingyi.jpg';
    map[i,2] = '../image/Team 765 574/chenlingyi.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/8/8d/T--NKU_China--765-574-songcunjiang-4-3.png';
    map[i,2] = '../image/Team 765 574/songcunjiang-4-3.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/f/fd/T--NKU_China--765-574-mengfankang.jpg';
    map[i,2] = '../image/Team 765 574/mengfankang.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/9/90/T--NKU_China--765-574-liuxiao-4-3.jpg';
    map[i,2] = '../image/Team 765 574/liuxiao-4-3.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/3/3c/T--NKU_China--765-574-maxinyu.jpg';
    map[i,2] = '../image/Team 765 574/maxinyu.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/6/69/T--NKU_China--765-574-xiongyuxiu-4-3.png';
    map[i,2] = '../image/Team 765 574/xiongyuxiu-4-3.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/d/df/T--NKU_China--765-574-dangyulei-4-3.png';
    map[i,2] = '../image/Team 765 574/dangyulei-4-3.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/1/1f/T--NKU_China--765-574-quanyufen-4-3.jpg';
    map[i,2] = '../image/Team 765 574/quanyufen-4-3.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/e/ec/T--NKU_China--765-574-dongzhuoer-4-3.jpg';
    map[i,2] = '../image/Team 765 574/dongzhuoer-4-3.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/9/91/T--NKU_China--765-574-dailiangti.jpg';
    map[i,2] = '../image/Team 765 574/dailiangti.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/2/25/T--NKU_China--765-574-zhaoxianglin.jpg';
    map[i,2] = '../image/Team 765 574/zhaoxianglin.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/1/17/T--NKU_China--765-574-chenchen.jpg';
    map[i,2] = '../image/Team 765 574/chenchen.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/8/86/T--NKU_China--765-574-zhangmengxian.jpg';
    map[i,2] = '../image/Team 765 574/zhangmengxian.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/b/b2/T--NKU_China--765-574-songxinghao.jpg';
    map[i,2] = '../image/Team 765 574/songxinghao.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/3/33/T--NKU_China--765-574-zhangzhaoran-4-3.jpg';
    map[i,2] = '../image/Team 765 574/zhangzhaoran-4-3.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/e/e8/T--NKU_China--765-574-kongannie-4-3.jpg';
    map[i,2] = '../image/Team 765 574/kongannie-4-3.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/e/e3/T--NKU_China--765-574-dongjingzhe.jpg';
    map[i,2] = '../image/Team 765 574/dongjingzhe.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/d/d2/T--NKU_China--765-574-zhaoyujie.jpg';
    map[i,2] = '../image/Team 765 574/zhaoyujie.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/d/dd/T--NKU_China--765-574-zhoujindi.jpg';
    map[i,2] = '../image/Team 765 574/zhoujindi.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/1/1c/T--NKU_China--765-574-maojiwei-4-3.jpg';
    map[i,2] = '../image/Team 765 574/maojiwei-4-3.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/e/e5/T--NKU_China--765-574-wangxiangxiang.jpg';
    map[i,2] = '../image/Team 765 574/wangxiangxiang.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/3/3f/T--NKU_China--765-574-shenghaocheng.jpg';
    map[i,2] = '../image/Team 765 574/shenghaocheng.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/3/30/T--NKU_China--765-574-zhanghanchenxi.jpg';
    map[i,2] = '../image/Team 765 574/zhanghanchenxi.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/4/44/T--NKU_China--765-574-keziying.jpg';
    map[i,2] = '../image/Team 765 574/keziying.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/d/d7/T--NKU_China--765-574-zhaokun.jpg';
    map[i,2] = '../image/Team 765 574/zhaokun.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/9/9c/T--NKU_China--765-574-tianruilin-4-3.jpg';
    map[i,2] = '../image/Team 765 574/tianruilin-4-3.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/4/44/T--NKU_China--765-574-zhouhang-4-3.jpg';
    map[i,2] = '../image/Team 765 574/zhouhang-4-3.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/e/ed/T--NKU_China--1000-750-chenchen.jpg';
    map[i,2] = '../image/Team 1000 750/chenchen.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/a/ad/T--NKU_China--1000-750-chenlingyi.jpg';
    map[i,2] = '../image/Team 1000 750/chenlingyi.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/5/56/T--NKU_China--1000-750-dailiangti.jpg';
    map[i,2] = '../image/Team 1000 750/dailiangti.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/7/70/T--NKU_China--1000-750-dongjingzhe.jpg';
    map[i,2] = '../image/Team 1000 750/dongjingzhe.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/7/7a/T--NKU_China--1000-750-dongzhuoer-4-3.jpg';
    map[i,2] = '../image/Team 1000 750/dongzhuoer-4-3.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/7/76/T--NKU_China--1000-750-kongannie-4-3.jpg';
    map[i,2] = '../image/Team 1000 750/kongannie-4-3.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/c/cc/T--NKU_China--1000-750-liuxiao-4-3.jpg';
    map[i,2] = '../image/Team 1000 750/liuxiao-4-3.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/9/99/T--NKU_China--1000-750-maojiwei-4-3.jpg';
    map[i,2] = '../image/Team 1000 750/maojiwei-4-3.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/4/47/T--NKU_China--1000-750-mengfankang.jpg';
    map[i,2] = '../image/Team 1000 750/mengfankang.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/6/60/T--NKU_China--1000-750-qiaomingqiang-4-3.jpg';
    map[i,2] = '../image/Team 1000 750/qiaomingqiang-4-3.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/b/b3/T--NKU_China--1000-750-maxinyu.jpg';
    map[i,2] = '../image/Team 1000 750/maxinyu.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/c/ca/T--NKU_China--1000-750-shenghaocheng.jpg';
    map[i,2] = '../image/Team 1000 750/shenghaocheng.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/1/15/T--NKU_China--1000-750-shifuchen.jpg';
    map[i,2] = '../image/Team 1000 750/shifuchen.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/b/b2/T--NKU_China--1000-750-songcunjiang-4-3.png';
    map[i,2] = '../image/Team 1000 750/songcunjiang-4-3.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/d/de/T--NKU_China--1000-750-songxinghao.jpg';
    map[i,2] = '../image/Team 1000 750/songxinghao.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/2/2f/T--NKU_China--1000-750-keziying.jpg';
    map[i,2] = '../image/Team 1000 750/keziying.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/a/a9/T--NKU_China--1000-750-tianruilin-4-3.jpg';
    map[i,2] = '../image/Team 1000 750/tianruilin-4-3.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/1/14/T--NKU_China--1000-750-wangxiangxiang.jpg';
    map[i,2] = '../image/Team 1000 750/wangxiangxiang.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/f/fd/T--NKU_China--1000-750-whole-group-4-3.png';
    map[i,2] = '../image/Team 1000 750/whole-group-4-3.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/6/6e/T--NKU_China--1000-750-xiongyuxiu-4-3.png';
    map[i,2] = '../image/Team 1000 750/xiongyuxiu-4-3.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/2/23/T--NKU_China--1000-750-zhanghanchenxi.jpg';
    map[i,2] = '../image/Team 1000 750/zhanghanchenxi.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/f/f3/T--NKU_China--1000-750-zhangmengxian.jpg';
    map[i,2] = '../image/Team 1000 750/zhangmengxian.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/4/4a/T--NKU_China--1000-750-zhangzhaoran-4-3.jpg';
    map[i,2] = '../image/Team 1000 750/zhangzhaoran-4-3.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/3/39/T--NKU_China--1000-750-zhaokun.jpg';
    map[i,2] = '../image/Team 1000 750/zhaokun.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/0/09/T--NKU_China--1000-750-zhaoxianglin.jpg';
    map[i,2] = '../image/Team 1000 750/zhaoxianglin.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/d/df/T--NKU_China--1000-750-zhaoyujie.jpg';
    map[i,2] = '../image/Team 1000 750/zhaoyujie.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/e/e0/T--NKU_China--1000-750-zhoujindi.jpg';
    map[i,2] = '../image/Team 1000 750/zhoujindi.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/0/07/T--NKU_China--1000-750-zhouhang-4-3.jpg';
    map[i,2] = '../image/Team 1000 750/zhouhang-4-3.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/9/9d/T--NKU_China--HP-1.jpg';
    map[i,2] = '../image/HP/HP-1.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/5/5c/T--NKU_China--HP-2.jpg';
    map[i,2] = '../image/HP/HP-2.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/7/75/T--NKU_China--HP-3.jpg';
    map[i,2] = '../image/HP/HP-3.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/7/7c/T--NKU_China--HP-4.jpg';
    map[i,2] = '../image/HP/HP-4.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/d/d0/T--NKU_China--HP-5.jpg';
    map[i,2] = '../image/HP/HP-5.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/b/b0/T--NKU_China--HP-6.jpg';
    map[i,2] = '../image/HP/HP-6.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/5/52/T--NKU_China--HP-7.jpg';
    map[i,2] = '../image/HP/HP-7.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/4/43/T--NKU_China--HP-8.jpg';
    map[i,2] = '../image/HP/HP-8.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/d/d1/T--NKU_China--HP-9.jpg';
    map[i,2] = '../image/HP/HP-9.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/d/dd/T--NKU_China--HP-10.jpg';
    map[i,2] = '../image/HP/HP-10.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/5/5f/T--NKU_China--HP-11.jpg';
    map[i,2] = '../image/HP/HP-11.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/6/6f/T--NKU_China--HP-12.jpg';
    map[i,2] = '../image/HP/HP-12.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/a/a7/T--NKU_China--HP-13.jpg';
    map[i,2] = '../image/HP/HP-13.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/9/9e/T--NKU_China--HP-14.jpg';
    map[i,2] = '../image/HP/HP-14.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/6/62/T--NKU_China--HP-15.jpg';
    map[i,2] = '../image/HP/HP-15.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/6/67/T--NKU_China--HP-16.jpg';
    map[i,2] = '../image/HP/HP-16.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/a/a6/T--NKU_China--HP-17.jpg';
    map[i,2] = '../image/HP/HP-17.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/e/eb/T--NKU_China--HP-18.jpg';
    map[i,2] = '../image/HP/HP-18.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/2/23/T--NKU_China--HP-19.jpg';
    map[i,2] = '../image/HP/HP-19.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/7/78/T--NKU_China--HP-20.jpg';
    map[i,2] = '../image/HP/HP-20.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/0/07/T--NKU_China--HP-21.jpg';
    map[i,2] = '../image/HP/HP-21.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/5/5f/T--NKU_China--HP-22.jpg';
    map[i,2] = '../image/HP/HP-22.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/a/a0/T--NKU_China--HP-23.jpg';
    map[i,2] = '../image/HP/HP-23.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/4/4f/T--NKU_China--HP-24.jpg';
    map[i,2] = '../image/HP/HP-24.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/e/e6/T--NKU_China--HP-25.jpg';
    map[i,2] = '../image/HP/HP-25.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/0/05/T--NKU_China--HP-26.jpg';
    map[i,2] = '../image/HP/HP-26.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/4/49/T--NKU_China--HP-27.jpg';
    map[i,2] = '../image/HP/HP-27.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/7/74/T--NKU_China--HP-28.jpg';
    map[i,2] = '../image/HP/HP-28.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/f/fe/T--NKU_China--HP-29.jpg';
    map[i,2] = '../image/HP/HP-29.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/9/9f/T--NKU_China--HP-30.jpg';
    map[i,2] = '../image/HP/HP-30.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/8/89/T--NKU_China--HP-31.jpg';
    map[i,2] = '../image/HP/HP-31.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/2/24/T--NKU_China--HP-32.jpg';
    map[i,2] = '../image/HP/HP-32.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/0/01/T--NKU_China--HP-33.jpg';
    map[i,2] = '../image/HP/HP-33.jpg';

    # i = i + 1;
    # map[i,1] = 'http://2016.igem.org/wiki/images/4/42/T--NKU_China--HP-34.jpg';
    # map[i,2] = '../image/HP/HP-34.jpg';
    #
    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/6/65/T--NKU_China--HP-35.jpg';
    map[i,2] = '../image/HP/HP-35.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/e/ec/T--NKU_China--HP-36.jpg';
    map[i,2] = '../image/HP/HP-36.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/c/cc/T--NKU_China--HP-37.jpg';
    map[i,2] = '../image/HP/HP-37.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/8/86/T--NKU_China--HP-38.jpg';
    map[i,2] = '../image/HP/HP-38.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/5/5b/T--NKU_China--HP-39.jpg';
    map[i,2] = '../image/HP/HP-39.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/7/74/T--NKU_China--HP-40.jpg';
    map[i,2] = '../image/HP/HP-40.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/f/f6/T--NKU_China--HP-41.jpg';
    map[i,2] = '../image/HP/HP-41.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/a/a8/T--NKU_China--HP-42.jpg';
    map[i,2] = '../image/HP/HP-42.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/a/ae/T--NKU_China--HP-43.jpg';
    map[i,2] = '../image/HP/HP-43.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/d/da/T--NKU_China--HP-44.jpg';
    map[i,2] = '../image/HP/HP-44.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/5/5c/T--NKU_China--HP-45.jpg';
    map[i,2] = '../image/HP/HP-45.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/0/08/T--NKU_China--HP-46.jpg';
    map[i,2] = '../image/HP/HP-46.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/1/10/T--NKU_China--HP-47.jpg';
    map[i,2] = '../image/HP/HP-47.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/7/79/T--NKU_China--HP-48.jpg';
    map[i,2] = '../image/HP/HP-48.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/0/00/T--NKU_China--HP-49.jpg';
    map[i,2] = '../image/HP/HP-49.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/6/6a/T--NKU_China--HP-50.jpg';
    map[i,2] = '../image/HP/HP-50.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/9/91/T--NKU_China--HP-51.jpg';
    map[i,2] = '../image/HP/HP-51.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/1/16/T--NKU_China--HP-52.jpg';
    map[i,2] = '../image/HP/HP-52.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/7/7b/T--NKU_China--HP-53.jpg';
    map[i,2] = '../image/HP/HP-53.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/a/ae/T--NKU_China--HP-54.jpg';
    map[i,2] = '../image/HP/HP-54.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/f/f5/T--NKU_China--HP-55.jpg';
    map[i,2] = '../image/HP/HP-55.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/5/52/T--NKU_China--HP-56.jpg';
    map[i,2] = '../image/HP/HP-56.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/0/01/T--NKU_China--HP-57.jpg';
    map[i,2] = '../image/HP/HP-57.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/f/f4/T--NKU_China--HP-58.jpg';
    map[i,2] = '../image/HP/HP-58.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/1/10/T--NKU_China--HP-59.jpg';
    map[i,2] = '../image/HP/HP-59.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/b/bf/T--NKU_China--HP-60.jpg';
    map[i,2] = '../image/HP/HP-60.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/f/f6/T--NKU_China--HP-61.jpg';
    map[i,2] = '../image/HP/HP-61.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/e/e9/T--NKU_China--HP-62.jpg';
    map[i,2] = '../image/HP/HP-62.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/4/4e/T--NKU_China--HP-63.jpg';
    map[i,2] = '../image/HP/HP-63.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/6/60/T--NKU_China--HP-64.jpg';
    map[i,2] = '../image/HP/HP-64.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/b/b8/T--NKU_China--HP-65.jpg';
    map[i,2] = '../image/HP/HP-65.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/c/c0/T--NKU_China--HP-66.jpg';
    map[i,2] = '../image/HP/HP-66.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/a/a5/T--NKU_China--HP-67.jpg';
    map[i,2] = '../image/HP/HP-67.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/0/0c/T--NKU_China--HP-68.jpg';
    map[i,2] = '../image/HP/HP-68.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/c/c8/T--NKU_China--HP-69.jpg';
    map[i,2] = '../image/HP/HP-69.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/4/44/T--NKU_China--HP-70.jpg';
    map[i,2] = '../image/HP/HP-70.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/4/4d/T--NKU_China--HP-71.jpg';
    map[i,2] = '../image/HP/HP-71.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/4/45/T--NKU_China--HP-72.jpg';
    map[i,2] = '../image/HP/HP-72.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/9/93/T--NKU_China--HP-73.jpg';
    map[i,2] = '../image/HP/HP-73.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/5/54/T--NKU_China--HP-74.jpg';
    map[i,2] = '../image/HP/HP-74.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/b/bc/T--NKU_China--HP-75.jpg';
    map[i,2] = '../image/HP/HP-75.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/5/5f/T--NKU_China--HP-76.jpg';
    map[i,2] = '../image/HP/HP-76.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/4/41/T--NKU_China--HP-77.jpg';
    map[i,2] = '../image/HP/HP-77.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/2/27/T--NKU_China--HP-78.jpg';
    map[i,2] = '../image/HP/HP-78.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/4/41/T--NKU_China--HP-79.jpg';
    map[i,2] = '../image/HP/HP-79.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/8/8f/T--NKU_China--HP-80.jpg';
    map[i,2] = '../image/HP/HP-80.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/4/46/T--NKU_China--HP-81.jpg';
    map[i,2] = '../image/HP/HP-81.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/a/a7/T--NKU_China--HP-82.jpg';
    map[i,2] = '../image/HP/HP-82.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/b/bd/T--NKU_China--HP-83.png';
    map[i,2] = '../image/HP/HP-83.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/5/55/T--NKU_China--HP-84.jpg';
    map[i,2] = '../image/HP/HP-84.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/0/0b/T--NKU_China--HP-85.png';
    map[i,2] = '../image/HP/HP-85.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/5/55/T--NKU_China--HP-86.png';
    map[i,2] = '../image/HP/HP-86.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/e/e9/T--NKU_China--notebook-1-5-1.png';
    map[i,2] = '../image/Notebook/notebook-1-5-1.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/d/de/T--NKU_China--notebook-1-5-2.jpeg';
    map[i,2] = '../image/Notebook/notebook-1-5-2.jpeg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/3/3d/T--NKU_China--notebook-1-5-3.png';
    map[i,2] = '../image/Notebook/notebook-1-5-3.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/9/93/T--NKU_China--notebook-1-5-4.png';
    map[i,2] = '../image/Notebook/notebook-1-5-4.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/a/aa/T--NKU_China--notebook-1-5-5.png';
    map[i,2] = '../image/Notebook/notebook-1-5-5.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/7/72/T--NKU_China--notebook-1-5-6.png';
    map[i,2] = '../image/Notebook/notebook-1-5-6.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/9/91/T--NKU_China--notebook-1-5-7.png';
    map[i,2] = '../image/Notebook/notebook-1-5-7.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/d/dc/T--NKU_China--notebook-1-5-8.png';
    map[i,2] = '../image/Notebook/notebook-1-5-8.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/c/c9/T--NKU_China--notebook-1-5-9.png';
    map[i,2] = '../image/Notebook/notebook-1-5-9.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/f/fb/T--NKU_China--notebook-1-5-10.png';
    map[i,2] = '../image/Notebook/notebook-1-5-10.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/e/e0/T--NKU_China--notebook-6-13-1.png';
    map[i,2] = '../image/Notebook/notebook-6-13-1.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/e/eb/T--NKU_China--notebook-6-13-2.png';
    map[i,2] = '../image/Notebook/notebook-6-13-2.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/3/3a/T--NKU_China--notebook-6-13-3.png';
    map[i,2] = '../image/Notebook/notebook-6-13-3.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/4/49/T--NKU_China--notebook-6-13-4.png';
    map[i,2] = '../image/Notebook/notebook-6-13-4.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/3/35/T--NKU_China--notebook-6-13-5.png';
    map[i,2] = '../image/Notebook/notebook-6-13-5.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/a/aa/T--NKU_China--notebook-6-13-6.png';
    map[i,2] = '../image/Notebook/notebook-6-13-6.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/1/17/T--NKU_China--notebook-6-13-7.png';
    map[i,2] = '../image/Notebook/notebook-6-13-7.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/c/c2/T--NKU_China--notebook-6-13-8.png';
    map[i,2] = '../image/Notebook/notebook-6-13-8.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/7/7a/T--NKU_China--notebook-6-13-9.png';
    map[i,2] = '../image/Notebook/notebook-6-13-9.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/a/ad/T--NKU_China--notebook-6-13-10.png';
    map[i,2] = '../image/Notebook/notebook-6-13-10.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/0/00/T--NKU_China--notebook-6-13-11.png';
    map[i,2] = '../image/Notebook/notebook-6-13-11.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/a/a9/T--NKU_China--notebook-6-13-12.png';
    map[i,2] = '../image/Notebook/notebook-6-13-12.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/6/6b/T--NKU_China--notebook-6-13-13.png';
    map[i,2] = '../image/Notebook/notebook-6-13-13.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/a/a4/T--NKU_China--notebook-6-13-14.png';
    map[i,2] = '../image/Notebook/notebook-6-13-14.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/c/c5/T--NKU_China--notebook-6-13-15.png';
    map[i,2] = '../image/Notebook/notebook-6-13-15.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/c/c5/T--NKU_China--notebook-6-13-16.png';
    map[i,2] = '../image/Notebook/notebook-6-13-16.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/f/f1/T--NKU_China--notebook-6-13-17.png';
    map[i,2] = '../image/Notebook/notebook-6-13-17.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/f/f7/T--NKU_China--notebook-14-17-01.png';
    map[i,2] = '../image/Notebook/notebook-14-17-01.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/6/66/T--NKU_China--notebook-14-17-02.png';
    map[i,2] = '../image/Notebook/notebook-14-17-02.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/e/e4/T--NKU_China--notebook-14-17-03.png';
    map[i,2] = '../image/Notebook/notebook-14-17-03.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/8/83/T--NKU_China--notebook-14-17-04.png';
    map[i,2] = '../image/Notebook/notebook-14-17-04.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/b/bc/T--NKU_China--notebook-14-17-05.png';
    map[i,2] = '../image/Notebook/notebook-14-17-05.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/6/65/T--NKU_China--notebook-14-17-06.png';
    map[i,2] = '../image/Notebook/notebook-14-17-06.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/c/ca/T--NKU_China--notebook-14-17-07.png';
    map[i,2] = '../image/Notebook/notebook-14-17-07.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/b/b6/T--NKU_China--notebook-14-17-08.png';
    map[i,2] = '../image/Notebook/notebook-14-17-08.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/e/e1/T--NKU_China--notebook-14-17-09.png';
    map[i,2] = '../image/Notebook/notebook-14-17-09.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/5/5d/T--NKU_China--notebook-14-17-10.png';
    map[i,2] = '../image/Notebook/notebook-14-17-10.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/6/69/T--NKU_China--notebook-14-17-11.png';
    map[i,2] = '../image/Notebook/notebook-14-17-11.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/9/97/T--NKU_China--notebook-14-17-12.png';
    map[i,2] = '../image/Notebook/notebook-14-17-12.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/3/33/T--NKU_China--notebook-14-17-13.png';
    map[i,2] = '../image/Notebook/notebook-14-17-13.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/5/5c/T--NKU_China--notebook-14-17-14.png';
    map[i,2] = '../image/Notebook/notebook-14-17-14.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/5/5b/T--NKU_China--notebook-14-17-15.png';
    map[i,2] = '../image/Notebook/notebook-14-17-15.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/b/b0/T--NKU_China--notebook-14-17-16.png';
    map[i,2] = '../image/Notebook/notebook-14-17-16.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/8/85/T--NKU_China--notebook-14-17-17.png';
    map[i,2] = '../image/Notebook/notebook-14-17-17.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/c/cb/T--NKU_China--notebook-14-17-18.png';
    map[i,2] = '../image/Notebook/notebook-14-17-18.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/5/56/T--NKU_China--notebook-14-17-19.png';
    map[i,2] = '../image/Notebook/notebook-14-17-19.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/7/78/T--NKU_China--notebook-14-17-20.png';
    map[i,2] = '../image/Notebook/notebook-14-17-20.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/e/e2/T--NKU_China--notebook-14-17-21.png';
    map[i,2] = '../image/Notebook/notebook-14-17-21.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/2/24/T--NKU_China--notebook-14-17-22.png';
    map[i,2] = '../image/Notebook/notebook-14-17-22.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/3/30/T--NKU_China--notebook-14-17-23.png';
    map[i,2] = '../image/Notebook/notebook-14-17-23.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/2/22/T--NKU_China--notebook-14-17-24.png';
    map[i,2] = '../image/Notebook/notebook-14-17-24.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/f/f8/T--NKU_China--notebook-18-20-01.png';
    map[i,2] = '../image/Notebook/notebook-18-20-01.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/d/d2/T--NKU_China--notebook-18-20-02.png';
    map[i,2] = '../image/Notebook/notebook-18-20-02.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/4/4c/T--NKU_China--notebook-18-20-03.jpg';
    map[i,2] = '../image/Notebook/notebook-18-20-03.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/f/f7/T--NKU_China--notebook-18-20-04.jpg';
    map[i,2] = '../image/Notebook/notebook-18-20-04.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/d/d9/T--NKU_China--notebook-18-20-05.png';
    map[i,2] = '../image/Notebook/notebook-18-20-05.png';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/3/33/T--NKU_China--notebook-18-20-06.jpg';
    map[i,2] = '../image/Notebook/notebook-18-20-06.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/8/8b/T--NKU_China--notebook-18-20-07.jpg';
    map[i,2] = '../image/Notebook/notebook-18-20-07.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/e/ed/T--NKU_China--notebook-18-20-08.jpg';
    map[i,2] = '../image/Notebook/notebook-18-20-08.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/wiki/images/0/04/T--NKU_China--notebook-18-20-09.jpg';
    map[i,2] = '../image/Notebook/notebook-18-20-09.jpg';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/Template:NKU_China/js/script?action=raw&ctype=text/javascript';
    map[i,2] = 'js/script.js';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/Template:NKU_China/js/wowslider?action=raw&ctype=text/javascript';
    map[i,2] = 'js/wowslider.js';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/Template:NKU_China/js/particlesJS?action=raw&ctype=text/javascript';
    map[i,2] = 'js/particlesJS.js';

    i = i + 1;
    map[i,1] = 'http://2016.igem.org/Template:NKU_China/css/style?action=raw&ctype=text/css';
    map[i,2] = 'css/style.css';

    i = i + 1;
    map[i,1] = '';
    map[i,2] = '../image/';


    map <- map[map[,1] != '',]
    map
}
map <- create_map()

