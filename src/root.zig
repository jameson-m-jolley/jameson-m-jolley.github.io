const std = @import("std");
const testing = std.testing;

//html tag gen in wasum
const attributes = enum(u8) {
    id,
    class,
    style,
    src,
    href,
    alt,
    _type,
    value,
    placeholder,
    width,
    height,
    lang,
    title,
    none,
};

const tags = enum(u8) {
    a,
    abbr,
    address,
    area,
    article,
    aside,
    audio,
    b,
    base,
    bdi,
    bdo,
    blockquote,
    body,
    br,
    button,
    canvas,
    caption,
    cite,
    code,
    col,
    colgroup,
    data,
    datalist,
    dd,
    del,
    details,
    dfn,
    dialog,
    div,
    dl,
    dt,
    em,
    embed,
    fieldset,
    figcaption,
    figure,
    footer,
    form,
    h1,
    h2,
    h3,
    h4,
    h5,
    h6,
    head,
    header,
    hr,
    html,
    i,
    iframe,
    img,
    input,
    ins,
    kbd,
    label,
    legend,
    li,
    link,
    main,
    map,
    mark,
    meta,
    meter,
    nav,
    noscript,
    object,
    ol,
    optgroup,
    option,
    output,
    p,
    param,
    picture,
    pre,
    progress,
    q,
    rb,
    rp,
    rt,
    rtc,
    ruby,
    s,
    samp,
    script,
    section,
    select,
    small,
    source,
    span,
    strong,
    style,
    sub,
    summary,
    sup,
    table,
    tbody,
    td,
    template,
    textarea,
    tfoot,
    th,
    thead,
    time,
    title,
    tr,
    track,
    u,
    ul,
    _var,
    video,
    wbr,
    _,
};

const Attribute = struct {
    val: *const []u8 = undefined,
    tag: attributes,
};

export fn html(tag:tags,attribute: *const[]Attribute,innerHTML: *const []u8) *const []u8{
    var ret = "";
    switch (tag) {
        tag.br => {
            ret += "<br";
            },
        tags.img => {
            ret += "<img";
            },
        tags.link => {
            ret += "<link";
            },
        else => {
            const tagname = @tagName(tag);
            defer ret += "</"++tagname++">";
            ret += "<"++tagname;
            },
        }
        for(attribute)|a|{
            ret += @tagName(a.tag) ++ "=" ++ "\"" ++ a.val++"\"";
        }
        ret += ">";
        ret += innerHTML;
        return ret;
}
test "html tags"{
    try testing.expectEqualStrings("<div class=\"cool\" >this is inside</div>", html(tags.div,[_]Attribute{.{"cool",attributes.class}},"this is inside"));
}
