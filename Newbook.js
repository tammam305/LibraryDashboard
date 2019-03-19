                            
function validate()
	{
		var eisbn = document.getElementById("eisbn");
		var ebott = document.getElementById("ebott");
		var eauth = document.getElementById("eauth");
		var epubName = document.getElementById("epubName");
		var epubYer = document.getElementById("epubYer");
		var eEditi = document.getElementById("eEditi");
		var eQua = document.getElementById("eQua");
		var eimage = document.getElementById("eimage");
		var isbn = document.add.isbn.value;
		var bookname = document.add.bookname.value;
		var author = document.add.author.value;
		var publisher = document.add.publisher.value;
		var year = document.add.year.value;
		var edition = document.add.edition.value;
		var qty = document.add.qty.value;
		var image = document.add.image.value;

		var e = 1;

		if(isbn === "")
			{
				e = 0;
				eisbn.setAttribute("style","visibility: visible");
			}
		else
			{
				eisbn.setAttribute("style","visibility: hidden"); 
			}
		if(bookname === "")
			{
				e = 0;
				ebott.setAttribute("style","visibility: visible");
			}
		else
			{
				ebott.setAttribute("style","visibility: hidden"); 
			}
		if(author === "")
			{
				e = 0;
				eauth.setAttribute("style","visibility: visible");
			}
		else
			{
				eauth.setAttribute("style","visibility: hidden"); 
			}
		 if(publisher === "")
			{
				e = 0;
				epubName.setAttribute("style","visibility: visible");
			}
		else
			{
				epubName.setAttribute("style","visibility: hidden"); 
			}
		if(year === "")
			{
				e = 0;
				epubYer.setAttribute("style","visibility: visible");
			}
		else
			{
				epubYer.setAttribute("style","visibility: hidden"); 
			}
		if(edition === "")
			{
				e = 0;
				eEditi.setAttribute("style","visibility: visible");
			}
		else
			{
				eEditi.setAttribute("style","visibility: hidden"); 
			}
		if(qty === "")
			{
				e = 0;
				eQua.setAttribute("style","visibility: visible");
			}
		else
			{
				eQua.setAttribute("style","visibility: hidden"); 
			}
		if(image === "")
			{
				e = 0;
				eimage.setAttribute("style","visibility: visible");
			}
		else
			{
				eimage.setAttribute("style","visibility: hidden"); 
			}

		if(e == 1)
			{
				return true;
			}
		else
			{

				return false;
			}

	}


//check if the book available in the library or not. if not disable the loan button
(function()
{
	
})();