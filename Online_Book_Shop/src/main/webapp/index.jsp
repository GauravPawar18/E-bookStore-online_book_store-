<%@page import="java.sql.*"%>
<%@include file="navbar.jsp"%>
<section id="home-section" class="hero">
	<div class="home-slider owl-carousel">
		<div class="slider-item"
			style="background-image: url(images/grocery2.jpg);">
			<div class="overlay"></div>
			<div class="container">
				<div
					class="row slider-text justify-content-center align-items-center"
					data-scrollax-parent="true"></div>
			</div>
		</div>

		<div class="slider-item"
			style="background-image: url(images/bg_2.jpg);">
			<div class="overlay"></div>
			<div class="container">
				<div
					class="row slider-text justify-content-center align-items-center"
					data-scrollax-parent="true"></div>
			</div>
		</div>
	</div>
</section>

<section class="ftco-section">
	<div class="container">
		<div class="row no-gutters ftco-services">
			<div
				class="col-md-3 text-center d-flex align-self-stretch ftco-animate">
				<div class="media block-6 services mb-md-0 mb-4">
					<div
						class="icon bg-color-1 active d-flex justify-content-center align-items-center mb-2">
						<span class="flaticon-shipped"></span>
					</div>
					<div class="media-body">
						<h3 class="heading">Free Shipping</h3>
						<span>On order over $100</span>
					</div>
				</div>
			</div>
			<div
				class="col-md-3 text-center d-flex align-self-stretch ftco-animate">
				<div class="media block-6 services mb-md-0 mb-4">
					<div
						class="icon bg-color-2 d-flex justify-content-center align-items-center mb-2">
						<span class="flaticon-speed"></span>
					</div>
					<div class="media-body">
						<h3 class="heading">Fast Process</h3>
						<span>Product well package</span>
					</div>
				</div>
			</div>
			<div
				class="col-md-3 text-center d-flex align-self-stretch ftco-animate">
				<div class="media block-6 services mb-md-0 mb-4">
					<div
						class="icon bg-color-3 d-flex justify-content-center align-items-center mb-2">
						<span class="flaticon-award"></span>
					</div>
					<div class="media-body">
						<h3 class="heading">Superior Quality</h3>
						<span>Quality Products</span>
					</div>
				</div>
			</div>
			<div
				class="col-md-3 text-center d-flex align-self-stretch ftco-animate">
				<div class="media block-6 services mb-md-0 mb-4">
					<div
						class="icon bg-color-4 d-flex justify-content-center align-items-center mb-2">
						<span class="flaticon-customer-service"></span>
					</div>
					<div class="media-body">
						<h3 class="heading">Support</h3>
						<span>24/7 Support</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<section class="ftco-section ftco-category ftco-no-pt">
	<div class="container">
		<div class="row">
			<div class="col-md-8">
				<div class="row">
					<div class="col-md-6 order-md-last align-items-stretch d-flex">
						<div
							class="category-wrap-2 ftco-animate img align-self-stretch d-flex"
							style="background-image: url(images/category.jpg);">
							<div class="text text-center">
								<h2>Book</h2>
								<p>Read and Understand</p>
								
							</div>
						</div>
					</div>
					<div class="col-md-6">
	
						<a href="Catindex.jsp?cat=Art And Culture">
						<div
							class="category-wrap ftco-animate img mb-4 d-flex align-items-end"
							style="background-image: url(images/category-1.jpg);">
							<div class="text px-3 py-1">
								<h2 class="mb-0">
									Art & Culture
								</h2>
							</div>
						</div>
						</a>
						<a href="Catindex.jsp?cat=Sports"><div class="category-wrap ftco-animate img d-flex align-items-end" style="background-image: url(images/bg_3.jpg);">
							<div class="text px-3 py-1">
								<h2 class="mb-0">
									Sports
								</h2>
							</div>
						</div></a>
				
					</div>
				</div>
			</div>

			<div class="col-md-4">
			<a href="Catindex.jsp?cat=Business">
				<div
					class="category-wrap ftco-animate img mb-4 d-flex align-items-end"
					style="background-image: url(images/kaju96.jpg);">
					<div class="text px-3 py-1">
						<h2 class="mb-0">
							Business
						</h2>
					</div>
				</div>
				</a>
				<a href="Catindex.jsp?cat=Astrology">
				<div class="category-wrap ftco-animate img d-flex align-items-end"
					style="background-image: url(images/category-4.jpg);">
					<div class="text px-3 py-1">
						<h2 class="mb-0">
							Astrology
						</h2>
					</div>
				</div>
				</a>
			</div>
		</div>
	</div>
</section>

<section class="ftco-section">
	<div class="container">
		<div class="row justify-content-center mb-3 pb-3">
			<div class="col-md-12 heading-section text-center ftco-animate">
				<span class="subheading">Featured Products</span>
				<h2 class="mb-4">Our Products</h2>
				<p>Far far away, behind the word mountains, far from the
					countries Vokalia and Consonantia</p>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">

			    <%
					try {
						Connection con1 = DbConnect.Connect();
						Statement st = con1.createStatement();
						ResultSet rs = st.executeQuery("select * from products where featured='Yes'");
						int i = 0;
						while (rs.next()) {
							i++;
				%>
				<div class="col-md-6 col-lg-3 ftco-animate">
    				<div class="product">
    					<a href="cart1.jsp?prodid=<%= rs.getInt("prodid")%>&qty=1" class="img-prod">
    					<img class="img-fluid" src="images2/<%= rs.getString("photo")%>" alt="Colorlib Template">
    					</a>
    					<div class="text py-3 pb-4 px-3 text-center">
    						<h3><a href="#"><%= rs.getString("pname")%></a></h3>
    						<div class="d-flex">
    							<div class="pricing">
		    						<p class="price"><span class="mr-2 price-dc">&#8377;<%= rs.getString("price")%></span><span class="price-sale">&#8377;<%= rs.getString("disc_price")%></span></p>
		    					</div>
	    					</div>
	    					
	    					<div class="bottom-area d-flex px-3">
	    					<% if (!rs.getString("instock").equals("In Stock")) {%>
	    					<div style="transform: rotate(360deg);position:relative;top:-130px ; width : 200px">
                               <div class="alert alert-warning font-weight-bold p-2 ">
                                     <%= rs.getString("instock")%>
                               </div>
                            </div> 
                           	    				
	    						<div class="m-auto d-flex">
	    							<a href="javascript:void(0)" class="add-to-cart d-flex justify-content-center align-items-center text-center">
	    								<span><i class="ion-ios-menu"></i></span>
	    							</a>
	    							<a href="javascript:void(0)" class="buy-now d-flex justify-content-center align-items-center mx-1">
	    								<span><i class="ion-ios-cart"></i></span>
	    							</a>
	    							
    							</div>
    							<% } else { %>
    							<div class="m-auto d-flex">
	    							<a href="cart1.jsp?prodid=<%= rs.getInt("prodid")%>" class="add-to-cart d-flex justify-content-center align-items-center text-center">
	    								<span><i class="ion-ios-menu"></i></span>
	    							</a>
	    							<a href="Operation?prodid=<%= rs.getInt("prodid")%>&qty=1" class="buy-now d-flex justify-content-center align-items-center mx-1">
	    								<span><i class="ion-ios-cart"></i></span>
	    							</a>
	    							
	    							
    							</div>
    						   <% } %>	
    						</div>
    						
    					</div>
    				</div>
    			</div>
				<%
					}
					} catch (Exception e) {
						System.out.println(e);
					}
				%>
		</div>
	</div>
</section>

<%@include file="footer.jsp"%>