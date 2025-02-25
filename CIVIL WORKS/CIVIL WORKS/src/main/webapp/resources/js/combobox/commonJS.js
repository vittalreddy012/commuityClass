/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
$('input').keyup(function(e) {
                    var input = $(this),
                            td = input.closest("td"),
                            next;

                    switch (e.which) {
                        case 37:
                            next = td.prev().find("input");
                            break;
                        case 39:
                            next = td.next().find("input");
                            break;
                        case 38:
                            next = input.closest("tr").prev().find("td:eq(" + td.index() + ")").find("input");
                            break;
                        case 40:
                            next = input.closest("tr").next().find("td:eq(" + td.index() + ")").find("input");
                            break;
                    }

                    if (next) {
                        next.focus();
                    }
                });

 $(document).bind('contextmenu', function(e) {
        e.preventDefault();
        alert('Right Click is not allowed !!');
});
