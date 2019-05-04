<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="mainheader.jsp" %>
											
		<!-- Isotope -->
		<script src="js/main/jquery.isotope.min.js"></script>
						
											
													
<section data-id="49c46783" class="elementor-element elementor-section-boxed elementor-section-height-default elementor-section-height-default elementor-section elementor-top-section" data-element_type="section">
	<div class="elementor-container elementor-column-gap-default">
		<div class="elementor-row">
			<div data-id="22bb505b" class="elementor-element elementor-element-22bb505b elementor-column elementor-col-100 elementor-top-column" data-element_type="column">
				<div class="elementor-column-wrap elementor-element-populated">
					<div class="elementor-widget-wrap">
						<div data-id="6f6ccfa" class="elementor-element elementor-element-6f6ccfa elementor-widget elementor-widget-athemes-portfolio" data-element_type="athemes-portfolio.default">
							<div class="elementor-widget-container">
								<div class="athemes-project-wrap portfolio-section style1">
									<ul class="project-filter clearfix" id="filters">
										<li><a href="#" data-filter='.top10'>Top10</a></li>
										<li><a href='#' data-filter='.new'>신규</a></li>
										<li><a href='#' data-filter='.deadline'>마감임박</a></li>
										<li><a href='#' data-filter='.beopen'>오픈예정</a></li>
										<li><a href='#' data-filter='.end'>종료</a></li>
									</ul>
									<div class="roll-project fullwidth loading isotope-container">
										<div class="loading-notice">Loading...</div>
										<div class="isotope-container" data-portfolio-effect="fadeInUp">
										
								
									<c:forEach items="${topList}" var="list">	
											<div class="project-item item isotope-item top10">
												<div class="project-inner">																			
													<div class="project-info">
														<h2 class="project-title">														
															<a href="/../earlybud/reward?item_code=<c:out value="${list.ITEM_CODE}"/>"><c:out value="${list.TITLE}"/></a>
														</h2>
													</div>
													<a href="/../earlybud/reward?item_code=<c:out value="${list.ITEM_CODE}"/>"><img src="${pageContext.request.contextPath}/uploads/reward/<c:out value="${list.MAIN_IMAGE}"/>"></a>
												</div>
											</div>
									</c:forEach>
									<c:forEach items="${newList}" var="list">	
											<div class="project-item item isotope-item new">
												<div class="project-inner">																			
													<div class="project-info">
														<h2 class="project-title">														
															<a href="/../earlybud/reward?item_code=<c:out value="${list.ITEM_CODE}"/>"><c:out value="${list.TITLE}"/></a>
														</h2>
													</div>
													<a href="/../earlybud/reward?item_code=<c:out value="${list.ITEM_CODE}"/>"><img src="${pageContext.request.contextPath}/uploads/reward/<c:out value="${list.MAIN_IMAGE}"/>"></a>
												</div>
											</div>
									</c:forEach>
									<c:forEach items="${deadLineList}" var="list">	
											<div class="project-item item isotope-item deadline">
												<div class="project-inner">																			
													<div class="project-info">
														<h2 class="project-title">														
															<a href="/../earlybud/reward?item_code=<c:out value="${list.ITEM_CODE}"/>"><c:out value="${list.TITLE}"/></a>
														</h2>
													</div>
													<a href="/../earlybud/reward?item_code=<c:out value="${list.ITEM_CODE}"/>"><img src="${pageContext.request.contextPath}/uploads/reward/<c:out value="${list.MAIN_IMAGE}"/>"></a>
												</div>
											</div>
									</c:forEach>
									<c:forEach items="${beOpenList}" var="list">	
											<div class="project-item item isotope-item beopen">
												<div class="project-inner">																			
													<div class="project-info">
														<h2 class="project-title">														
															<a href="/../earlybud/reward?item_code=<c:out value="${list.ITEM_CODE}"/>"><c:out value="${list.TITLE}"/></a>
														</h2>
													</div>
													<a href="/../earlybud/reward?item_code=<c:out value="${list.ITEM_CODE}"/>"><img src="${pageContext.request.contextPath}/uploads/reward/<c:out value="${list.MAIN_IMAGE}"/>"></a>
												</div>
											</div>
									</c:forEach>
									<c:forEach items="${endList}" var="list">	
											<div class="project-item item isotope-item end">
												<div class="project-inner">																			
													<div class="project-info">
														<h2 class="project-title">														
															<a href="/../earlybud/reward?item_code=<c:out value="${list.ITEM_CODE}"/>"><c:out value="${list.TITLE}"/></a>
														</h2>
													</div>
													<a href="/../earlybud/reward?item_code=<c:out value="${list.ITEM_CODE}"/>"><img src="${pageContext.request.contextPath}/uploads/reward/<c:out value="${list.MAIN_IMAGE}"/>"></a>
												</div>
											</div>
									</c:forEach>
									



										</div>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<%@include file="mainfooter.jsp" %>								