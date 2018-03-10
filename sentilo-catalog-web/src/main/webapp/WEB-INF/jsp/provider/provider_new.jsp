<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/header.jsp"%>
<%@include file="/WEB-INF/jsp/common/taglibs.jsp"%>

<c:if test="${mode == 'edit' }">
	<spring:url value="/admin/provider/${provider.id}/edit" var="actionURL" />
	<spring:message code="provider.edit.title" var="pageTitle" />
	<spring:url value="/admin/provider/${provider.id}/detail" var="backURL" />
	<spring:eval var="showAdminControls" expression="T(org.sentilo.web.catalog.security.SecurityUtils).showAdminControls('EDIT',provider)"/>
</c:if>
<c:if test="${mode == 'create' }">
	<spring:url value="/admin/provider/create" var="actionURL" />
	<spring:message code="provider.new.title" var="pageTitle" />
	<spring:url value="/admin/provider/list?nameTableRecover=providerTable&fromBack=true" var="backURL" />
	<spring:eval var="showAdminControls" expression="T(org.sentilo.web.catalog.security.SecurityUtils).showAdminControls('CREATE','org.sentilo.web.catalog.domain.Provider')"/>
</c:if>

<div class="container-fluid">
	<div class="content">
		<div class="row-fluid">
			<div class="span3">
				<%@include file="/WEB-INF/jsp/common/include_sidebar.jsp"%>
			</div>
			<div class="span9">

				<%@include file="/WEB-INF/jsp/common/include_background_logo.jsp"%>
				<%@include file="/WEB-INF/jsp/common/messages.jsp"%>

				<h1 class="lead">
					${pageTitle}<br />
				</h1>

				<form:form method="post" modelAttribute="provider" action="${actionURL}" class="form-horizontal">
					<c:choose>
						<c:when test="${mode == 'create' }">
							<input type="hidden" id="tenantId" name="tenantId" value="${tenantId}" />
						</c:when>
						<c:otherwise>
							<form:hidden path="tenantId" />
						</c:otherwise>
					</c:choose>
					<fieldset>
						<%@include file="/WEB-INF/jsp/common/include_input_token.jsp"%>
						<div class="control-group">
							<form:label path="id" class="control-label">
								<spring:message code="provider.id" />
							</form:label>
							<div class="controls">
								<c:if test="${mode == 'create' }">
									<c:if test="${multitenantIsEnabled}">
										<span class="label">${tenantId}@</span>
									</c:if>
									<form:input path="id" />
								</c:if>
								<c:if test="${mode == 'edit' }">
									<form:input path="id" readonly="true" />
									<form:hidden path="createdAt" />
									<form:hidden path="createdBy" />
								</c:if>
								<form:errors path="id" cssClass="text-error" htmlEscape="false" />
							</div>
						</div>
						<div class="control-group">
							<form:label path="name" class="control-label">
								<spring:message code="provider.name" />
							</form:label>
							<div class="controls">
								<form:input path="name" />
								<form:errors path="name" cssClass="text-error" htmlEscape="false" />
							</div>
						</div>
						<div class="control-group">
							<form:label path="description" class="control-label">
								<spring:message code="provider.description" />
							</form:label>
							<div class="controls">
								<form:textarea path="description" />
								<form:errors path="description" cssClass="text-error" htmlEscape="false" />
							</div>
						</div>
						<div class="control-group">
							<form:label path="restHttps" class="control-label">
								<spring:message code="provider.restHttps" />
							</form:label>
							<div class="controls">
								<form:checkbox path="restHttps" />
								<form:errors path="restHttps" cssClass="text-error" htmlEscape="false" />
							</div>
						</div>
					</fieldset>
					<fieldset>
						<legend>
							<spring:message code="provider.contacts" />
						</legend>
						<div class="control-group">
							<form:label path="contact.name" class="control-label">
								<spring:message code="provider.contact.name" />
							</form:label>
							<div class="controls">
								<form:input path="contact.name" />
								<form:errors path="contact.name" cssClass="text-error" htmlEscape="false" />
							</div>
						</div>
						<div class="control-group">
							<form:label path="contact.email" class="control-label">
								<spring:message code="provider.contact.email" />
							</form:label>
							<div class="controls">
								<form:input path="contact.email" />
								<form:errors path="contact.email" cssClass="text-error" htmlEscape="false" />
							</div>
						</div>
						<div class="control-group">
							<div class="controls">
								<%@include file="/WEB-INF/jsp/common/include_input_back.jsp"%>
								<c:if test="${showAdminControls}">
								<a href="#" onclick="$('form#provider').submit();" class="btn btn-success">
									<spring:message code="button.save" />
								</a>
								</c:if>
							</div>
						</div>
					</fieldset>
				</form:form>
			</div>
		</div>
	</div>
</div>
<%@include file="/WEB-INF/jsp/common/footer.jsp"%>