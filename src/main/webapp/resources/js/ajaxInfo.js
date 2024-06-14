/**
 * 
 */
 
 let data = null;
// 
function loadList() {
    return new Promise((resolve, reject) => {
        $.ajax({
            url: "data/location", // 요청 경로
            type: "get",
            dataType: "json", // 서버에서 반환받는 데이터 형식
            success: function(data) {
                resolve(data);
            },
            error: function() {
                reject(new Error("통신 실패"));
            }
        });
    });
}
	
function getValue()
{
	if(data ===null)
	{
		return data;
	}
}	
	