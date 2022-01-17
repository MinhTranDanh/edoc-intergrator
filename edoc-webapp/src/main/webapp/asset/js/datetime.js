Date.prototype.formatDate = function () {
    let dd = this.getDate();
    let mm = this.getMonth();
    mm = mm + 1;

    return [(dd > 9 ? '' : '0') + dd,
        (mm > 9 ? '' : '0') + mm,
        this.getUTCFullYear()   //lâm đồng
       /* this.getFullYear()*/   // tây ninh
    ].join('/');
};
Date.prototype.formatTime = function () {
    let hh = this.getHours();
    let mm = this.getMinutes();
    let ss = this.getSeconds();

    return [(hh > 9 ? '' : '0') + hh, (mm > 9 ? '' : '0') + mm, (ss > 9 ? '' : '0') + ss].join(":");
};

function convertToDate(dateValue) {
    return new Date(dateValue);
}
function getDate() {
    return new Date();
}
function getCurrentMonth() {
    return new Date().getMonth();
}

function getCurrentYear() {
    return new Date().getFullYear();
}
