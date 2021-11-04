
baseurl = "https://www.facebook.com/sharer/sharer.php?u=";
baseTweeturl = "http://twitter.com/share?text=";
function buildFbURL(item) {
    item.href = baseurl + window.location.href;
    return true;
}
function buildTwURL(item) {
    item.href = baseTweeturl + window.location.href + "&hashtags=GameNews";
    return true;
}