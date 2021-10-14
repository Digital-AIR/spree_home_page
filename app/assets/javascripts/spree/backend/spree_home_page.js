$(function() {
    $("select#home_page_top_brand_vendor_id").on("change", function() {
         $.ajax({
            url:  "/filter_videos_by_vendor",
            type: "GET",
            data: { selected_vendor: $("select#home_page_top_brand_vendor_id	").val() }
        });
    });
});