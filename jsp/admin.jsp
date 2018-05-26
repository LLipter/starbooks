<%@page import="model.*"%>
	<?DOCTYPE HTML>
<html>
	<head>
		<meta charset="utf-8"/>
		<title>UI for Admin</title>
		<link href = "/starbooks/resource/css/reset.css" rel = "stylesheet" type = "text/css"/>
		<!--finished CSS-->
		<link href = "/starbooks/resource/css/admin.css" rel = "stylesheet" type="text/css"/>
		<!--默认查看上架书籍 点击文本替换为下架书籍-->
		<%@ include file="include.jsp" %>
	</head>
	<body>
		<div class = "main">
			<%@ include file="header.jsp" %>
	<div class="banner-top">
			<div class="container">
				<h1>Admin</h1>
				<em></em>
				<h2><a href="/starbooks/jsp/index.jsp">Home</a><label>/</label>Admin</a></h2>
			</div>
		</div>
    	<div class = "container">
			<p class = "admin_hr"></p>
			<div class = "admin_msg">
				<table class = "admin_table">
					<thead>
						<tr>
							<th>off-line stores</th><!--whatever-->
							<th>inventory</th>
							<th>total user number</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th>10</th>
							<th>100</th>
							<th>1000</th>
						</tr>
						</tbody>
				</table>
				<!--不知道能不能实现...-->
			</div>
			<p class = "admin_hr"></p>
			<div class = "content">
				<!--
				<a class = "admin_add" href = "#" target = "_blank">Add books</a> -->
				<!--添加和修改跳转到同一书籍信息界面-->
				<a class = "admin_add" href = "#"><button>Add books</button></a>
				<input class = "book_status" type="button" id = "statusBtn" onclick = "statusChange()" value = "Books on Shelf"/>
				<ul>
					<li>
						<dl>
							<dd>
								<a href = "#">
									<img alt = "book" src = "/starbooks/resource/book/book_01.jpg"/>
								</a>
							</dd>
							<dt>
								<p class = "book_title">
									<a href = "#" target = "_blank">Gift cards</a>
								</p>
								<p class = "book_inline">$25, $50, and $100</p>
								<button type = "button">Remove </button>
								<!--删除书籍-->
								<!--
								<a class = "admin_modify" href = "#" target = "_blank">Modify </a>
								-->
								<a href = "#"><button>Modify</button></a>
							</dt>
						</dl>
					</li>
					<li>
						<dl>
							<dd>
								<a href = "#">
									<img alt = "book" src = "/starbooks/resource/book/book_02.jpg"/>
								</a>
							</dd>
							<dt>
								<p class = "book_title">
									<a href = "#" target = "_blank">Just Enough Research</a>
								</p>
								<p class = "book_inline">by Erika Hall</p>
								<button type = "button">Remove </button>
								<a href = "#"><button>Modify</button></a>
							</dt>
						</dl>
					</li>
					<li>
						<dl>
							<dd>
								<a href = "#">
									<img alt = "book" src = "/starbooks/resource/book/book_03.jpg"/>
								</a>
							</dd>
							<dt>
								<p class = "book_title">
									<a href = "#" target = "_blank">Content Strategy for Mobile</a>
								</p>
								<p class = "book_inline">by Karen McGrane</p>
								<button type = "button">Remove </button>
								<a href = "#"><button>Modify</button></a>
							</dt>
						</dl>
					</li>
					<li>
						<dl>
							<dd>
								<a href = "#">
									<img alt = "book" src = "/starbooks/resource/book/book_04.jpg"/>
								</a>
							</dd>
							<dt>
								<p class = "book_title">
									<a href = "#" target = "_blank">Design Is a Job</a>
								</p>
								<p class = "book_inline">by Mike Monteiro</p>
								<button type = "button">Remove </button>
								<a href = "#"><button>Modify</button></a>
							</dt>
						</dl>
					</li>
					<li>
						<dl>
							<dd>
								<a href = "#">
									<img alt = "book" src = "/starbooks/resource/book/book_05.jpg"/>
								</a>
							</dd>
							<dt>
								<p class = "book_title">
									<a href = "#" target = "_blank">Mobile First</a>
								</p>
								<p class = "book_inline">by Luke Wroblewski</p>
								<button type = "button">Remove </button>
								<a href = "#"><button>Modify</button></a>
							</dt>
						</dl>
					</li>
					<li>
						<dl>
							<dd>
								<a href = "#">
									<img alt = "book" src = "/starbooks/resource/book/book_06.jpg"/>
								</a>
							</dd>
							<dt>
								<p class = "book_title">
									<a href = "#" target = "_blank">Designing for Emotion</a>
								</p>
								<p class = "book_inline">by Aarron Walter</p>
								<button type = "button">Remove </button>
								<a href = "#"><button>Modify</button></a>
							</dt>
						</dl>
					</li>
					<li>
						<dl>
							<dd>
								<a href = "#">
									<img alt = "book" src = "/starbooks/resource/book/book_07.jpg"/>
								</a>
							</dd>
							<dt>
								<p class = "book_title">
									<a href = "#" target = "_blank">Responsive Web Design</a>
								</p>
								<p class = "book_inline">by ethan Marcotte</p>
								<button type = "button">Remove </button>
								<a href = "#"><button>Modify</button></a>
							</dt>
						</dl>
					</li>
					<li>
						<dl>
							<dd>
								<a href = "#">
									<img alt = "book" src = "/starbooks/resource/book/book_08.jpg"/>
								</a>
							</dd>
							<dt>
								<p class = "book_title">
									<a href = "#" target = "_blank">CSS3 for Web Designers</a>
								</p>
								<p class = "book_inline">by Dan Cederholm</p>
								<button type = "button">Remove </button>
								<a href = "#"><button>Modify</button></a>
							</dt>
						</dl>
					</li>
					<li>
						<dl>
							<dd>
								<a href = "#">
									<img alt = "book" src = "/starbooks/resource/book/book_09.jpg"/>
								</a>
							</dd>
							<dt>
								<p class = "book_title">
									<a href = "#" target = "_blank">HTML5 for Web Designers</a>
								</p>
								<p class = "book_inline">by Jeremy Keith</p>
								<button type = "button">Remove </button>
								<a href = "#"><button>Modify</button></a>
							</dt>
						</dl>
					</li>
					<li>
						<dl>
							<dd>
								<a href = "#">
									<img alt = "book" src = "/starbooks/resource/book/book_10.jpg"/>
								</a>
							</dd>
							<dt>
								<p class = "book_title">
									<a href = "#" target = "_blank">On Web Typography</a>
								</p>
								<p class = "book_inline">by Jason Santa Maria</p>
								<button type = "button">Remove </button>
								<a href = "#"><button>Modify</button></a>
							</dt>
						</dl>
					</li>
					<li>
						<dl>
							<dd>
								<a href = "#">
									<img alt = "book" src = "/starbooks/resource/book/book_11.jpg"/>
								</a>
							</dd>
							<dt>
								<p class = "book_title">
									<a href = "#" target = "_blank">Responsible Responsive Design</a>
								</p>
								<p class = "book_inline">by Scott Jehl</p>
								<button type = "button">Remove </button>
								<a href = "#"><button>Modify</button></a>
							</dt>
						</dl>
					</li>
					<li>
						<dl>
							<dd>
								<a href = "#">
									<img alt = "book" src = "/starbooks/resource/book/book_12.jpg"/>
								</a>
							</dd>
							<dt>
								<p class = "book_title">
									<a href = "#" target = "_blank">OnWebTypgra</a>
								</p>
								<p class = "book_inline">by Jason Santa Maria</p>
								<button type = "button">Remove </button>
								<a href = "#"><button>Modify</button></a>
							</dt>
						</dl>
					</li>
				</ul>
			</div>
		</div>

		<%@ include file="footer.jsp" %>
	</body>
</html>