$(document).ready(function() {
    // 서브메뉴 타이틀에 호버 이벤트를 추가합니다.
    $('.sub-menu-title').mouseenter(function() {
        // 현재 호버된 서브메뉴 타이틀과 그에 해당하는 서브메뉴를 찾습니다.
        var subMenuTitle = $(this);
        var subMenu = subMenuTitle.next('ul');

        // 다른 활성화된 서브메뉴들은 숨김 처리하고 클래스를 제거합니다.
        $('.sub-menu').not(subMenu).removeClass('active').find('ul').slideUp();

        // 클릭된 서브메뉴의 활성화 상태를 토글합니다.
        subMenu.toggleClass('active');

        // 클릭된 서브메뉴가 활성화되었다면 슬라이드 애니메이션으로 서브메뉴를 펼치고, 그렇지 않다면 숨김 처리합니다.
        if (subMenu.hasClass('active')) {
            subMenu.slideDown();
        } else {
            subMenu.slideUp();
        }
    });

    // 서브메뉴 영역을 벗어났을 때 숨김 처리합니다.
    $('.sub-menu').mouseleave(function() {
        $(this).removeClass('active').find('ul').slideUp();
    });

    $('a.custom-link').css({
        'text-decoration': 'none',
        'color': '#ffffff'
    });
});
